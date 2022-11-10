//
//  SwiftUIView.swift
//  MovieCatalog
//
//  Created by  Aleksey Feofilov on 27.10.2022.
//

import SwiftUI

struct MainScreen: View {
    @ObservedObject var viewModel: MainScreenViewModel
    
    var body: some View {
        ZStack{
            Color("BackgroundColor")
                .ignoresSafeArea()
            
            
            VStack{
                if viewModel.promotedMovie?.poster != nil {
                    PromotedMovie(url: viewModel.promotedMovie!.poster!)
                }
                
                if viewModel.favoriteMovies != nil {
                    if  viewModel.favoriteMovies!.count != 0 {
                        TitleTextView("Избранное")
                            .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 0))
                        FavoriteStack(viewModel: FavoriteStackViewModel(viewModel.favoriteMovies!, isAuthorized: viewModel.$isAuthorized))
                    }
                }
                
                if viewModel.movies != nil && viewModel.movies!.count != 0 {
                    TitleTextView("Галерея")
                        .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 0))
                    GeometryReader { outerProxy in
                        ScrollView(.vertical, showsIndicators: false){
                            LazyVStack(spacing: 16){
                                ForEach(viewModel.movies ?? []) { movie in
                                    ZStack {
                                        GeometryReader { geometry in
                                            Rectangle()
                                                .fill(Color.orange.opacity(0))
                                                .onChange(of: geometry.frame(in: .named(favoriteStackScrollView))) { imageRect in
                                                    if isViewFirst(innerRect: imageRect, isIn: outerProxy) {
                                                        viewModel.currentGaleryMovie.wrappedValue = (viewModel.movies!.firstIndex(where: { it in
                                                            it.id == movie.id
                                                        }))! + 1
                                                        //print(viewModel.currentGaleryMovie)
                                                    }
                                                }
                                        }
                                        
                                        GalleryMovie(viewModel: GaleryMovieViewModel(movie))
                                    }
                                }
                            }
                        }
                        .coordinateSpace(name: galeryStackScrollView)
                        .padding(.leading, 16)
                    }
                }
                else {
                    Text("Здесь пока ничего нет")
                        .foregroundColor(.accentColor)
                }
            }
        }
    }
    
    private func isViewFirst(innerRect:CGRect, isIn outerProxy:GeometryProxy) -> Bool {
        let innerOrigin = innerRect.origin.y
        let imageHeight = innerRect.height
        let scrollOrigin = outerProxy.frame(in: .global).origin.y
        let scrollHeight = outerProxy.size.height
        
        if innerOrigin > scrollOrigin && innerOrigin < scrollOrigin + imageHeight + smallPadding {
            return true
        }
        return false
    }
}

struct MainScreen_Previews: PreviewProvider {
    static var previews: some View {
        MainScreen(viewModel: MainScreenViewModel(isAuthorized: .constant(true)))
    }
}

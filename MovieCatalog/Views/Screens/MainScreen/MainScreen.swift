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
            
            
            VStack{
                if viewModel.promotedMovie?.poster != nil {
                    PromotedMovie(url: viewModel.promotedMovie!.poster!, id: viewModel.promotedMovie!.id, currentMovieId: viewModel.$currentMovieId)
                        .ignoresSafeArea()
                }
                
                if viewModel.favoriteMovies != nil {
                    if  viewModel.favoriteMovies!.count != 0 {
                        TitleTextView("Избранное")
                            .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 0))
                        FavoriteStack(viewModel: FavoriteStackViewModel(viewModel.favoriteMovies!, isAuthorized: viewModel.$isAuthorized, currentMovieId: $viewModel.currentMovieId))
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
                                                .onChange(of: geometry.frame(in: .named(Keys.favoriteStackScrollView))) { imageRect in
                                                    if isViewFirst(innerRect: imageRect, isIn: outerProxy) {
                                                        viewModel.currentGaleryMovie.wrappedValue = (viewModel.movies!.firstIndex(where: { it in
                                                            it.id == movie.id
                                                        }))! + 1
                                                        //print(viewModel.currentGaleryMovie)
                                                    }
                                                }
                                        }
                                        
                                        GalleryMovie(viewModel: GaleryMovieViewModel(movie))
                                            .onTapGesture {
                                                viewModel.currentMovieId = movie.id
                                            }
                                    }
                                }
                            }
                        }
                        .coordinateSpace(name: Keys.galleryStackScrollView)
                        .padding(.leading, 16)
                    }
                }
                else {
                    ProgressView()
                }
            }
        }
        
        .ignoresSafeArea(edges: .top)
    }
    
    private func isViewFirst(innerRect:CGRect, isIn outerProxy:GeometryProxy) -> Bool {
        let innerOrigin = innerRect.origin.y
        let imageHeight = innerRect.height
        let scrollOrigin = outerProxy.frame(in: .global).origin.y
        
        if innerOrigin > scrollOrigin && innerOrigin < scrollOrigin + imageHeight + smallPadding {
            return true
        }
        return false
    }
}

struct MainScreen_Previews: PreviewProvider {
    static var previews: some View {
        MainScreen(viewModel: MainScreenViewModel(isAuthorized: .constant(true), currentMovieId: .constant("")))
    }
}

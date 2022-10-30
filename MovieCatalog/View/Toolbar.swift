//
//  Toolbar.swift
//  MovieCatalog
//
//  Created by  Aleksey Feofilov on 30.10.2022.
//

import SwiftUI

struct Toolbar: View {
    @State var offset: CGFloat = 0
    
    var body: some View {
        ZStack {
            VStack {
                AsyncImage(url: URL(string: "https://sun9-43.userapi.com/impf/c854220/v854220563/136392/vCakNgKV8ho.jpg?size=568x608&quality=96&sign=f4deffe9d8c70e8c617d43e8779afff5&type=album")){phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                        
                    case .success(let image):
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(height: offset < 0 ? 0 : offset > 200 ? 200 : offset)
                            .clipped()
                        
                        
                    case .failure:
                        Image("ProfileImage")
                        
                    @unknown default:
                        EmptyView()
                    }
                }
                .overlay(
                    Rectangle()
                        .fill(.black)
                        .opacity(offset < 0 ? 1 : offset > 200 ? 0 : 1 - Double(offset / 200))
                )
                
                Spacer()
            }
            
            
            VStack {
                VStack {
                    Spacer()
                    
                    HStack{
                        Spacer()
                            .frame(width: offset < 0 ? 52 : offset > 200 ? 16 : 52 - offset / 200 * 36)
                        Text("Moview name")
                            .font(.system(size: offset < 0 ? 24 : offset > 200 ? 36 : offset / 200 * 12 + 24))
                            .foregroundColor(.white)
                        Spacer()
                        Image(systemName: "heart")
                            .opacity(offset < 0 ? 1 : offset > 200 ? 0 : 1 - Double(offset / 200))
                            .foregroundColor(Color.accentColor)
                    }
                    .padding(.horizontal)
                }
                .frame(height: offset < 0 ? 0 : offset > 200 ? 200 : offset)
                Spacer()
            }
            
            GeometryReader{geometry in
                ScrollView(.vertical, showsIndicators: false){
                    VStack{
                        Spacer()
                            .frame(height: 216)
                        GeometryReader{ proxy in
                            Text("sdfsdfdsf")
                                .onAppear(){
                                    offset = proxy.frame(in: .named("scrollView")).origin.y
                                }
                                .onChange(of: proxy.frame(in: .named("scrollView"))) { newValue in
                                    offset = newValue.origin.y
                                    print(offset)
                                }
                        }
                        Spacer()
                            .frame(height: 300)
                        Text("sdfsdfdsf")
                        Spacer()
                            .frame(height: 300)
                        Text("sdfsdfdsf")
                        Spacer()
                            .frame(height: 300)
                        Text("sdfsdfdsf")
                        Spacer()
                            .frame(height: 300)
                        Text("sdfsdfdsf")
                    }
                }
                .coordinateSpace(name: "scrollView")
            }
        }
        .ignoresSafeArea()
    }
}
/*
struct FavoriteStack: View {
    var movie: [FavoriteMovie]
    @State private var firstVisibleMovie: Int = -1
    
    var body: some View {
        GeometryReader { outerProxy in
            ScrollView(.horizontal, showsIndicators: false){
                LazyHStack(alignment: .top, spacing: 16) {
                    ForEach(movie) { movie in
                        ZStack {
                            GeometryReader { geometry in
                                Rectangle()
                                    .fill(Color.orange.opacity(0))
                                    .onChange(of: geometry.frame(in: .named("scrollView"))) { imageRect in
                                        if isViewFirst(innerRect: imageRect, isIn: outerProxy) {
                                            firstVisibleMovie = movie.id
                                        }
                                    }
                            }
                            
                            movie
                                .frame(maxWidth: movie.id == firstVisibleMovie ? 120 : 100, maxHeight: movie.id == firstVisibleMovie ? 172 : 144)
                                .animation(.easeIn(duration: 0.3), value: firstVisibleMovie)
                        }
                    }
                }
            }
            .coordinateSpace(name: "scrollView")
        }
    }
    
    private func isViewFirst(innerRect:CGRect, isIn outerProxy:GeometryProxy) -> Bool {
        let innerOrigin = innerRect.origin.x
        let imageWidth = innerRect.width
        let scrollOrigin = outerProxy.frame(in: .global).origin.x
        let scrollWidth = outerProxy.size.width
        
        if innerOrigin > scrollOrigin && innerOrigin < scrollOrigin + imageWidth + 8 && innerOrigin + imageWidth < scrollOrigin + scrollWidth {
            return true
        }
        return false
    }
}
*/

struct Toolbar_Previews: PreviewProvider {
    static var previews: some View {
        Toolbar()
    }
}

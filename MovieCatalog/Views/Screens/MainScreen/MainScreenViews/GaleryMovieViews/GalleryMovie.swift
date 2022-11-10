//
//  GaleryMovie.swift
//  MovieCatalog
//
//  Created by  Aleksey Feofilov on 27.10.2022.
//

import SwiftUI

struct genre: Identifiable{
    var id: String
    var name: String
}

struct GalleryMovie: View {
    let viewModel: GaleryMovieViewModel
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            HStack{
                CustomAsyncImage(url: viewModel.movie.poster ?? "", failureImage: Image(systemName: "photo"))
                    .foregroundColor(.white)
                    .frame(width: 100, height: 144)
                
                VStack(alignment: .leading){
                    Text(viewModel.movie.name ?? "No name")
                        .font(Font.system(size: 20))
                    Text("\(viewModel.movie.country ?? "No country") \u{2022} " + String(viewModel.movie.year))
                    Text(viewModel.movie.genres?.map( { $0.name ?? "" }).sorted().joined(separator: ", ") ?? "")
                    Spacer()
                    Ratting(viewModel.movieRating())
                }
                .foregroundColor(.white)
                .font(Font.system(size: 14))
                
                Spacer()
            }
        }
    }
}

struct GaleryMovie_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
            
            GalleryMovie(viewModel: GaleryMovieViewModel(MovieElementModel(id: "1", name: "Name", poster: nil, year: 2000, country: nil, genres: nil, reviews: [ReviewShortModel(id: "1", rating: 2)]))
            )
        }
    }
}

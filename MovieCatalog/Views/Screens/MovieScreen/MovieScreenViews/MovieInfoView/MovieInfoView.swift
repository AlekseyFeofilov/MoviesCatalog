//
//  MovieDescription.swift
//  MovieCatalog
//
//  Created by  Aleksey Feofilov on 30.10.2022.
//

import SwiftUI

struct MovieInfoView: View {
    let viewModel: MovieInfoViewModel
    
    var body: some View {
        VStack{
            Text(viewModel.movieInfo.description ?? "")
                .foregroundColor(.white)
                .font(Font.custom(Fonts.IBMPlexSansRegular, size: 14))
                .fixedSize(horizontal: false, vertical: true)
                
            AboutMovieView(viewModel: viewModel)
                .padding(.vertical)
            
            GenreStackView(viewModel: GenreSrackViewModel(viewModel.movieInfo.genres ?? []))
        }
    }
}

struct MovieInfoView_Previews: PreviewProvider {
    static var previews: some View {
        MovieInfoView(viewModel: MovieInfoViewModel(MovieDetailsModel(id: "1", name: nil, poster: nil, year: 1900, country: nil, genres: nil, reviews: nil, time: 88, tagline: nil, description: nil, director: nil, budget: nil, fees: nil, ageLimit: 16)))
    }
}

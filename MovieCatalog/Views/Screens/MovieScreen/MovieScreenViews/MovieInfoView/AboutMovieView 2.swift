//
//  AboutMovie.swift
//  MovieCatalog
//
//  Created by  Aleksey Feofilov on 30.10.2022.
//

import SwiftUI

struct AboutMovieView: View {
    let viewModel: MovieInfoViewModel
    
    var body: some View {
        VStack{
            Text("О фильме")
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(Font.custom(IBMPlexSansRegularName, size: 16))
                .foregroundColor(.white)
                .padding(.bottom)
            
            VStack(spacing: 4){
                MovieCharacteristicView(characteristicName: "Год", characteristicValue: String(viewModel.movieInfo.year))
                
                if viewModel.movieInfo.country != nil {
                    MovieCharacteristicView(characteristicName: "Страна", characteristicValue: viewModel.movieInfo.country!)
                }
                
                MovieCharacteristicView(characteristicName: "Время", characteristicValue:  "\(viewModel.movieInfo.time) мин.")
                
                if viewModel.movieInfo.director != nil {
                    MovieCharacteristicView(characteristicName: "Режисёр", characteristicValue: viewModel.movieInfo.director!)
                }
                
                if viewModel.movieInfo.tagline != nil {
                    MovieCharacteristicView(characteristicName: "Слоган", characteristicValue: viewModel.movieInfo.tagline!)
                }
                
                if viewModel.movieInfo.budget != nil {
                    MovieCharacteristicView(characteristicName: "Бюджет", characteristicValue: "$\(viewModel.movieInfo.budget!)")
                }
                
                if viewModel.movieInfo.fees != nil {
                    MovieCharacteristicView(characteristicName: "Сборы в мире", characteristicValue: "$\(viewModel.movieInfo.fees!)")
                }
                
                MovieCharacteristicView(characteristicName: "Возраст", characteristicValue: "\(viewModel.movieInfo.ageLimit)+")
            }
        }
    }
}

struct AboutMovieView_Previews: PreviewProvider {
    static var previews: some View {
        AboutMovieView(viewModel: MovieInfoViewModel(MovieDetailsModel(id: "1", name: nil, poster: nil, year: 1900, country: nil, genres: nil, reviews: nil, time: 88, tagline: nil, description: nil, director: nil, budget: nil, fees: nil, ageLimit: 16)))
    }
}

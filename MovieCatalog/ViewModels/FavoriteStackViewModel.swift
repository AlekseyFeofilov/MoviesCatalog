//
//  FavoriteStackViewModel.swift
//  MovieCatalog
//
//  Created by  Aleksey Feofilov on 09.11.2022.
//

import Foundation
import SwiftUI

class FavoriteStackViewModel: ObservableObject{
    @Published var movies: [MovieElementModel]
    @Published var firstVisibleMovie: String = "-1"
    @Binding var isAuthorized: Bool
    
    init(_ movies: [MovieElementModel], isAuthorized: Binding<Bool>){
        self.movies = movies
        self._isAuthorized = isAuthorized
    }
    
    func deleteFavoriteMovie(_ movie: MovieElementModel) -> (() -> Void){
        return {
            guard let index = self.movies.firstIndex(where: {
                it in it.id == movie.id
            }) else { return }
            
            MovieCatalog.deleteFavoriteMovie(movieId: movie.id, authorizationFlag: self.$isAuthorized)
            self.movies.remove(at: index)
        }
    }
}

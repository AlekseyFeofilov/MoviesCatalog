//
//  GaleryMovieViewModel.swift
//  MovieCatalog
//
//  Created by  Aleksey Feofilov on 09.11.2022.
//

import Foundation

class GaleryMovieViewModel{
    let movie: MovieElementModel
    
    init(_ movie: MovieElementModel){
        self.movie = movie
    }
    
    func movieRating() -> Float?{
        guard let reviews = movie.reviews else { return nil }
        return Float(reviews.map( { $0.rating } ).reduce(0, +)) / Float(reviews.count)
    }
}

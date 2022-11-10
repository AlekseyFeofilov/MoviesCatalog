//
//  MovieElementModel.swift
//  MovieCatalog
//
//  Created by  Aleksey Feofilov on 09.11.2022.
//

import Foundation

struct MovieElementModel: Decodable, Identifiable{
    let id: String
    let name: String?
    var poster: String?
    let year: Int
    let country: String?
    let genres: [GenreModel]?
    let reviews: [ReviewShortModel]?
}

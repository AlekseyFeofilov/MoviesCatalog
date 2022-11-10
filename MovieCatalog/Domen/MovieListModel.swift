//
//  MovieListModel.swift
//  MovieCatalog
//
//  Created by  Aleksey Feofilov on 09.11.2022.
//

import Foundation

struct MovieListModel: Decodable{
    let movies: [MovieElementModel]?
}

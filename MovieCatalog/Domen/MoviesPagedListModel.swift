//
//  MoviesPagedListModel.swift
//  MovieCatalog
//
//  Created by  Aleksey Feofilov on 09.11.2022.
//

import Foundation

struct MoviesPagedListModel: Decodable{
    let movies: [MovieElementModel]?
    let pageInfo: PageInfoModel
}

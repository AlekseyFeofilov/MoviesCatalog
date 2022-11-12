//
//  GenreModel.swift
//  MovieCatalog
//
//  Created by  Aleksey Feofilov on 09.11.2022.
//

import Foundation

struct GenreModel: Decodable, Identifiable, Hashable{
    let id: String
    let name: String?
}
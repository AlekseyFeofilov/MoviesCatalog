//
//  ReviewModel.swift
//  MovieCatalog
//
//  Created by  Aleksey Feofilov on 10.11.2022.
//

import Foundation

struct ReviewModel: Decodable{
    let id: String
    let rating: Int
    let reviewText: String?
    let isAnonymous: Bool
    let createDateTame: String
    let author: UserShortModel
}

//
//  ReviewModel.swift
//  MovieCatalog
//
//  Created by  Aleksey Feofilov on 10.11.2022.
//

import Foundation

struct ReviewModel: Decodable, Identifiable {
    let id: String
    var rating: Int
    var reviewText: String?
    var isAnonymous: Bool
    let createDateTime: String
    let author: UserShortModel

    func toDictionary() -> [String: Any] {
        [Keys.id: id,
         Keys.rating: rating,
         Keys.reviewText: reviewText ?? "",
         Keys.isAnonymous: isAnonymous,
         Keys.createDateTime: createDateTime,
         Keys.author: author]
    }
}

//
//  ReviewModel.swift
//  MovieCatalog
//
//  Created by  Aleksey Feofilov on 10.11.2022.
//

import Foundation

class ReviewModel: Decodable, Identifiable, ObservableObject{
    var id: String
    var rating: Int
    var reviewText: String?
    var isAnonymous: Bool
    var createDateTime: String
    var author: UserShortModel
    
    func toDictionary() -> [String:Any]{
        return ["id" : id,
                "rating" : rating,
                "reviewText" : reviewText ?? "",
                "isAnonymous" : isAnonymous,
                "createDateTime" : createDateTime,
                "author" : author
        ]
    }
    
    init(id: String,
         rating: Int,
         reviewText: String?,
         isAnonymous: Bool,
         createDateTime: String,
         author: UserShortModel){
        self.id = id
        self.rating = rating
        self.reviewText = reviewText
        self.isAnonymous = isAnonymous
        self.createDateTime = createDateTime
        self.author = author
    }
}

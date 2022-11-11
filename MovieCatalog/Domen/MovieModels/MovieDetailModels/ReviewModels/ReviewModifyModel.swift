//
//  ReviewModifyModel.swift
//  MovieCatalog
//
//  Created by  Aleksey Feofilov on 10.11.2022.
//

import Foundation
 
struct ReviewModifyModel: Decodable{
    var reviewText: String
    var rating: Int
    var isAnonymous: Bool
    
    func toDictionary() -> [String:Any]{
        return ["reviewText" : reviewText,
                "rating" : rating,
                "isAnonymous": isAnonymous]
    }
}

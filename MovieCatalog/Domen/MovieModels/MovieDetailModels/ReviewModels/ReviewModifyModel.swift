//
//  ReviewModifyModel.swift
//  MovieCatalog
//
//  Created by  Aleksey Feofilov on 10.11.2022.
//

import Foundation
 
struct ReviewModifyModel: Decodable{
    let reviewText: String
    let rating: Int
    let isAnonymous: Bool
}

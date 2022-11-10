//
//  UserShortModel.swift
//  MovieCatalog
//
//  Created by  Aleksey Feofilov on 10.11.2022.
//

import Foundation

struct UserShortModel: Decodable{
    let userId: String
    let nickName: String?
    let avatar: String?
}

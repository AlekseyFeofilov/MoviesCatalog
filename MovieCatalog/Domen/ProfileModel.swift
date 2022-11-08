//
//  ProfileModel.swift
//  MovieCatalog
//
//  Created by  Aleksey Feofilov on 08.11.2022.
//

import Foundation

struct ProfileModel: Decodable{
    var id: String
    var nickName: String?
    var email: String
    var avatarLink: String?
    var name: String
    var gender: Int?
    var birthDate: String
    
    func toDictionary() -> [String:Any]{
        return ["nickName" : nickName ?? "",
                "name" : name,
                "id" : id,
                "avatarLink" : avatarLink ?? "",
                "email" : email,
                "birthDate" : birthDate,
                "gender" : gender ?? 0]
    }
}

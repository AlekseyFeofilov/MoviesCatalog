//
//  ProfileModel.swift
//  MovieCatalog
//
//  Created by  Aleksey Feofilov on 08.11.2022.
//

import Foundation

struct ProfileModel: Decodable{
    let id: String
    let nickName: String?
    let email: String
    let avatarLink: String?
    let name: String
    let gender: Int?
    let birthDate: String
    
    func toDictionary() -> [String:Any]{
        return [nickNameKey : nickName ?? "",
                nameKey : name,
                idKey : id,
                avatarLinkKey : avatarLink ?? "",
                emailKey : email,
                birthDateKey : birthDate,
                genderKey : gender ?? 0]
    }
}

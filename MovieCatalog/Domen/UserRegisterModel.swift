//
//  UserRegisterModel.swift
//  MovieCatalog
//
//  Created by  Aleksey Feofilov on 06.11.2022.
//

import Foundation

struct UserRegisterModel {
    var login: String
    var password: String
    var email: String
    var name: String
    var sex: Gender?
    var selectedDate: Date?
    
    var dictionary: [String:Any] {
        return ["userName" : login,
            "password" : password,
            "name" : name,
            "email" : email,
            "birthDate" : formatDate(selectedDate ?? Date.now),
            "gender" : sex?.value ?? 0]
    }
}

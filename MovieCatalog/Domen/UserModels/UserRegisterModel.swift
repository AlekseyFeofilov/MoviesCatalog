//
//  UserRegisterModel.swift
//  MovieCatalog
//
//  Created by  Aleksey Feofilov on 06.11.2022.
//

import Foundation

struct UserRegisterModel {
    let login: String
    let password: String
    let email: String
    let name: String
    let sex: Gender?
    let selectedDate: Date?
    
    func toDictionary() -> [String:Any] {
        return [userNameKey : login,
            passwordKey : password,
            nameKey : name,
            emailKey : email,
            birthDateKey : formatDate(selectedDate ?? Date.now)!,
            genderKey : sex?.rawValue ?? 0]
    }
}

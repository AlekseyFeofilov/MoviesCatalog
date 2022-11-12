//
//  UserRegisterModel.swift
//  MovieCatalog
//
//  Created by  Aleksey Feofilov on 06.11.2022.
//

import Foundation

struct UserRegisterModel {
    let userName: String
    let password: String
    let email: String
    let name: String
    let gender: Gender?
    let birthDate: Date?

    func toDictionary() -> [String: Any] {
        [Keys.userName: userName,
         Keys.password: password,
         Keys.name: name,
         Keys.email: email,
         Keys.birthDate: birthDate?.formatDate() ?? Date.now.formatDate()!,
         Keys.gender: gender?.rawValue ?? 0]
    }
}

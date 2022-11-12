//
//  LoginCredentials.swift
//  MovieCatalog
//
//  Created by  Aleksey Feofilov on 06.11.2022.
//

import Foundation

struct LoginCredentials {
    let username: String
    let password: String
    
    func toDictionary() -> [String: Any] {
        [Keys.username: username,
         Keys.password: password]
    }
}

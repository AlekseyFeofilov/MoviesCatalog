//
//  LoginCredentials.swift
//  MovieCatalog
//
//  Created by  Aleksey Feofilov on 06.11.2022.
//

import Foundation

struct LoginCredentials{
    let login: String
    let password: String
    
    func toDictionary() -> [String: Any] {
        return [usernameKey : login,
                passwordKey : password]
    }
}

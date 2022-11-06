//
//  LoginCredentials.swift
//  MovieCatalog
//
//  Created by  Aleksey Feofilov on 06.11.2022.
//

import Foundation

struct LoginCredentials{
    var login: String
    var password: String
    
    var dictionary: [String: Any] {
        return ["username" : login,
                "password" : password]
    }
}

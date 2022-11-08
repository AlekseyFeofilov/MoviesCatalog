//
//  Token.swift
//  MovieCatalog
//
//  Created by  Aleksey Feofilov on 06.11.2022.
//

import Foundation

struct Token: Codable {
    let token: String
}

func setToken(_ token: String){
    if let encoded: Data = token.data(using: .utf8) {
        UserDefaults.standard.set(encoded, forKey: tokenKey)
    }
}

func getToken() -> String? {
    if let data = UserDefaults.standard.data(forKey: tokenKey){
        if let decoded = String(data: data, encoding: .utf8){
            return decoded
        }
    }
    
    return nil
}

func deleteToken(){
    UserDefaults.standard.removeObject(forKey: tokenKey)
}

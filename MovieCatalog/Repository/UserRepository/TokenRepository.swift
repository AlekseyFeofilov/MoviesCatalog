//
//  Token.swift
//  MovieCatalog
//
//  Created by  Aleksey Feofilov on 06.11.2022.
//

import Foundation

class TokenRepository {
    func setToken(_ token: String) {
        guard let encoded = token.data(using: .utf8) else {
            return
        }
        UserDefaults.standard.set(encoded, forKey: Keys.tokenKey)
        
        getProfileInfo(authorizationFlag: .constant(true)) { profileInfo in
            guard let encoded: Data = profileInfo.id.data(using: .utf8) else {
                return
            }
            UserDefaults.standard.set(encoded, forKey: Keys.id)
        }
    }
    
    func getToken() -> String? {
        guard
            let data = UserDefaults.standard.data(forKey: Keys.tokenKey),
            let decoded = String(data: data, encoding: .utf8)
        else {
            return nil
        }
        return decoded
    }
    
    func deleteToken() {
        UserDefaults.standard.removeObject(forKey: Keys.tokenKey)
    }
}

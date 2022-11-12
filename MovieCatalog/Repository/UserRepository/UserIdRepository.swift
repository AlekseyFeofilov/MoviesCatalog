//
//  UserRepository.swift
//  MovieCatalog
//
//  Created by  Aleksey Feofilov on 12.11.2022.
//

import Foundation
import SwiftUI

class UserIdRepository {
    func setUserId(authorizationFlag: Binding<Bool>) {
        getProfileInfo(authorizationFlag: authorizationFlag) { profileInfo in
            guard let encoded: Data = profileInfo.id.data(using: .utf8) else {
                return
            }
            UserDefaults.standard.set(encoded, forKey: Keys.id)
        }
    }
    
    func getUserId() -> String? {
        guard
            let data = UserDefaults.standard.data(forKey: Keys.id),
            let decoded = String(data: data, encoding: .utf8)
        else {
            return nil
        }
        return decoded
    }

    func deleteUserId() {
        UserDefaults.standard.removeObject(forKey: Keys.id)
    }
}

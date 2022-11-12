//
//  FavoriteRepository.swift
//  MovieCatalog
//
//  Created by  Aleksey Feofilov on 12.11.2022.
//

import Foundation
import SwiftUI

class FavoriteRepository {
    func updateFavorite(authorizationFlag: Binding<Bool>) {
        getFavoriteMovies(authorizationFlag: authorizationFlag) { movies in
            let ids = movies.map { it in it.id }.joined(separator: separator)
            guard let encoded: Data = ids.data(using: .utf8) else {
                return
            }
            
            UserDefaults.standard.set(encoded, forKey: Keys.favoriteMovies)
        }
    }
    
    func getFavorites() -> [String.SubSequence] {
        guard
            let data = UserDefaults.standard.data(forKey: Keys.favoriteMovies),
            let decoded = String(data: data, encoding: .utf8)
        else {
            return []
        }
        
        return decoded.split(separator: ",")
    }
    
    func deleteFavorites() {
        UserDefaults.standard.removeObject(forKey: Keys.favoriteMovies)
    }
}

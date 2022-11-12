//
//  UserRepository.swift
//  MovieCatalog
//
//  Created by  Aleksey Feofilov on 12.11.2022.
//

import Foundation

class UserRepository {
    let tokenRepository = TokenRepository()
    let userIdRepository = UserIdRepository()
    let favoriteRepository = FavoriteRepository()
    
    func setUser(token: String){
        tokenRepository.setToken(token)
        userIdRepository.setUserId(authorizationFlag: .constant(true))
        favoriteRepository.updateFavorite(authorizationFlag: .constant(true))
    }
    
    func deleteUser(){
        tokenRepository.deleteToken()
        userIdRepository.deleteUserId()
        favoriteRepository.deleteFavorites()
    }
}

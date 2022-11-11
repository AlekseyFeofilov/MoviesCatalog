//
//  FavoriteMovieRepository.swift
//  MovieCatalog
//
//  Created by  Aleksey Feofilov on 09.11.2022.
//

import Foundation
import Alamofire
import SwiftUI

func deleteFavoriteMovie(movieId: String, authorizationFlag: Binding<Bool>){
    guard let token = getToken() else { return }
    var headers: HTTPHeaders = [:]
    headers["Authorization"] = "Bearer " + token
    
    AF.request(
        String(format: demoBaseURL + deleteFavoritesRequestURL, arguments: [movieId]),
        method: .delete,
        encoding: JSONEncoding.default,
        headers: headers
    ).responseData { response in
        handleResponse(response, authorizationFlag: authorizationFlag)
    }
}

func addFavoriteMovie(movieId: String, authorizationFlag: Binding<Bool>){
    guard let token = getToken() else { return }
    var headers: HTTPHeaders = [:]
    headers["Authorization"] = "Bearer " + token
    
    AF.request(
        String(format: demoBaseURL + addFavoritesRequestURL, arguments: [movieId]),
        method: .post,
        encoding: JSONEncoding.default,
        headers: headers
    ).responseData { response in
        handleResponse(response, authorizationFlag: authorizationFlag)
    }
}

func getFavoriteMovies(authorizationFlag: Binding<Bool>, resultHandle: @escaping ([MovieElementModel]) -> Void){
    guard let token = getToken() else { return }
    var headers: HTTPHeaders = [:]
    headers["Authorization"] = "Bearer " + token
    
    AF.request(
        demoBaseURL + getFavoritesRequestURL,
        method: .get,
        encoding: JSONEncoding.default,
        headers: headers
    ).responseData { response in
        handleResponse(response, authorizationFlag: authorizationFlag, resultHandle: { data in
            let result = try? JSONDecoder().decode(MovieListModel.self, from: data)
            guard let result = result?.movies else { return }
            let ids = result.map { it in it.id }.joined(separator: ",")
            
            if let encoded: Data = ids.data(using: .utf8){
                UserDefaults.standard.set(encoded, forKey: "favoriteMovies")
            }
            
            resultHandle(result)
        })
    }
}



//
//  FavoriteMovieRepository.swift
//  MovieCatalog
//
//  Created by  Aleksey Feofilov on 09.11.2022.
//

import Foundation
import Alamofire
import SwiftUI

func deleteFavoriteMovie(movieId: String, authorizationFlag: Binding<Bool>) {
    CustomAFRequest(
        String(format: demoBaseURL + deleteFavoritesRequestURL, arguments: [movieId]),
        method: .delete,
        authorizationFlag: authorizationFlag,
        needAuthorization: true,
        encoding: JSONEncoding.default) { response in
            handleResponse(response, authorizationFlag: authorizationFlag)
        }
}

func addFavoriteMovie(movieId: String, authorizationFlag: Binding<Bool>) {
    CustomAFRequest(
        String(format: demoBaseURL + addFavoritesRequestURL, arguments: [movieId]),
        method: .post,
        authorizationFlag: authorizationFlag,
        needAuthorization: true,
        encoding: JSONEncoding.default) { response in
            handleResponse(response, authorizationFlag: authorizationFlag)
        }
}

func getFavoriteMovies(authorizationFlag: Binding<Bool>, resultHandle: @escaping ([MovieElementModel]) -> Void) {
    CustomAFRequest(
        demoBaseURL + getFavoritesRequestURL,
        method: .get,
        authorizationFlag: authorizationFlag,
        needAuthorization: true,
        encoding: JSONEncoding.default) { response in
            handleResponse(response, authorizationFlag: authorizationFlag, resultHandle: { data in
                guard let result = try? JSONDecoder().decode(MovieListModel.self, from: data),
                      let movies = result.movies else {
                    return
                }
                resultHandle(movies)
            })
        }
}



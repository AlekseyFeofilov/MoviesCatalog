//
//  FavoriteMovieRepository.swift
//  MovieCatalog
//
//  Created by  Aleksey Feofilov on 09.11.2022.
//

import Foundation
import Alamofire
import SwiftUI

func deleteFavoriteMovie(movieId: String, authorizationFlag: Binding<Bool>, statusCodeHandle: @escaping (Int) -> Void = { _ in }){
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

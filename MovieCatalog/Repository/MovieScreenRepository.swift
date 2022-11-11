//
//  MovieScreenRepository.swift
//  MovieCatalog
//
//  Created by  Aleksey Feofilov on 10.11.2022.
//

import Foundation
import SwiftUI
import Alamofire

func getMovieDetails(_ movieId: String, authorizationFlag: Binding<Bool>, resultHandle: @escaping (MovieDetailsModel) -> Void){
    AF.request(
        String(format: demoBaseURL + getMovieDetailRequestURL, arguments: [movieId]),
        method: .get,
        encoding: JSONEncoding.default
    ).responseData { response in
        handleResponse(response, authorizationFlag: authorizationFlag, resultHandle: { data in
            let result = try? JSONDecoder().decode(MovieDetailsModel.self, from: data)
            guard let result = result else { return }
            resultHandle(result)
        })
    }
}

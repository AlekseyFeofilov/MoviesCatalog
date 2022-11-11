//
//  ReviewRepository.swift
//  MovieCatalog
//
//  Created by  Aleksey Feofilov on 11.11.2022.
//

import Foundation
import Alamofire
import SwiftUI

func addReview(_ reviewModifyModel: ReviewModifyModel, movieId: String, authorizationFlag: Binding<Bool>, statusHandle: @escaping (Int) -> Void){
    guard let token = getToken() else { return }
    var headers: HTTPHeaders = [:]
    headers["Authorization"] = "Bearer " + token
    
    AF.request(
        String(format: demoBaseURL + addReviewRequestURL, arguments: [movieId]),
        method: .post,
        parameters: reviewModifyModel.toDictionary(),
        encoding: JSONEncoding.default,
        headers: headers
    ).responseData { response in
        handleResponse(response, authorizationFlag: authorizationFlag, params: reviewModifyModel.toDictionary(), statusCodeHandle: statusHandle)
    }
}

func editReview(_ reviewModifyModel: ReviewModifyModel, movieId: String, reviewId: String, authorizationFlag: Binding<Bool>, statusHandle: @escaping (Int) -> Void){
    guard let token = getToken() else { return }
    var headers: HTTPHeaders = [:]
    headers["Authorization"] = "Bearer " + token
    
    AF.request(
        String(format: demoBaseURL + editReviewRequestURL, arguments: [movieId, reviewId]),
        method: .put,
        parameters: reviewModifyModel.toDictionary(),
        encoding: JSONEncoding.default,
        headers: headers
    ).responseData { response in
        handleResponse(response, authorizationFlag: authorizationFlag, params: reviewModifyModel.toDictionary(), statusCodeHandle: statusHandle)
    }
}

func deleteReview(movieId: String, reviewId: String, authorizationFlag: Binding<Bool>, resultHandle: @escaping (Data) -> Void = {_ in}){
    guard let token = getToken() else { return }
    var headers: HTTPHeaders = [:]
    headers["Authorization"] = "Bearer " + token
    
    AF.request(
        String(format: demoBaseURL + deleteReviewRequestURL, arguments: [movieId, reviewId]),
        method: .delete,
        headers: headers
    ).responseData { response in
        handleResponse(response, authorizationFlag: authorizationFlag, resultHandle: { data in resultHandle(data) })
    }
}


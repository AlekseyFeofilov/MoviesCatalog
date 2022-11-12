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
    CustomAFRequest(
        String(format: demoBaseURL + addReviewRequestURL, arguments: [movieId]),
        method: .post,
        parameters: reviewModifyModel.toDictionary(),
        authorizationFlag: authorizationFlag,
        needAuthorization: true,
        encoding: JSONEncoding.default) { response in
        handleResponse(response, authorizationFlag: authorizationFlag, params: reviewModifyModel.toDictionary(), statusCodeHandle: statusHandle)
    }
}

func editReview(_ reviewModifyModel: ReviewModifyModel, movieId: String, reviewId: String, authorizationFlag: Binding<Bool>, statusHandle: @escaping (Int) -> Void){
    CustomAFRequest(
        String(format: demoBaseURL + editReviewRequestURL, arguments: [movieId, reviewId]),
        method: .put,
        parameters: reviewModifyModel.toDictionary(),
        authorizationFlag: authorizationFlag,
        needAuthorization: true,
        encoding: JSONEncoding.default) { response in
        handleResponse(response, authorizationFlag: authorizationFlag, params: reviewModifyModel.toDictionary(), statusCodeHandle: statusHandle)
    }
}

func deleteReview(movieId: String, reviewId: String, authorizationFlag: Binding<Bool>, resultHandle: @escaping (Data) -> Void = {_ in}){
    CustomAFRequest(
        String(format: demoBaseURL + deleteReviewRequestURL, arguments: [movieId, reviewId]),
        method: .delete,
        authorizationFlag: authorizationFlag,
        needAuthorization: true) { response in
        handleResponse(response, authorizationFlag: authorizationFlag, resultHandle: { data in resultHandle(data) })
    }
}


//
//  AuthorizationRepository.swift
//  MovieCatalog
//
//  Created by  Aleksey Feofilov on 09.11.2022.
//

import Foundation
import SwiftUI
import Alamofire

class AuthorizationRepository{
    private func authorize(parameters: Parameters, authorizationFlag: Binding<Bool>, statusCodeHandle: @escaping (Int) -> Void){
        AF.request(
            baseURL + loginRequestURL,
            method: .post,
            parameters: parameters,
            encoding: JSONEncoding.default
        ).responseData { response in
            handleResponse(response, authorizationFlag: authorizationFlag, params: parameters) { statusCode in
                statusCodeHandle(statusCode)
            } resultHandle: { data in
                let result = try? JSONDecoder().decode(Token.self, from: data)
                guard let result = result else { return }
                setToken(result.token)
            }
        }
    }
    
    func signIn(_ loginCredentials: LoginCredentials, authorizationFlag: Binding<Bool>, statusCodeHandle: @escaping (Int) -> Void){
        authorize(parameters: loginCredentials.toDictionary(), authorizationFlag: authorizationFlag, statusCodeHandle: statusCodeHandle)
    }

    func signUp(_ userRegisterModel: UserRegisterModel, authorizationFlag: Binding<Bool>, statusCodeHandle: @escaping (Int) -> Void){
        authorize(parameters: userRegisterModel.toDictionary(), authorizationFlag: authorizationFlag, statusCodeHandle: statusCodeHandle)
    }
    
    func logout(){
        
    }
}

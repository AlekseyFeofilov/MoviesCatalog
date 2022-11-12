//
//  CustomAFRequesy.swift
//  MovieCatalog
//
//  Created by  Aleksey Feofilov on 12.11.2022.
//

import Foundation
import Alamofire
import SwiftUI

func CustomAFRequest(
    _ convertible: URLConvertible,
    method: HTTPMethod = .get,
    parameters: Parameters? = nil,
    authorizationFlag: Binding<Bool>,
    needAuthorization: Bool,
    encoding: ParameterEncoding = URLEncoding.default,
    completionHandler: @escaping (AFDataResponse<Data>) -> Void) {
    var headers: HTTPHeaders? = nil
    
    if needAuthorization {
        if let token = TokenRepository().getToken(){
            headers = HTTPHeaders()
            headers!["Authorization"] = "Bearer " + token
        } else {
            UserRepository().deleteUser()
            authorizationFlag.wrappedValue = false
        }
    }
    
     AF.request(
        convertible,
        method: method,
        parameters: parameters,
        encoding: encoding,
        headers: headers).responseData { responce in
            completionHandler(responce)
        }
}

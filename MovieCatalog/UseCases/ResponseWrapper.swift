//
//  ResponseWrapper.swift
//  MovieCatalog
//
//  Created by  Aleksey Feofilov on 06.11.2022.
//

import Foundation
import Alamofire

func handleResponse (_ response: AFDataResponse<Data>, params: [String : Any] = [String : String](), statusCodeHandle: (Int) -> Void = { _ in }, resultHandle: (Data) -> Void = {_ in }){
    if let request = response.request {
        print("Request:", request)
        print("\nParams: ", params)
    }
    if let statusCode = response.response?.statusCode {
        print("Status Code:", statusCode)
        statusCodeHandle(statusCode)
    }
    switch response.result {
    case .success(let data):
        resultHandle(data)
    case .failure(let error):
        print(error.localizedDescription)
        return
    }
}

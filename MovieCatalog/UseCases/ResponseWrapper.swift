//
//  ResponseWrapper.swift
//  MovieCatalog
//
//  Created by  Aleksey Feofilov on 06.11.2022.
//

import Foundation
import Alamofire
import SwiftUI

func handleResponse (
    _ response: AFDataResponse<Data>,
    authorizationFlag: Binding<Bool>,
    params: [String : Any] = [String : String](),
    statusCodeHandle: (Int) -> Void = { _ in },
    resultHandle: (Data) -> Void = {_ in }
){
    if let request = response.request {
        print("\nRequest:", request)
        print("Params: ", params)
    }
    if let statusCode = response.response?.statusCode {
        if statusCode == unauthorizedCode {
            deleteToken()
            authorizationFlag.wrappedValue = false
        }
        
        print("Status Code:", statusCode)
        statusCodeHandle(statusCode)
    }
    
    switch response.result {
    case .success(let data):
        do {
            if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]{
                print (json)
            }
        }
        catch let error {
            print("Failed to serialize: \(error.localizedDescription)")
        }
        
        resultHandle(data)
    case .failure(let error):
        print(error.localizedDescription)
        return
    }
}

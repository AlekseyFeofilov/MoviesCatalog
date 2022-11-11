//
//  AsyncRequest.swift
//  MovieCatalog
//
//  Created by  Aleksey Feofilov on 10.11.2022.
//

import Foundation
import Alamofire
import SwiftUI

func customAsyncRequest(
    _ convertible: URLConvertible,
    method: HTTPMethod = .get,
    parameters: Parameters? = nil,
    encoding: ParameterEncoding = URLEncoding.default,
    headers: HTTPHeaders? = nil,
    authorizationFlag: Binding<Bool>,
    statusCodeHandle: @escaping (Int) -> Void = { _ in },
    resultHandle: @escaping (Data) -> Void = {_ in },
    interceptor: RequestInterceptor? = nil,
    requestModifier: Session.RequestModifier? = nil
) async throws -> Data {
    try await withUnsafeThrowingContinuation { continuation in
        AF.request(
            convertible,
            method: method,
            parameters: parameters,
            encoding: encoding,
            headers: headers,
            interceptor: interceptor,
            requestModifier: requestModifier
        ).responseData { response in
            if let request = response.request {
                print("\nRequest:", request)
                print("Params: ", parameters ?? "")
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
                continuation.resume(returning: data)
                
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
                continuation.resume(throwing: error)
                print(error.localizedDescription)
                return
            }
        }
    }
}

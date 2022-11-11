//
//  ProfileInfoRepository.swift
//  MovieCatalog
//
//  Created by  Aleksey Feofilov on 10.11.2022.
//

import Foundation
import Alamofire
import SwiftUI

func getProfileInfoAsync(authorizationFlag: Binding<Bool>) async throws -> ProfileModel?{
    guard let token = getToken() else { return nil } //todo go to SignInScreen
    var headers: HTTPHeaders = [:]
    headers["Authorization"] = "Bearer " + token
    
    var profileInfo: ProfileModel? = nil
    
    do {
        let data = try await customAsyncRequest(
            demoBaseURL + getProfileInfoRequestURL,
            method: .get,
            headers: headers,
            authorizationFlag: authorizationFlag)
        
        let result = try? JSONDecoder().decode(ProfileModel.self, from: data)
        guard let result = result else { return nil }
        profileInfo = result
    }
    catch {
        print(error)
    }
    
    return profileInfo
}

func getProfileInfo(authorizationFlag: Binding<Bool>, resultHandle: @escaping (ProfileModel) -> Void){
    guard let token = getToken() else { return }
    var headers: HTTPHeaders = [:]
    headers["Authorization"] = "Bearer " + token
    
    AF.request(
        demoBaseURL + getProfileInfoRequestURL,
        method: .get,
        headers: headers
    ).responseData { response in
        handleResponse(response, authorizationFlag: authorizationFlag, statusCodeHandle: { _ in }) { data in
            let result = try? JSONDecoder().decode(ProfileModel.self, from: data)
            guard let result = result else { return }
            
            resultHandle(result)
        }
    }
}

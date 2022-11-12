//
//  ProfileInfoRepository.swift
//  MovieCatalog
//
//  Created by  Aleksey Feofilov on 10.11.2022.
//

import Foundation
import Alamofire
import SwiftUI

func getProfileInfo(authorizationFlag: Binding<Bool>, resultHandle: @escaping (ProfileModel) -> Void){
    CustomAFRequest(
        demoBaseURL + getProfileInfoRequestURL,
        method: .get,
        authorizationFlag: authorizationFlag,
        needAuthorization: true) { response in
        handleResponse(response, authorizationFlag: authorizationFlag, statusCodeHandle: { _ in }) { data in
            let result = try? JSONDecoder().decode(ProfileModel.self, from: data)
            guard let result = result else { return }
            
            resultHandle(result)
        }
    }
}

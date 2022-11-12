//
//  ProfileScreenViewModel.swift
//  MovieCatalog
//
//  Created by  Aleksey Feofilov on 07.11.2022.
//

import Foundation
import SwiftUI
import Alamofire

enum ProfileChangingError {
    case usedEmail
    case emptyParameter
    case incorrectEmail
    case tooYoung
    case none
    
    var description: String{
        switch self {
        case .emptyParameter:
            return "Все поля обязательны для заполнения"
        case .incorrectEmail:
            return "Такой почты не существует"
        case .tooYoung:
            return "Возраст должен быть не меньше 6 лет"
        case .none:
            return ""
        case .usedEmail:
            return "Этот email уже используется другим пользователем"
        }
    }
}

class ProfileScreenViewModel: ObservableObject {
    @Published var imageUrl: String = ""
    @Published var name: String = ""
    @Published var email: String = ""
    @Published var birthday: Date? = nil
    @Published var gender: Gender? = nil
    @Published var profileChangingError = ProfileChangingError.none
    @Binding var authorizationFlag: Bool
    
    var nickName: String = ""
    var isButtonActive: Binding<Bool> { Binding (
        get: { self.emptyValidation() },
        set: { _ in }
    )}
    
    private var id: String = ""
    
    func changeProfileInfo(){
        guard emptyValidation() else { return }
        guard profileInfoValidate() else { return }
        
        
        let params = ProfileModel(id: id, nickName: nickName, email: email, avatarLink: imageUrl, name: name, gender: gender?.rawValue, birthDate: birthday!.formatDate()!).toDictionary() as Parameters
        
        CustomAFRequest(
            demoBaseURL + editProfileInfoRequestURL,
            method: .put,
            parameters: params,
            authorizationFlag: $authorizationFlag,
            needAuthorization: true,
            encoding: JSONEncoding.default) { [self] response in
            handleResponse(response, authorizationFlag: $authorizationFlag, params: params, statusCodeHandle:  { statusCode in
                if statusCode == badRequestCode {
                    profileChangingError = .usedEmail
                }
            })
        }
    }
    
    func logout(){
        CustomAFRequest(
            demoBaseURL + logoutRequestURL,
            method: .post,
            authorizationFlag: $authorizationFlag,
            needAuthorization: true) { [self] response in
            handleResponse(response, authorizationFlag: self.$authorizationFlag, resultHandle:  { _ in
                UserRepository().deleteUser()
                authorizationFlag = false
            })
        }
    }
    
    private func emptyValidation() -> Bool{
        return MovieCatalog.emptyValidation(name: name, email: email, birthday: birthday, gender: gender)
    }
    
    private func profileInfoValidate() -> Bool{
        profileChangingError = MovieCatalog.profileInfoValidate(name: name, email: email, birthday: birthday, gender: gender)
        
        return profileChangingError == .none
    }
    
    init(isAuthorized: Binding<Bool>){
        self._authorizationFlag = isAuthorized
        
        CustomAFRequest(
            demoBaseURL + getProfileInfoRequestURL,
            method: .get,
            authorizationFlag: $authorizationFlag,
            needAuthorization: true) { response in
            handleResponse(response, authorizationFlag: self.$authorizationFlag, statusCodeHandle: { _ in }) { data in
                let result = try? JSONDecoder().decode(ProfileModel.self, from: data)
                guard let result = result else { return }
                
                self.id = result.id
                self.nickName = result.nickName!
                self.imageUrl = result.avatarLink ?? ""
                self.name = result.name
                self.email = result.email
                self.birthday = result.birthDate.formatDate()!
                self.gender = Gender.init(rawValue: result.gender!)
            }
        }
    }
}

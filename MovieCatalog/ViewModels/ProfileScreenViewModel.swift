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
    @Binding var isAuthorized: Bool
    
    var nickName: String = ""
    var isButtonActive: Binding<Bool> { Binding (
        get: { self.emptyValidation() },
        set: { _ in }
    )}
    
    private var id: String = ""
    
    func changeProfileInfo(){
        guard emptyValidation() else { return }
        guard profileInfoValidate() else { return }
        
        guard let token = getToken() else { return }
        var headers: HTTPHeaders = [:]
        headers["Authorization"] = "Bearer " + token
        
//        var params = [
//            "nickName" : nickName ?? "",
//            "name" : name,
//            "id" : id,
//            "avatarLink" : imageUrl ?? "",
//            "email" : email,
//            "birthDate" : formatDate(birthday) ?? Date.now,
//            "gender" : gender?.rawValue ?? 0
//        ]
        let params = ProfileModel(id: id, nickName: nickName, email: email, avatarLink: imageUrl, name: name, gender: gender?.rawValue, birthDate: formatDate(birthday)!).toDictionary() as Parameters
        
        AF.request(
            demoBaseURL + editProfileInfoRequestURL,
            method: .put,
            parameters: params,
            encoding: JSONEncoding.default,
            headers: headers
        ).responseData { [self] response in
            handleResponse(response, params: params, statusCodeHandle:  { statusCode in
                if statusCode == 400 {
                    profileChangingError = .usedEmail
                }
            })
        }
    }
    
    func logout(){
        guard let token = getToken() else { return } //todo go to SignInScreen
        var headers: HTTPHeaders = [:]
        headers["Authorization"] = "Bearer " + token
        
        AF.request(
            demoBaseURL + logoutRequestURL,
            method: .post,
            headers: headers
        ).responseData { [self] response in
            handleResponse(response, resultHandle:  { _ in
                deleteToken()
                isAuthorized = false
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
        self._isAuthorized = isAuthorized
        
        guard let token = getToken() else { return } //todo go to SignInScreen
        var headers: HTTPHeaders = [:]
        headers["Authorization"] = "Bearer " + token
               
        AF.request(
            demoBaseURL + getProfileInfoRequestURL,
            method: .get,
            headers: headers
        ).responseData { response in
            handleResponse(response, statusCodeHandle: { _ in }) { data in
                let result = try? JSONDecoder().decode(ProfileModel.self, from: data)
                guard let result = result else { return }
                
                self.id = result.id
                self.nickName = result.nickName!
                self.imageUrl = result.avatarLink ?? ""
                self.name = result.name
                self.email = result.email
                self.birthday = formatDate(result.birthDate)!
                self.gender = Gender.init(rawValue: result.gender!)
            }
        }
    }
}

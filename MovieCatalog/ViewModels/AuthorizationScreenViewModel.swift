//
//  TestModelView.swift
//  MovieCatalog
//
//  Created by  Aleksey Feofilov on 03.11.2022.
//

import Foundation
import SwiftUI
import Alamofire

enum AuthorizationError {
    case wrongLoginOrPassword
    case takenName
    case emptyParameter
    case passwordMismatch
    case easyPassword
    case incorrectEmail
    case tooYoung
    case none

    var description: String{
        switch self {
        case .emptyParameter:
            return "Все поля обязательны для заполнения"
        case .passwordMismatch:
            return "Пароли не совпадают"
        case .easyPassword:
            return "Слишком слабый пароль"
        case .incorrectEmail:
            return "Такой почты не существует"
        case .tooYoung:
            return "Возраст должен быть не меньше 6 лет"
        case .takenName:
            return "Пользователь с таким ником уже существует"
        case .wrongLoginOrPassword:
            return "Неправильный логин или пароль"
        case .none:
            return ""
        }
    }
}

protocol SignInViewModel: ObservableObject{
    var login: String { get set }
    var password: String { get set }
}

protocol SignUpViewModel: ObservableObject{
    var login: String { get set }
    var password: String { get set }
    var confirmedPassword: String { get set }
    var email: String { get set }
    var name: String { get set }
    var birthdayString: String { get set }
    var birthdayDate: Date? { get set }
    var sex: Gender? { get set }
}

class AuthorizationScreenViewModel: ObservableObject, SignUpViewModel, SignInViewModel{
    @Published var login: String = "Fil1"
    @Published var password: String = "Ff888888!"

    @Published var confirmedPassword: String = ""
    @Published var email: String = ""
    @Published var name: String = ""
    @Published var birthdayString: String = ""
    @Published var birthdayDate: Date? = nil
    @Published var sex: Gender? = nil

    @Published var haveAccount: Bool = true
    @Published var authorizationError = AuthorizationError.none
    @Binding var isAthorized: Bool

    var isButtonActive: Binding<Bool> { Binding (
        get: { self.haveAccount ? self.signInValidate() : self.softSignUpValidate() },
        set: { _ in }
    )}
    
    init(isAthorized: Binding<Bool>){
        self._isAthorized = isAthorized
    }
    
    func authorize(){
        if (haveAccount) {
            signIn()
        }
        else {
            signUp()
        }
    }
    
    func changeAuthorizationWay(){
        haveAccount.toggle()
        authorizationError = .none
    }

    private func signUp(){
        if !self.softSignUpValidate() { return }
        if !self.signUpValidate() { return }

        let url = demoBaseURL + registerRequestURL
        
        _authorize(
            url: url,
            parameters: UserRegisterModel(login: login, password: password, email: email, name: name, sex: sex, selectedDate: birthdayDate).dictionary
        ) { [self] statusCode in
            if statusCode == 400 {
                authorizationError = .takenName
            }
        }
    }
    
    private func signIn(){
        if !self.signInValidate() { return }
        
        let url = demoBaseURL + loginRequestURL

        _authorize(
            url: url,
            parameters: LoginCredentials(login: login, password: password).dictionary
        ) { [self] statusCode in
            if statusCode == 401 {
                authorizationError = .wrongLoginOrPassword
            }
        }
    }

    private func signInValidate() -> Bool {
        MovieCatalog.signInValidate(login: login, password: password)
    }

    private func softSignUpValidate() -> Bool {
        MovieCatalog.emptyValidation(login: login, password: password, confirmedPassword: confirmedPassword, name: name, email: email, birthday: birthdayDate, sex: sex)
    }

    private func signUpValidate() -> Bool {
        authorizationError = MovieCatalog.signUpValidate(login: login, password: password, confirmedPassword: confirmedPassword, name: name, email: email, birthday: birthdayDate, sex: sex)
        return authorizationError == .none
    }

    private func _authorize(url: String, parameters: [String:Any], statusCodeHandle: @escaping (Int) -> Void){
        AF.request(
            url,
            method: .post,
            parameters: parameters,
            encoding: JSONEncoding.default
        ).responseData { response in
            handleResponse(response, params: parameters) { statusCode in
                statusCodeHandle(statusCode)

                if (statusCode == 200){
                    self.isAthorized = true
                }
            } resultHandle: { data in
                let result = try? JSONDecoder().decode(Token.self, from: data)
                guard let result = result else { return }
                setToken(result.token)
            }
        }
    }
}


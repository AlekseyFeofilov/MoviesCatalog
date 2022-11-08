//
//  LoginValidation.swift
//  MovieCatalog
//
//  Created by  Aleksey Feofilov on 06.11.2022.
//

import Foundation

func signInValidate(login: String, password: String) -> Bool{
    return !login.isEmpty && !password.isEmpty
}

func emptyValidation(login: String, password: String, confirmedPassword: String, name: String, email: String, birthday: Date?, sex: Gender?) -> Bool{
    return !(login.isEmpty || password.isEmpty || confirmedPassword.isEmpty || name.isEmpty || email.isEmpty || birthday == nil || sex == nil)
}

func signUpValidate(login: String, password: String, confirmedPassword: String, name: String, email: String, birthday: Date?, sex: Gender?) -> AuthorizationError{
    if !emptyValidation(login: login, password: password, confirmedPassword: confirmedPassword, name: name, email: email, birthday: birthday, sex: sex){
        return .emptyParameter
    }
    else if !emailValidate(email: email){
        return .incorrectEmail
    }
    else if !birthdayValidation(birthday: birthday!){
        return .tooYoung
    }
    
    return passwordValidation(password: password, confirmedPassword: confirmedPassword)
}

private func passwordValidation(password: String, confirmedPassword: String) -> AuthorizationError{
    if !strengthPasswordValidate(password: password) {
        return .easyPassword
    }
    else if !confirmeValidation(password: password, confirmedPassword: confirmedPassword){
        return .passwordMismatch
    }
    
    return .none
}

private func confirmeValidation(password: String, confirmedPassword: String) -> Bool{
    return password == confirmedPassword
}

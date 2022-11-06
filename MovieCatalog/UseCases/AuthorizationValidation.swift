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

func simpleSignUpValidate(login: String, password: String, confirmedPassword: String, name: String, email: String, birthday: Date?, sex: Gender?) -> Bool{
    return emptyValidation(login: login, password: password, confirmedPassword: confirmedPassword, name: name, email: email, birthday: birthday, sex: sex)
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
    if !strengthValidation(password: password) {
        return .easyPassword
    }
    else if !confirmeValidation(password: password, confirmedPassword: confirmedPassword){
        return .passwordMismatch
    }
    
    return .none
}

private func emptyValidation(login: String, password: String, confirmedPassword: String, name: String, email: String, birthday: Date?, sex: Gender?) -> Bool{
    return !(login.isEmpty || password.isEmpty || confirmedPassword.isEmpty || name.isEmpty || email.isEmpty || birthday == nil || sex == nil)
}

private func confirmeValidation(password: String, confirmedPassword: String) -> Bool{
    return password == confirmedPassword
}

private func strengthValidation(password: String) ->Bool{
    return password.range(of: "(?=.*[0-9])(?=.*[!@#$%^&*])(?=.*[a-z])(?=.*[A-Z])[0-9a-zA-Z!@#$%^&*]{8,}", options: .regularExpression) != nil
}

private func emailValidate(email: String) -> Bool {
    let emailRegEx = "(?:[\\p{L}0-9!#$%\\&'*+/=?\\^_`{|}~-]+(?:\\.[\\p{L}0-9!#$%\\&'*+/=?\\^_`{|}" +
    "~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\" +
    "x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[\\p{L}0-9](?:[a-" +
    "z0-9-]*[\\p{L}0-9])?\\.)+[\\p{L}0-9](?:[\\p{L}0-9-]*[\\p{L}0-9])?|\\[(?:(?:25[0-5" +
    "]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-" +
    "9][0-9]?|[\\p{L}0-9-]*[\\p{L}0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21" +
    "-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])"
    
    let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
    return emailPred.evaluate(with: email)
}

private func birthdayValidation(birthday: Date) -> Bool{
    return birthday < Calendar.current.date(byAdding: DateComponents(year: -6), to: Date.now) ?? Date.now
}

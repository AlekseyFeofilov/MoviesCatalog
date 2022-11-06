//
//  TestModelView.swift
//  MovieCatalog
//
//  Created by  Aleksey Feofilov on 03.11.2022.
//

import Foundation
import SwiftUI
import Alamofire

class AuthorizationScreenViewModel: ObservableObject{
    class SignUpViewModel: ObservableObject{
        class SignInViewModel: ObservableObject{
            @Published var login: String = "Fil"
            @Published var password: String = "Ff888888!"
            @Published var wrongPasswordOrLogin = false
        }
        
        var signInViewModel = SignInViewModel()
        
        @Published var email: String = ""
        @Published var name: String = ""
        @Published var confirmedPassword: String = ""
        @Published var birthday: String = ""
        @Published var sex: Gender? = nil
        @Published var selectedDate: Date? = nil
    }
    
    var signUpViewModel = SignUpViewModel()
    @Published var haveAccount: Bool = true
    
    var isActive: Binding<Bool> { Binding (
        get: { self.haveAccount ? self.signInValidate() : self.signUpValidate() },
        set: { _ in }
    )}
    
    private func signInValidate() -> Bool {
        MovieCatalog.signInValidate(login: signUpViewModel.signInViewModel.login, password: signUpViewModel.signInViewModel.password)
    }
    
    private func signUpValidate() -> Bool {
        return false
    }
    
    func authorize(){
        if (haveAccount) {
            signIn()
        }
        else {
            signUp()
        }
    }
    
    private func signUp(){
        if !self.signUpValidate() { return }
        
        
    }
    
    private func signIn(){
        if !self.signInValidate() { return }
        
        let url = baseURL + loginRequestURL
        //var url = "https://react-midterm.kreosoft.space/api/account/login"
        let params = [
            "username" : signUpViewModel.signInViewModel.login,
            "password" : signUpViewModel.signInViewModel.password
        ]
        
        AF.request(
            url,
            method: .post,
            parameters: params,
            encoding: JSONEncoding.default
        ).responseData { [self] response in
            handleResponse(response, params: params) { statusCode in
                if statusCode == 401 {
                    signUpViewModel.signInViewModel.wrongPasswordOrLogin = true
                }
            } resultHandle: { data in
                let result = try? JSONDecoder().decode(Token.self, from: data)
                guard let result = result else { return }
                setToken(result.token)
            }
        }
    }
}


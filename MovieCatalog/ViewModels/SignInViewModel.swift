//
//  SignInViewModel.swift
//  MovieCatalog
//
//  Created by  Aleksey Feofilov on 03.11.2022.
//

import SwiftUI

extension SignInView {
    class SignInViewModel: ObservableObject {
        @Published var login: String = ""
        @Published var password: String = ""
        
        func signIn(){
            //request
        }
    }
}

//
//  SignUpViewModel.swift
//  MovieCatalog
//
//  Created by  Aleksey Feofilov on 03.11.2022.
//

import SwiftUI

extension SignUpView {
    class SignUpModelView: ObservableObject {
        @Published var login: String = ""
        @Published var email: String = ""
        @Published var name: String = ""
        @Published var password: String = ""
        @Published var confirmedPassword: String = ""
        @Published var birthday: String = ""
        @Published var sex: String = ""
    }
}

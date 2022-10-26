//
//  ContentView.swift
//  MovieCatalog
//
//  Created by  Aleksey Feofilov on 24.10.2022.
//
//

import SwiftUI

struct SignIn: View {
    @State private var login: String = ""
    @State private var password: String = ""
//    private var isValidate: Binding<Bool> { Binding (
//            get: { !login.isEmpty && !password.isEmpty },
//            set: { _ in  }
//    )}

    var body: some View {
        VStack {
            CustomTextField(placeholder: "Логин", text: $login)
                    .padding(EdgeInsets(top: 0, leading: 16, bottom: 13, trailing: 16))

            CustomSecureField(placeholder: "Пароль", text: $password)
                    .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
        }
    }
}

struct SignIn_Previews: PreviewProvider {
    static var previews: some View {
        SignIn()
    }
}

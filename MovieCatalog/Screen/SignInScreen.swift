//
//  ContentView.swift
//  MovieCatalog
//
//  Created by  Aleksey Feofilov on 24.10.2022.
//
//

import SwiftUI

struct SignInScreen: View {
    @State private var login: String = ""
    @State private var password: String = ""
    private var isValidate: Binding<Bool> { Binding (
            get: { !login.isEmpty && !password.isEmpty },
            set: { _ in  }
    )}

    var body: some View {
        NavigationView {
            ZStack {
                Color("BackgroundColor")
                        .ignoresSafeArea()

                VStack {
                    Image("LogoImage")

                    Spacer()
                            .frame(height: 96)

                    CustomTextField(
                            placeholder: "Логин",
                            text: $login
                    )
                            .padding(EdgeInsets(top: 0, leading: 16, bottom: 13, trailing: 16))

                    CustomSecureField(
                            placeholder: "Пароль",
                            text: $password
                    )
                            .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))

                    Spacer()

                    Button(action: {}) {
                        Text("Войти")
                    }
                            .padding(EdgeInsets(top: 0, leading: 16, bottom: 8, trailing: 16))
                            .buttonStyle(CustomButtonStyle(active: isValidate))

                    NavigationLink {
                        PlugScreen()
                    } label: {
                            Text("Регистрация")
                                .frame(height: 32)
                    }
                }

            }
                    .navigationBarHidden(true)
        }

    }
}

class SignInScreen_Previews: PreviewProvider {
    static var previews: some View {
        SignInScreen()
    }

    #if DEBUG
    @objc class func injected() {
        let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
        windowScene?.windows.first?.rootViewController =
                UIHostingController(rootView: SignInScreen())
    }
    #endif
}

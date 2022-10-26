//
//  Authorization.swift
//  MovieCatalog
//
//  Created by  Aleksey Feofilov on 25.10.2022.
//

import SwiftUI

struct Authorization: View {
    @State private var haveAccount: Bool = false
    
    var body: some View {
            ZStack {
                Color("BackgroundColor")
                    .ignoresSafeArea()
                
                VStack{
                    Image("LogoImage")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: haveAccount ? 170 : 100)
                        .animation(.easeOut, value: haveAccount)
                    
                    Spacer()
                        .frame(maxHeight: haveAccount ? 96 : 24)
                    
                    if (haveAccount){
                        SignIn()
                            .transition(.opacity)
                    }
                    else {
                        SignUp()
                            .transition(.opacity)
                    }
                    
                    Spacer()
                    
                    Button(action: {}) {
                        Text(haveAccount ? "Войти" : "Зарегистрироваться")
                    }
                    .padding(EdgeInsets(top: 0, leading: 16, bottom: 8, trailing: 16))
                    .buttonStyle(CustomButtonStyle(active: .constant(false)))
                    

                    Text(haveAccount ? "Регистрация" : "У меня уже есть аккаунт")
                        .frame(height: 32)
                        .foregroundColor(Color.accentColor)
                        .onTapGesture {
                            haveAccount.toggle()
                        }

                }
            }
            .animation(.easeOut, value: haveAccount)
    }
}

struct Authorization_Previews: PreviewProvider {
    static var previews: some View {
        Authorization()
    }
}

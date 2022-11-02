//
//  Authorization.swift
//  MovieCatalog
//
//  Created by  Aleksey Feofilov on 25.10.2022.
//

import SwiftUI

struct AuthorizationScreen: View {
    @State private var haveAccount: Bool = false
    
    var body: some View {
            ZStack {
                Color(backgroundColorName)
                    .ignoresSafeArea()
                
                VStack{
                    Image(logoImageName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: haveAccount ? MLogoHeight : SLogoHeight)
                        .animation(.easeOut, value: haveAccount)
                    
                    Spacer()
                        .frame(maxHeight: haveAccount ? MLogoPadding : SLogoPadding)
                    
                    if (haveAccount){
                        SignInView()
                            .transition(.opacity)
                    }
                    else {
                        SignUpView()
                            .transition(.opacity)
                    }
                    
                    Spacer()
                    
                    Button(action: {}) {
                        Text(haveAccount ? signInText : signUpText)
                    }
                    .padding(EdgeInsets(top: 0, leading: MPadding, bottom: SPadding, trailing: MPadding))
                    .buttonStyle(CustomButtonStyle(active: .constant(false)))
                    

                    Text(haveAccount ? registrationText : haveAccountText)
                        .frame(height: SFontSize)
                        .foregroundColor(Color.accentColor)
                        .onTapGesture {
                            haveAccount.toggle()
                        }

                }
            }
            .animation(.easeOut, value: haveAccount)
    }
}

struct AuthorizationScreen_Previews: PreviewProvider {
    static var previews: some View {
        AuthorizationScreen()
    }
}

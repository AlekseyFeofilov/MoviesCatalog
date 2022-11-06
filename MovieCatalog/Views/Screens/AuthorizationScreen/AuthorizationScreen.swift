//
//  Authorization.swift
//  MovieCatalog
//
//  Created by  Aleksey Feofilov on 25.10.2022.
//

import SwiftUI

struct AuthorizationScreen: View {
    @ObservedObject var viewModel = AuthorizationScreenViewModel()
    
    var body: some View {
        ZStack {
            Color(backgroundColorName)
                .ignoresSafeArea()
            
            VStack{
                Image(logoImageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: viewModel.haveAccount ? MLogoHeight : SLogoHeight)
                    .animation(.easeOut, value: viewModel.haveAccount)
                
                Spacer()
                    .frame(maxHeight: (viewModel.haveAccount ? MLogoPadding : SLogoPadding) - 30)
                
                Text(viewModel.signUpViewModel.signInViewModel.wrongPasswordOrLogin ? "Неверный логин или пароль" : "")
                    .foregroundColor(.accentColor)
                    .font(.system(size: 16))
                    .padding(.leading)
                    .frame(maxWidth: .infinity, maxHeight: 30, alignment: .leading)
                
                if (viewModel.haveAccount){
                    SignInView(viewModel.signUpViewModel.signInViewModel)
                        .transition(.opacity)
                }
                else {
                    SignUpView(viewModel.signUpViewModel)
                        .transition(.opacity)
                }
                
                Spacer()
                
                Button(action: viewModel.authorize) {
                    Text(viewModel.haveAccount ? signInText : signUpText)
                }
                .padding(EdgeInsets(top: 0, leading: MPadding, bottom: SPadding, trailing: MPadding))
                .buttonStyle(CustomButtonStyle(active: viewModel.isActive))
                
                
                Text(viewModel.haveAccount ? registrationText : haveAccountText)
                    .frame(height: SFontSize)
                    .foregroundColor(Color.accentColor)
                    .onTapGesture {
                        viewModel.haveAccount.toggle()
                    }
            }
        }
        .animation(.easeOut, value: viewModel.haveAccount)
    }
}

struct AuthorizationScreen_Previews: PreviewProvider {
    static var previews: some View {
        AuthorizationScreen()
    }
}

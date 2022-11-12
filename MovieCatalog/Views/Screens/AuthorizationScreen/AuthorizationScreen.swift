//
//  Authorization.swift
//  MovieCatalog
//
//  Created by  Aleksey Feofilov on 25.10.2022.
//

import SwiftUI

struct AuthorizationScreen: View {
    @ObservedObject var viewModel: AuthorizationScreenViewModel
    
    var body: some View {
        ZStack {
            Color(Assets.backgroundColor)
                .ignoresSafeArea()
            
            VStack{
                Image(Assets.logoImage)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: viewModel.haveAccount ? mediumLogoHeight : smallLogoHeight)
                    .animation(.easeOut, value: viewModel.haveAccount)
                
                Spacer()
                    .frame(maxHeight: viewModel.haveAccount ? mediumLogoPadding : smallLogoPadding)
                
                if (viewModel.haveAccount){
                    SignInView(viewModel: viewModel)
                        .transition(.opacity)
                }
                else {
                    SignUpView(viewModel: viewModel)
                        .transition(.opacity)
                }
                
                Spacer()
                
                Text(viewModel.authorizationError.description)
                    .foregroundColor(.accentColor)
                    .font(.system(size: 16))
                    .padding(.leading)
                    .frame(maxWidth: .infinity, maxHeight: 30, alignment: .leading)
                
                Button(action: viewModel.authorize) {
                    Text(viewModel.haveAccount ? signInText : signUpText)
                }
                .padding(EdgeInsets(top: 0, leading: mediumPadding, bottom: smallPadding, trailing: mediumPadding))
                .buttonStyle(CustomButtonStyle(active: viewModel.isButtonActive))
                
                
                Text(viewModel.haveAccount ? registrationText : haveAccountText)
                    .frame(height: smallFontSize)
                    .foregroundColor(Color.accentColor)
                    .onTapGesture {
                        viewModel.changeAuthorizationWay()
                    }
            }
        }
        .animation(.easeOut, value: viewModel.haveAccount)
    }
}

struct AuthorizationScreen_Previews: PreviewProvider {
    static var previews: some View {
        AuthorizationScreen(viewModel: AuthorizationScreenViewModel(isAthorized: .constant(false)))
    }
}

//
//  SignUpScreen.swift
//  MovieCatalog
//
//  Created by  Aleksey Feofilov on 25.10.2022.
//

import SwiftUI

struct SignUpView: View {
    @ObservedObject var viewModel: AuthorizationScreenViewModel.SignUpViewModel
    
    init(_ viewModel: AuthorizationScreenViewModel.SignUpViewModel){
        self.viewModel = viewModel
    }

    var body: some View {
        VStack(spacing: MPadding){
            TitleTextView(registrationText)
            
            CustomTextField(placeholder: loginText, text: $viewModel.signInViewModel.login)
            CustomTextField(placeholder: emailText, text: $viewModel.email)
            CustomTextField(placeholder: nameText, text: $viewModel.name)
            CustomSecureField(placeholder: passwordText, text: $viewModel.signInViewModel.password)
            CustomSecureField(placeholder: confirmPasswordText, text: $viewModel.confirmedPassword)
            
            DatePickerFieldView(placeholder: birthdayText, text: $viewModel.birthday, savedDate: $viewModel.selectedDate)
            SexButtonView($viewModel.sex)
        }
        .padding(.horizontal, MPadding)
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView(AuthorizationScreenViewModel.SignUpViewModel())
    }
}

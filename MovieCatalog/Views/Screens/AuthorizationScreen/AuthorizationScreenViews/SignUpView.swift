//
//  SignUpScreen.swift
//  MovieCatalog
//
//  Created by  Aleksey Feofilov on 25.10.2022.
//

import SwiftUI

struct SignUpView<ViewModel>: View where ViewModel: SignUpViewModel {
    @ObservedObject var viewModel: ViewModel

    var body: some View {
        VStack(spacing: mediumPadding){
            TitleTextView(registrationText)
            
            CustomTextField(placeholder: loginText, text: $viewModel.login)
            CustomTextField(placeholder: emailText, text: $viewModel.email)
            CustomTextField(placeholder: nameText, text: $viewModel.name)
            CustomSecureField(placeholder: passwordText, text: $viewModel.password)
            CustomSecureField(placeholder: confirmPasswordText, text: $viewModel.confirmedPassword)
            
            DatePickerFieldView(placeholder: birthdayText, text: $viewModel.birthdayString, savedDate: $viewModel.birthdayDate)
            SexButtonView($viewModel.sex)
        }
        .padding(.horizontal, mediumPadding)
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView(viewModel: AuthorizationScreenViewModel(isAthorized: .constant(false)))
    }
}

//
//  SignUpScreen.swift
//  MovieCatalog
//
//  Created by  Aleksey Feofilov on 25.10.2022.
//

import SwiftUI

struct SignUpView: View {
    @ObservedObject var viewModel = SignUpModelView()

    var body: some View {
        VStack(spacing: MPadding){
            TitleTextView(registrationText)
            CustomTextField(placeholder: loginText, text: $viewModel.login)
            CustomTextField(placeholder: emailText, text: $viewModel.email)
            CustomTextField(placeholder: nameText, text: $viewModel.name)
            CustomSecureField(placeholder: passwordText, text: $viewModel.password)
            CustomSecureField(placeholder: confirmPasswordText, text: $viewModel.confirmedPassword)
//            DatePickerFieldView(placeholder: birthdayText, text: $birthday)
            SegmentedButtonView(maleText, leftValue: "М", femaleText, rightValue: "Ж")
        }
        .padding(.horizontal, MPadding)
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}

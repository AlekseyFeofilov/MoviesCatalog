//
//  ContentView.swift
//  MovieCatalog
//
//  Created by  Aleksey Feofilov on 24.10.2022.
//
//

import SwiftUI

struct SignInView<ViewModel>: View where ViewModel: SignInViewModel {
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        VStack(spacing: MPadding) {
            CustomTextField(placeholder: loginText, text: $viewModel.login)
            CustomSecureField(placeholder: passwordText, text: $viewModel.password)
        }
        .padding(.horizontal, MPadding)
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView(viewModel: AuthorizationScreenViewModel())
    }
}

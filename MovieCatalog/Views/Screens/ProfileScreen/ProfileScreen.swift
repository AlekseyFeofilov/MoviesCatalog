//
//  Profile.swift
//  MovieCatalog
//
//  Created by  Aleksey Feofilov on 30.10.2022.
//

import SwiftUI

struct ProfileScreen: View {
    @ObservedObject var viewModel: ProfileScreenViewModel
    
    var body: some View {
        ZStack{
            Color(backgroundColorName)
                .ignoresSafeArea()
            
            VStack{
                HStack(spacing: 16){
                    CustomAsyncImage(url: viewModel.imageUrl, failureImage: Image(profileImageName))
                        .frame(width: 88, height: 88, alignment: .center)
                        .clipShape(Circle())
                    
                    Text(viewModel.nickName)
                        .foregroundColor(.white)
                        .font(Font.custom("SFProText-Bold", size: 24))
                    Spacer()
                }
                
                Spacer()
                
                VStack(alignment: .leading){
                    Text(emailText)
                    CustomTextField(placeholder: "", text: $viewModel.email)
                        .padding(.bottom)
                    Text("Ссылка на аватарку")
                    CustomTextField(placeholder: "", text: $viewModel.imageUrl)
                        .padding(.bottom)
                    Text(nameText)
                    CustomTextField(placeholder: "", text: $viewModel.name)
                        .padding(.bottom)
                    Text(birthdayText)
                    DatePickerFieldView(placeholder: "", text: $viewModel.name, savedDate: $viewModel.birthday)
                        .padding(.bottom)
                    Text("Пол")
                    SexButtonView($viewModel.gender)
                }
                .foregroundColor(Color(grayColorName))
                
                Spacer()
                
                Text(viewModel.profileChangingError.description)
                    .foregroundColor(.accentColor)
                    .font(.system(size: 16))
                    .frame(maxWidth: .infinity, minHeight: 30, alignment: .leading)
                
                Button(action: viewModel.changeProfileInfo) {
                    Text("Сохранить")
                }
                .padding(.bottom, smallPadding)
                .buttonStyle(CustomButtonStyle(active: viewModel.isButtonActive))
                
                Text("Выйти из аккаунта")
                    .frame(height: smallFontSize)
                    .foregroundColor(Color.accentColor)
                    .onTapGesture {
                        viewModel.logout()
                    }
                    .padding(.bottom, smallPadding)
            }
            .padding(.horizontal)
        }
    }
}

struct ProfileScreen_Previews: PreviewProvider {
    static var previews: some View {
        ProfileScreen(viewModel: ProfileScreenViewModel(isAuthorized: .constant(false)))
    }
}

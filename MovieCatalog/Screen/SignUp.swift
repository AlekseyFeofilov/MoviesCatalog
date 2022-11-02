//
//  SignUpScreen.swift
//  MovieCatalog
//
//  Created by  Aleksey Feofilov on 25.10.2022.
//

import SwiftUI

struct SignUp: View {
    @State private var login: String = ""
    @State private var email: String = ""
    @State private var name: String = ""
    @State private var password: String = ""
    @State private var confirmedPassword: String = ""
    @State private var birthday: String = ""
    @State private var sex: String = ""

    var body: some View {
        VStack{
            Title("Регистрация")
            .padding(EdgeInsets(top: 0, leading: 16, bottom: 13, trailing: 16))
            
            CustomTextField(placeholder: "Логин", text: $login)
                .padding(EdgeInsets(top: 0, leading: 16, bottom: 13, trailing: 16))
            
            CustomTextField(placeholder: "E-mail", text: $email)
                .padding(EdgeInsets(top: 0, leading: 16, bottom: 13, trailing: 16))
            
            CustomTextField(placeholder: "Имя", text: $name)
                .padding(EdgeInsets(top: 0, leading: 16, bottom: 13, trailing: 16))
            
            CustomSecureField(placeholder: "Пароль", text: $password)
                .padding(EdgeInsets(top: 0, leading: 16, bottom: 13, trailing: 16))
            
            CustomSecureField(placeholder: "Подтвердите пароль", text: $confirmedPassword)
                .padding(EdgeInsets(top: 0, leading: 16, bottom: 13, trailing: 16))
            
            DatePickerField(placeholder: "Дата рождения", text: $birthday)
                .padding(EdgeInsets(top: 0, leading: 16, bottom: 13, trailing: 16))
            
            SegmentedButton("Мужчина", leftValue: "М", "Женщина", rightValue: "Ж")
                .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
        }
    }
}

struct SignUpScreen_Previews: PreviewProvider {
    static var previews: some View {
        SignUp()
    }
}

//
//  Profile.swift
//  MovieCatalog
//
//  Created by  Aleksey Feofilov on 30.10.2022.
//

import SwiftUI

struct Profile: View {
    @State var url: String
    @State var name: String
    @State var email: String
    @State var birthday: Date
    @State var gender: String
    
    var body: some View {
        ZStack{
            Color("BackgroundColor")
            
            VStack{
                HStack(spacing: 16){
                    Avatar(url: url)
                    Text(name)
                        .foregroundColor(.white)
                        .font(Font.custom("SFProText-Bold", size: 24))
                    Spacer()
                }
                .padding(.leading, 16)
                
                
                VStack{
                    HStack {
                        Text("E-mail")
                        Spacer()
                    }
                    CustomTextField(placeholder: "", text: $email)
                }
                VStack{
                    HStack {
                        Text("Ссылка на аватарку")
                        Spacer()
                    }
                    CustomTextField(placeholder: "", text: $url)
                }
                VStack{
                    HStack {
                        Text("Имя")
                        Spacer()
                    }
                    CustomTextField(placeholder: "", text: $email)
                }
                VStack{
                    HStack {
                        Text("Дата рождения")
                        Spacer()
                    }
                    DatePickerField(placeholder: "", text: $name)
                }
                VStack{
                    HStack {
                        Text("Пол")
                        Spacer()
                    }
                    SegmentedButton("Мужчина", leftValue: "М", "Женщина", rightValue: "Ж")
                }
            }
            .foregroundColor(.white)
            
        }
        .ignoresSafeArea()
    }
}

struct Profile_Previews: PreviewProvider {
    @State static var url: String = "https://sun9-43.userapi.com/impf/c854220/v854220563/136392/vCakNgKV8ho.jpg?size=568x608&quality=96&sign=f4deffe9d8c70e8c617d43e8779afff5&type=album"
    @State static var name: String = "Lyosha"
    @State static var email: String = "mail@mail.ru"
    @State static var birthday: Date = Date.now
    @State static var gender: String = "F"
    
    static var previews: some View {
        Profile(url: url, name: name, email: email, birthday: birthday, gender: gender)
    }
}

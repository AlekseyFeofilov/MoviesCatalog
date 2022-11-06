//
//  CustomTextField.swift
//  MovieCatalog
//
//  Created by  Aleksey Feofilov on 20.10.2022.
//

import SwiftUI

struct CustomSecureField: View {
    var placeholder: String = enterText
    @Binding var text: String
    
    var body: some View {
        SecureField(
            emptyString,
            text: $text
        )
        .textFieldStyle(CustomTextFieldStyle())
        .placeholder(when: text.isEmpty) {
            Text(placeholder)
                .foregroundColor(.gray)
                .padding(.leading, SPadding)
        }
        .frame(height: fieldHeight)
    }
}

struct CustomSecureField_Previews: PreviewProvider {
    @State static var text: String = emptyString
    
    static var previews: some View {
        CustomSecureField(text: $text)
    }
}
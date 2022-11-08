//
//  CustomTextFieldStyle.swift
//  MovieCatalog
//
//  Created by  Aleksey Feofilov on 21.10.2022.
//

import SwiftUI

struct CustomTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<_Label>) -> some View {
        configuration
            .padding(.horizontal, largeCornerRadius)
            .foregroundColor(Color(fakeAccentColorName))
            .frame(height: fieldHeight)
            .overlay{
                RoundedRectangle(cornerRadius: largeCornerRadius)
                    .stroke(Color.gray, lineWidth: mediumFieldStrokeLineWidth)
            }
    }
}

struct CustomTextFieldStyle_Previews: PreviewProvider {
    @State static var text: String = ""
    static var previews: some View {
        TextField("Enter", text: $text)
            .textFieldStyle(CustomTextFieldStyle())
    }
}

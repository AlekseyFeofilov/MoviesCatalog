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
            .padding(.horizontal, LCornerRadius)
            .foregroundColor(Color(fakeAccentColorName))
            .frame(height: fieldHeight)
            .overlay{
                RoundedRectangle(cornerRadius: LCornerRadius)
                    .stroke(Color.gray, lineWidth: MFieldStrokeLineWidth)
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

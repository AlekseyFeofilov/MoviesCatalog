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
                .overlay{
                    RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.gray, lineWidth: 2)
                            .frame(height: 44)
                            .padding(.horizontal, -8)
                }
                .foregroundColor(Color.accentColor)
                .padding(.horizontal, 8)
    }
}

struct CustomTextFieldStyle_Previews: PreviewProvider {
    @State static var text: String = ""
    static var previews: some View {
        TextField("Enter", text: $text)
                .textFieldStyle(CustomTextFieldStyle())
    }
}

//
//  CustomTextField.swift
//  MovieCatalog
//
//  Created by  Aleksey Feofilov on 20.10.2022.
//

import SwiftUI

extension View {
    func placeholder<Content: View>(
            when shouldShow: Bool,
            alignment: Alignment = .leading,
            @ViewBuilder placeholder: () -> Content) -> some View {

        ZStack(alignment: alignment) {
            placeholder().opacity(shouldShow ? 1 : 0)
            self
        }
    }
}

struct CustomTextField: View {
    var placeholder: String = "Enter"
    @State var text: String

    init(_ placeholder: String, text: String) {
        self.placeholder = placeholder
        self.text = text
    }

    var body: some View {
        TextField(
                "",
                text: $text
        )
                .placeholder(when: text.isEmpty){
                    Text(placeholder)
                            .foregroundColor(.gray)
                }
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

struct CustomTextField_Previews: PreviewProvider {
    static var previews: some View {
        CustomTextField("Enter", text: "")
    }
}

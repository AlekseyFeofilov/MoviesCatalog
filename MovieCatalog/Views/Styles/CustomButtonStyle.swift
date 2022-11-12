//
//  CustomButton.swift
//  MovieCatalog
//
//  Created by  Aleksey Feofilov on 21.10.2022.
//

import SwiftUI

struct CustomButtonStyle: ButtonStyle {
    @Binding var active: Bool
    
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .foregroundColor(active ? .white : .accentColor)
            .frame(maxWidth: .infinity)
            .frame(height: fieldHeight)
            .background(
                RoundedRectangle(cornerRadius: mediumCornerRadius)
                    .fill(Color.accentColor.opacity(active ? 1 : 0))
            )
            .overlay{
                RoundedRectangle(cornerRadius: mediumCornerRadius)
                    .stroke(
                        active ? .white : Color(Assets.grayColor),
                        lineWidth: active ? 0 : smallFieldStrokeLineWidth)
            }
    }
}

struct CustomButton_Previews: PreviewProvider {
    @State static var active: Bool = true
    
    static var previews: some View {
        Button(action: {}){
            Text("Button")
        }
        .buttonStyle(CustomButtonStyle(active: $active))
    }
}

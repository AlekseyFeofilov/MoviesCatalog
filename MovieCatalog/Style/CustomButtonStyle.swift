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
        if(active){
            configuration.label
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .frame(height: 44)
                    .background(
                            RoundedRectangle(cornerRadius: 4)
                                    .fill(Color.accentColor)
                    )
                    .overlay{
                        RoundedRectangle(cornerRadius: 4)
                                .stroke(.white, lineWidth: 0)
                    }
        }
        else {
            configuration.label
                    .foregroundColor(.accentColor)
                    .frame(maxWidth: .infinity)
                    .frame(height: 44)
                    .overlay{
                        RoundedRectangle(cornerRadius: 4)
                                .stroke(Color("GrayColor"), lineWidth: 1)
                    }
        }
    }
}

struct CustomButton_Previews: PreviewProvider {
    @State static var active: Bool = false

    static var previews: some View {
        Button(action: {}){
            Text("Button")
        }
                .buttonStyle(CustomButtonStyle(active: $active))
    }
}

//
//  CustomToggleStyle.swift
//  MovieCatalog
//
//  Created by  Aleksey Feofilov on 11.11.2022.
//

import SwiftUI

struct CustomToggleStyle: ToggleStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        HStack {
            configuration.label
            Spacer()
            
            Button {
                configuration.isOn.toggle()
            } label: {
                ZStack{
                    RoundedRectangle(cornerRadius: 4)
                        .stroke(.gray, lineWidth: 1)
                    
                    if configuration.isOn {
                        Image(systemName: "checkmark")
                            .foregroundColor(.accentColor)
                    }
                }
            }
            .frame(width: 24, height: 24, alignment: .center)
        }
    }
}

struct CustomToggleStyle_Previews: PreviewProvider {
    @State static var isOn = true
    
    static var previews: some View {
        Toggle(isOn: $isOn){
            Text("Toggle")
        }
        .toggleStyle(CustomToggleStyle())
    }
}

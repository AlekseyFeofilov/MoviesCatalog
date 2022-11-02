//
//  DividedButton.swift
//  MovieCatalog
//
//  Created by  Aleksey Feofilov on 25.10.2022.
//

import SwiftUI

struct DividedButton: View {
    var text: String
    var side: HalpRoundedRectangle.Side
    var action: () -> Void
    @Binding var activeFlag: Bool
    
    
    
    var body: some View {
        Button(action: action){
            Spacer()
            
            Text (text)
                .foregroundColor(activeFlag ? .white : Color("GrayColor"))
            
            Spacer()
        }
        .background(){
            HalpRoundedRectangle(cornerRadius: 4, roundedSide: side)
                .fill(activeFlag ? Color.accentColor : Color.white.opacity(0))
                .frame(height: 44)
        }
        .overlay{
            HalpRoundedRectangle(cornerRadius: 4, roundedSide: side)
                .stroke(Color.gray, lineWidth: 2)
                .frame(height: 44)
        }
    }
}

struct DividedButton_Previews: PreviewProvider {
    @State static var flag = false
    
    static var previews: some View {
        DividedButton(text: "Button", side: .left, action: {}, activeFlag: $flag)
    }
}

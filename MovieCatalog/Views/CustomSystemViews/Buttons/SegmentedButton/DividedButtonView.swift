//
//  DividedButton.swift
//  MovieCatalog
//
//  Created by  Aleksey Feofilov on 25.10.2022.
//

import SwiftUI

struct DividedButtonView: View {
    var text: String
    var side: HalfRoundedRectangleShape.Side
    var action: () -> Void
    @Binding var activeFlag: Bool

    var body: some View {
        Button(action: action){
            Text (text)
                .foregroundColor(activeFlag ? .white : Color(Assets.grayColor))
                .frame(maxWidth: .infinity, maxHeight: fieldHeight)
        }
        .background(){
            HalfRoundedRectangleShape(cornerRadius: mediumCornerRadius, roundedSide: side)
                .fill(activeFlag ? Color.accentColor : Color.white.opacity(0))
                .frame(height: fieldHeight)
        }
        .overlay{
            HalfRoundedRectangleShape(cornerRadius: mediumCornerRadius, roundedSide: side)
                .stroke(Color.gray, lineWidth: mediumFieldStrokeLineWidth)
                .frame(height: fieldHeight)
        }
    }
}

struct DividedButtonView_Previews: PreviewProvider {
    @State static var flag = false
    
    static var previews: some View {
        DividedButtonView(text: "Button", side: .left, action: {}, activeFlag: $flag)
    }
}

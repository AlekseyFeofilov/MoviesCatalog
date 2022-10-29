//
//  RemoveButton.swift
//  MovieCatalog
//
//  Created by  Aleksey Feofilov on 26.10.2022.
//

import SwiftUI

struct RemoveButton: View {
    var body: some View {
        Button(action: {}){
            Image("XmarkIcon")
                .resizable()
                .frame(width: 4.5, height: 4.5)
        }
        .frame(width: 12, height: 12)
        .background(
            Circle()
                .fill(Color("LightGrayColor"))
        )
        
    }
}

struct RemoveButton_Previews: PreviewProvider {
    static var previews: some View {
        RemoveButton()
    }
}

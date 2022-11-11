//
//  DeleteButtonView.swift
//  MovieCatalog
//
//  Created by  Aleksey Feofilov on 30.10.2022.
//

import SwiftUI

struct DeleteButtonView: View {
    var action: () -> Void
    
    var body: some View {
        Button(action: action, label: {
            Image("LightXmarkIcon")
                .resizable()
                .padding(8)
                .frame(width: 24, height: 25, alignment: .center)
                .background(
                    Circle()
                        .fill(Color(red: 71/256, green: 28/256, blue: 11/256, opacity: 1))
                )
        })
    }
}


struct DeleteButtonView_Previews: PreviewProvider {
    static var previews: some View {
        DeleteButtonView(action: {})
    }
}

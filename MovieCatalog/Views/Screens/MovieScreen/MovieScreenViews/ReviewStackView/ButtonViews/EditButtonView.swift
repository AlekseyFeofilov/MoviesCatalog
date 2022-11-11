//
//  EditReviewButton.swift
//  MovieCatalog
//
//  Created by  Aleksey Feofilov on 30.10.2022.
//

import SwiftUI

struct EditButtonView: View {
    var action: () -> Void
    
    var body: some View {
        Button(action: action, label: {
        Image("EditIcon")
            .resizable()
            .padding(6)
            .frame(width: 24, height: 24, alignment: .center)
            .background(
                Circle()
                    .fill(.gray)
            )
        })
    }
}

struct EditButtonView_Previews: PreviewProvider {
    static var previews: some View {
        EditButtonView(action: {})
    }
}

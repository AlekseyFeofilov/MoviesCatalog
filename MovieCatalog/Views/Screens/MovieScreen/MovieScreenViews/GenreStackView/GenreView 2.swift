//
//  GenreView.swift
//  MovieCatalog
//
//  Created by  Aleksey Feofilov on 30.10.2022.
//

import SwiftUI

struct GenreView: View {
    var text: String
    
    var body: some View {
        Text(text)
            .foregroundColor(.white)
            .padding(EdgeInsets(top: 6, leading: 16, bottom: 6, trailing: 16))
            .font(Font.custom("Montserrat-Medium", size: 12))
            .background(
                    RoundedRectangle(cornerRadius: 8)
                        .fill(Color.accentColor)
            )
    }
}

struct GenreView_Previews: PreviewProvider {
    static var previews: some View {
        GenreView(text: "genre")
    }
}

//
//  GenreStack.swift
//  MovieCatalog
//
//  Created by  Aleksey Feofilov on 31.10.2022.
//

import SwiftUI
import WrappingStack

struct GenreStackView: View {
    var genres: [String]
    
    var body: some View {
        VStack {
            Text("Жанры")
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(Font.custom("IBMPlexSans-Medium", size: 16))
                .foregroundColor(.white)
            .padding(.bottom)
            
            WrappingHStack(id: \.self, alignment: .leading, horizontalSpacing: 8, verticalSpacing: 8) {
                ForEach(genres, id: \.self){ genre in
                    GenreView(text: genre)
                }
            }
        }
    }
}

struct GenreStackView_Previews: PreviewProvider {
    static var previews: some View {
        GenreStackView(genres: ["Драма", "Комедия", "Детектив", "Телепузик", "Остиохандрос"])
    }
}
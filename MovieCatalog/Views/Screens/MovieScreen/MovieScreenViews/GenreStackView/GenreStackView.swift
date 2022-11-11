//
//  GenreStack.swift
//  MovieCatalog
//
//  Created by  Aleksey Feofilov on 31.10.2022.
//

import SwiftUI
import WrappingStack

struct GenreStackView: View {
    var viewModel: GenreSrackViewModel
    
    var body: some View {
        VStack {
            Text("Жанры")
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(Font.custom(IBMPlexSansRegularName, size: 16))
                .foregroundColor(.white)
            .padding(.bottom)
            
            WrappingHStack(id: \.self, alignment: .leading, horizontalSpacing: 8, verticalSpacing: 8) {
                ForEach(viewModel.genres, id: \.self){ genre in
                    GenreView(text: genre.name ?? "")
                }
            }
        }
    }
}

struct GenreStackView_Previews: PreviewProvider {
    static var previews: some View {
        GenreStackView(viewModel: GenreSrackViewModel([GenreModel(id: "1", name: "Классика"), GenreModel(id: "2", name: "Жанр с очень длинным названием, что аж пипец"), GenreModel(id: "3", name: "Рок")]))
    }
}

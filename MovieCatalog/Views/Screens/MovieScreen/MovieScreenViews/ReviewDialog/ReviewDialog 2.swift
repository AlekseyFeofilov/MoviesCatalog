//
//  ReviewDialog.swift
//  MovieCatalog
//
//  Created by  Aleksey Feofilov on 11.11.2022.
//

import SwiftUI

struct ReviewDialog: View {
    @ObservedObject var viewModel: ReviewDialogViewModel
    
    var body: some View {
        VStack(alignment: .center, spacing: 16){
            Text("Оставить отзыв")
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            if viewModel.ownReview != nil {
                StarsRatingView(currentRating: $viewModel.rating)
                    .frame(maxWidth: .infinity)

                ReviewTextView(text: $viewModel.reviewText)
                    .frame(maxWidth: .infinity)

                Toggle(isOn: $viewModel.isAnonymous) {
                    Text("Анонимный комментарий")
                        .foregroundColor(.white)
                }
                .toggleStyle(CustomToggleStyle())
            }
            else{
                ProgressView()
            }
            
            Button {
                viewModel.saveReview()
            } label: {
                Text("Сохранить")
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
            }
            .padding(12)
            .background(
                RoundedRectangle(cornerRadius: mediumCornerRadius)
                    .fill(Color.accentColor)
            )
            
            
            Button {
                viewModel.reviewActive = false
            } label: {
                Text("Отмена")
            }
            .frame(maxWidth: .infinity)

        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color("DarkGrayColor"))
        )
    }
}

struct ReviewDialog_Previews: PreviewProvider {
    static var previews: some View {
        ReviewDialog(viewModel: ReviewDialogViewModel(.constant(true), authorizationFlag: .constant(false), ownReview: nil, movieId: "", moviewScreenViewModel: MovieScreenViewModel(currentMovieId: .constant(nil), authorizationFlag: .constant(false))))
    }
}

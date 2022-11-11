//
//  ReviewStackView.swift
//  MovieCatalog
//
//  Created by  Aleksey Feofilov on 10.11.2022.
//

import SwiftUI

struct ReviewStackView: View {
    @ObservedObject var viewModel: ReviewStackViewModel
    @Binding var isReviewActive: Bool
    var movieId: String
    
    var body: some View {
        VStack{
            HStack{
                Text("Отзывы")
                    .foregroundColor(.white)
                Spacer()
                
                if(!viewModel.haveOwn){
                    Button{
                        isReviewActive = true
                    } label: {
                        Image(systemName: "plus")
                            .foregroundColor(Color.accentColor)
                            .padding(.trailing, 4)
                    }
                }
            }
            
            ForEach(viewModel.reviews) {review in
                ReviewView(viewModel: ReviewViewModel(review, movieId: movieId, ownId: viewModel.ownId, authorizationFlag: viewModel.authorizationFlag, isReviewActive: $isReviewActive, movieScreenViewModel: viewModel.movieScreenViewModel))
            }
        }
    }
}

struct ReviewStackView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color(backgroundColorName)
            
            ReviewStackView(viewModel: ReviewStackViewModel([ReviewModel(id: "1", rating: 1, reviewText: nil, isAnonymous: true, createDateTime: formatDate(Date.now)!, author: UserShortModel(userId: "1", nickName: nil, avatar: nil)), ReviewModel(id: "2", rating: 1, reviewText: nil, isAnonymous: true, createDateTime: formatDate(Date.now)!, author: UserShortModel(userId: "2", nickName: nil, avatar: nil)), ReviewModel(id: "3", rating: 1, reviewText: nil, isAnonymous: true, createDateTime: formatDate(Date.now)!, author: UserShortModel(userId: "3", nickName: nil, avatar: nil))], authorizationFlag: .constant(false), movieScreenViewModel: MovieScreenViewModel(currentMovieId: .constant(nil), authorizationFlag: .constant(false))), isReviewActive: .constant(false), movieId: "")
        }
    }
}

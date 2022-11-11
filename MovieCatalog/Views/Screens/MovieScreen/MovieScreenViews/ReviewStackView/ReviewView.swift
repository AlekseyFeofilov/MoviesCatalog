//
//  Review.swift
//  MovieCatalog
//
//  Created by  Aleksey Feofilov on 30.10.2022.
//

import SwiftUI

struct ReviewView: View {
    let viewModel: ReviewViewModel
    
    var body: some View {
        VStack{            
            VStack{
                HStack{
                    CustomAsyncImage(url: viewModel.review.author.avatar ?? "", failureImage: Image("ProfileImage").resizable())
                        .frame(width: 40, height: 40, alignment: .center)
                        .clipShape(Circle())
                    
                    VStack(alignment: .leading){
                        Text(viewModel.review.isAnonymous ? "Анонимный пользователь" : viewModel.review.author.nickName ?? "")
                            .font(Font.custom("IBMPlexSans-Medium", size: 16))
                        if(viewModel.isMine){
                            Text("мой отзыв")
                                .font(Font.custom(IBMPlexSansRegularName, size: 12))
                                .foregroundColor(.gray)
                        }
                    }
                    
                    Spacer()
                    
                    Ratting(Float(viewModel.review.rating))
                }
                
                Text(viewModel.review.reviewText ?? "")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(Font.custom(IBMPlexSansRegularName, size: 14))
                
                Spacer()
                    .frame(height: 4)
                
                HStack{
                    Text(viewModel.review.createDateTime)
                        .font(Font.custom(IBMPlexSansRegularName, size: 12))
                        .foregroundColor(.gray)
                    Spacer()
                    
                    if(viewModel.isMine){
                        EditButtonView(action: {viewModel.isReviewActive.wrappedValue = true})
                        DeleteButtonView(action: viewModel.deleteReview)
                    }
                }
            }
            .padding(6)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.gray, lineWidth: 1)
            )
        }
        .foregroundColor(.white)
    }
}


struct ReviewView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color(tabBarColorName)
            
            ReviewView(viewModel: ReviewViewModel(ReviewModel(id: "1", rating: 4, reviewText: nil, isAnonymous: true, createDateTime: formatDate(Date.now)!, author: UserShortModel(userId: "1", nickName: nil, avatar: nil)), movieId: "", ownId: nil, authorizationFlag: .constant(false), isReviewActive: .constant(false), movieScreenViewModel: MovieScreenViewModel(currentMovieId: .constant(nil), authorizationFlag: .constant(false))))
        }
    }
}

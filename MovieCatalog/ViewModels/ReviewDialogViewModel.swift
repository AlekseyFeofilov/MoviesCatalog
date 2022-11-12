//
//  ReviewDialogViewModel.swift
//  MovieCatalog
//
//  Created by  Aleksey Feofilov on 11.11.2022.
//

import Foundation
import SwiftUI

class ReviewDialogViewModel: ObservableObject{
    @Published var isAnonymous = false
    @Published var rating = 0
    @Published var reviewText = ""
    @Published var ownReview: ReviewModel? = nil
    var moviewScreenViewModel: MovieScreenViewModel

    var isNew = true
    
    @Binding var reviewActive: Bool
    @Binding var authorizationFlag: Bool
    var movieId: String

    init(_ reviewActive: Binding<Bool>, authorizationFlag: Binding<Bool>, ownReview: ReviewModel?, movieId: String, moviewScreenViewModel: MovieScreenViewModel){
        self.movieId = movieId
        self._authorizationFlag = authorizationFlag
        self._reviewActive = reviewActive
        self.ownReview = ownReview
        self.moviewScreenViewModel = moviewScreenViewModel
        
        getProfileInfo(authorizationFlag: authorizationFlag) { [self] profileModel in
            if ownReview != nil {
                self.isNew = false
                self.ownReview = ownReview
                self.isAnonymous = ownReview!.isAnonymous
                self.reviewText = ownReview!.reviewText ?? ""
                self.rating = ownReview!.rating
            }
            else {
                self.ownReview = ReviewModel(id: "", rating: 0, reviewText: "", isAnonymous: false, createDateTime: Date.now.formatDate()!, author: UserShortModel(userId: profileModel.id, nickName: profileModel.nickName, avatar: profileModel.avatarLink))
            }
        }
    }
    
    func saveReview(){
        guard ownReview != nil else { return }
        guard rating > 0 else { return }
        
        if isNew {
            MovieCatalog.addReview(ReviewModifyModel(reviewText: reviewText, rating: rating, isAnonymous: isAnonymous), movieId: movieId, authorizationFlag: $authorizationFlag, statusHandle: {_ in
                
                getMovieDetails(self.movieId, authorizationFlag: self.$authorizationFlag) { movieDetails in
                    var reviews = movieDetails.reviews ?? []
                    let ownReviewIndex = reviews.firstIndex(where: { it in it.author.userId == self.ownReview!.author.userId})
                    self.ownReview = reviews.remove(at: ownReviewIndex!)
                    reviews.insert(self.ownReview!, at: 0)
                    self.moviewScreenViewModel.reviewStackViewModel!.reviews = reviews
                    self.moviewScreenViewModel.reviewStackViewModel!.haveOwn = true
                }
            })
        }
        else{
            MovieCatalog.editReview(ReviewModifyModel(reviewText: reviewText, rating: rating, isAnonymous: isAnonymous), movieId: movieId, reviewId: ownReview!.id, authorizationFlag: $authorizationFlag, statusHandle: {_ in
                
                getMovieDetails(self.movieId, authorizationFlag: self.$authorizationFlag) { movieDetails in
                    var reviews = movieDetails.reviews ?? []
                    let ownReviewIndex = reviews.firstIndex(where: { it in it.author.userId == self.ownReview!.author.userId})
                    self.ownReview = reviews.remove(at: ownReviewIndex!)
                    reviews.insert(self.ownReview!, at: 0)
                    self.moviewScreenViewModel.reviewStackViewModel!.reviews = reviews
                }
            })
        }
        
    
        
        reviewActive = false
    }
}

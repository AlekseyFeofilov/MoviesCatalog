//
//  File.swift
//  MovieCatalog
//
//  Created by  Aleksey Feofilov on 10.11.2022.
//

import Foundation
import SwiftUI

class ReviewViewModel: ObservableObject{
    @Published var review: ReviewModel
    @Published var isMine: Bool
    var movieId: String
    var isReviewActive: Binding<Bool>
    var authorizationFlag: Binding<Bool>
    var movieScreenViewModel: MovieScreenViewModel
    
    init(_ review: ReviewModel, movieId: String, ownId: String?, authorizationFlag: Binding<Bool>, isReviewActive: Binding<Bool>, movieScreenViewModel: MovieScreenViewModel){
        self.movieScreenViewModel = movieScreenViewModel
        self.review = review
        self.isMine = review.author.userId == ownId ?? ""
        self.authorizationFlag = authorizationFlag
        self.isReviewActive = isReviewActive
        self.movieId = movieId
    }
    
    func deleteReview(){
        MovieCatalog.deleteReview(movieId: movieId, reviewId: review.id, authorizationFlag: authorizationFlag) { _ in
            getMovieDetails(self.movieId, authorizationFlag: self.authorizationFlag) { movieDetails in
                self.movieScreenViewModel.reviewStackViewModel!.reviews = movieDetails.reviews ?? []
                self.movieScreenViewModel.reviewStackViewModel!.haveOwn = false
            }
        }
    }
}

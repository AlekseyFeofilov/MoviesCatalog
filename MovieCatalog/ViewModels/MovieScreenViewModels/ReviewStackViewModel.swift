//
//  ReviewStackViewModel.swift
//  MovieCatalog
//
//  Created by  Aleksey Feofilov on 10.11.2022.
//

import Foundation
import SwiftUI

class ReviewStackViewModel: ObservableObject{
    @Published var reviews: [ReviewModel]
    @Published var ownId: String? = nil
    @Published var haveOwn: Bool = false
    var ownReview: ReviewModel? = nil
    var authorizationFlag: Binding<Bool>
    var movieScreenViewModel: MovieScreenViewModel
    
    init(_ reviews: [ReviewModel], authorizationFlag: Binding<Bool>, movieScreenViewModel: MovieScreenViewModel){
        self.movieScreenViewModel = movieScreenViewModel
        self.authorizationFlag = authorizationFlag
        self.reviews = reviews
        
        self.ownId = UserIdRepository().getUserId()
        let ownReviewIndex = reviews.firstIndex(where: { it in it.author.userId == self.ownId})
        
        if ownReviewIndex != nil {
            self.haveOwn = true
            self.ownReview = self.reviews.remove(at: ownReviewIndex!)
            self.reviews.insert(self.ownReview!, at: 0)
        }
    }
}

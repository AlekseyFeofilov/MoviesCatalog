//
//  MovieScreenViewModel.swift
//  MovieCatalog
//
//  Created by  Aleksey Feofilov on 10.11.2022.
//

import Foundation
import SwiftUI

class MovieScreenViewModel: ObservableObject{
    @Published var offset: CGFloat = 250
    @Published var contentHeight: CGFloat = 0
    @Published var isReviewActive: Bool = false
    @Published var reviewStackViewModel: ReviewStackViewModel? = nil
    
    @Published var movieDetails: MovieDetailsModel? = nil
    var authorizationFlag: Binding<Bool>
    var currentMovieId: Binding<String?>
    
    init(currentMovieId: Binding<String?>, authorizationFlag: Binding<Bool>){
        self.authorizationFlag = authorizationFlag
        self.currentMovieId = currentMovieId
        
        getMovieDetails(currentMovieId.wrappedValue!, authorizationFlag: authorizationFlag) { movieDetails in
            self.movieDetails = movieDetails
            
            self.reviewStackViewModel = ReviewStackViewModel(movieDetails.reviews ?? [], authorizationFlag: authorizationFlag, movieScreenViewModel: self)
        }
    }
}

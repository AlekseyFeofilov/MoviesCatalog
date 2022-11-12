//
//  MovieScreen.swift
//  MovieCatalog
//
//  Created by  Aleksey Feofilov on 30.10.2022.
//

import SwiftUI

struct MovieScreen: View {
    @ObservedObject var viewModel: MovieScreenViewModel
    
    var body: some View {
        ZStack {
            Color(Assets.backgroundColor)
                .ignoresSafeArea()
            
            ToolbarView(imageStringUrl: viewModel.movieDetails?.poster ?? "", startOffset: 300, title: viewModel.movieDetails?.name ?? "", viewModel: ToolbarViewModel(offset: viewModel.offset, currentMoveId: viewModel.currentMovieId, authorizationFlag: viewModel.authorizationFlag) /*offset: $viewModel.offset, currentMoveId: viewModel.currentMovieId*/)
                .zIndex(1)
            
            if viewModel.movieDetails != nil {
                GeometryReader{ outerProxy in
                    ScrollView(showsIndicators: false){
                        Spacer()
                            .frame(height: 300)
                        ZStack {
                            GeometryReader{ geometry in
                                Rectangle()
                                    .fill(Color.orange.opacity(0))
                                    .onChange(of: geometry.frame(in: .named("MovieScreenView"))) { imageRect in
                                        viewModel.offset = imageRect.origin.y
                                    }
                            }
                            
                            VStack{
                                MovieInfoView(viewModel: MovieInfoViewModel(viewModel.movieDetails!))
                                    .padding(.bottom)
                                
                                if viewModel.reviewStackViewModel != nil {
                                    ReviewStackView(viewModel: viewModel.reviewStackViewModel!, isReviewActive: $viewModel.isReviewActive, movieId: viewModel.movieDetails!.id)
                                }
                            }
                        }
                    }
                    .coordinateSpace(name: "MovieScreenView")
                    .padding(.horizontal)
                }
                .sheet(isPresented: $viewModel.isReviewActive) {
                    ReviewDialog(viewModel: ReviewDialogViewModel($viewModel.isReviewActive, authorizationFlag: viewModel.authorizationFlag, ownReview: viewModel.reviewStackViewModel?.ownReview, movieId: viewModel.movieDetails!.id, moviewScreenViewModel: viewModel))
                        .background(BackgroundClearView())
                }
            }
            else {
                ProgressView()
            }
        }
    }
}

struct MovieScreen_Previews: PreviewProvider {
    static var previews: some View {
        MovieScreen(viewModel: MovieScreenViewModel(currentMovieId: .constant("b6c5228b-91fb-43a1-a2ac-08d9b9f3d2a2"), authorizationFlag: .constant(false)))
    }
}

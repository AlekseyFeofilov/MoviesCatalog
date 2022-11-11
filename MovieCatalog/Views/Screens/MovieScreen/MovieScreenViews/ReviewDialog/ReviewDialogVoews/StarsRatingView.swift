//
//  StarsRating.swift
//  MovieCatalog
//
//  Created by  Aleksey Feofilov on 11.11.2022.
//

import SwiftUI

struct StarsRatingView: View {
    @Binding var currentRating: Int
    
    var body: some View {
        HStack{
            ForEach(1..<11) { starIndex in
                Button {
                    currentRating = starIndex
                } label: {
                    if starIndex > currentRating {
                        Image(systemName: "star")
                            .foregroundColor(Color("FadedGrayColor"))
                            .frame(width: 16, height: 16, alignment: .center)
                    }
                    else {
                        Image(systemName: "star.fill")
                            .resizable()
                            .frame(width: 16, height: 16, alignment: .center)
                            .opacity(0.8)
                            .background(
                                Circle()
                                    .fill(Color.accentColor.opacity(0.2))
                                    .frame(width: 24, height: 24, alignment: .center)
                            )
                    }
                }
                .frame(width: 24, height: 24, alignment: .center)
                .animation(.easeIn, value: currentRating)
            }
            .frame(maxWidth: .infinity)
        }
    }
}

struct StarsRatingView_Previews: PreviewProvider {
    static var previews: some View {
        StarsRatingView(currentRating: .constant(2))
    }
}

//
//  MovieScreenPoster.swift
//  MovieCatalog
//
//  Created by  Aleksey Feofilov on 30.10.2022.
//

import SwiftUI

struct PosterView: View {
    var imageStringUrl: String
    var height: CGFloat
    @Binding var offset: CGFloat
    
    var body: some View {
        CustomAsyncImage(url: imageStringUrl, failureImage:  Image("ProfileImage"))
        .aspectRatio(contentMode: .fill)
        .frame(height: animationState(min: 100, minValue: 100, max: height, maxValue: height, current: offset))
        .clipped() // todo: clipShape (halfRoundedRectangle)
        .overlay(
            Rectangle()
                .fill(Color("BackgroundColor"))
                .opacity( animationState(min: 1, minValue: 100, max: 0, maxValue: height, current: offset))
        )
    }
}

struct PosterView_Previews: PreviewProvider {
    @State static var offset: CGFloat = 250
    
    static var previews: some View {
        PosterView(imageStringUrl: "https://sun9-43.userapi.com/impf/c854220/v854220563/136392/vCakNgKV8ho.jpg?size=568x608&quality=96&sign=f4deffe9d8c70e8c617d43e8779afff5&type=album", height: 250, offset: $offset)
    }
}

//
//  MovieScreenPoster.swift
//  MovieCatalog
//
//  Created by  Aleksey Feofilov on 30.10.2022.
//

import SwiftUI

struct MovieScreenPoster: View {
    var imageStringUrl: String
    var height: CGFloat
    @Binding var offset: CGFloat
    
    var body: some View {
        CustomAsyncImage(imageStringUrl: imageStringUrl, failureImage:  Image("ProfileImage"))
        .aspectRatio(contentMode: .fill)
        .frame(height: animtionState(whenVariable: offset, lessThen: 100, minState: 100, moreThen: height, maxState: height, elseCalculateBy: offset))
        .clipped() // todo: clipShape (halfRoundedRectangle)
        .overlay(
            Rectangle()
                .fill(Color("BackgroundColor"))
                .opacity(animtionState(whenVariable: offset, lessThen: 100, minState: 1, moreThen: height, maxState: 0, elseCalculateBy: Double((height - offset) / (height - 100))))
        )
    }
}

struct MovieScreenPoster_Previews: PreviewProvider {
    @State static var offset: CGFloat = 100
    
    static var previews: some View {
        MovieScreenPoster(imageStringUrl: "https://sun9-43.userapi.com/impf/c854220/v854220563/136392/vCakNgKV8ho.jpg?size=568x608&quality=96&sign=f4deffe9d8c70e8c617d43e8779afff5&type=album", height: 250, offset: $offset)
    }
}
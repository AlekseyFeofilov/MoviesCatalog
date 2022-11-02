//
//  Toolbar.swift
//  MovieCatalog
//
//  Created by  Aleksey Feofilov on 30.10.2022.
//

import SwiftUI

struct Toolbar: View {
    var imageStringUrl: String
    var startOffset: CGFloat
    @Binding var offset: CGFloat
    
    var body: some View {
        ZStack {
            VStack {
                MovieScreenPoster(imageStringUrl: imageStringUrl, height: startOffset, offset: $offset)
                Spacer()
            }
            .ignoresSafeArea()
            
            VStack {
                Spacer()
                    .frame(height: animtionState(whenVariable: offset, lessThen: 0, minState: 0, moreThen: startOffset, maxState: startOffset - 100, elseCalculateBy: offset - 100))
                
                HStack{
                    Spacer()
                        .frame(width: animtionState(whenVariable: offset, lessThen: 100, minState: 52, moreThen: startOffset, maxState: 0, elseCalculateBy: 52 * (offset - startOffset) / (100 - startOffset)))
                    
                    Text("Moview name")
                        .font(.system(size: animtionState(whenVariable: offset, lessThen: 100, minState: 24, moreThen: startOffset, maxState: 36, elseCalculateBy: 24 + 12 * (offset - 100) / (startOffset - 100))))
                        .foregroundColor(.white)
                        .coordinateSpace(name: "NavBar")
                    
                    Spacer()
                    
                    Image(systemName: "heart")
                        .opacity(animtionState(whenVariable: offset, lessThen: 0, minState: 1, moreThen: startOffset, maxState: 0, elseCalculateBy: 1 - Double(offset / startOffset)))
                        .foregroundColor(Color.accentColor)
                }
                .padding(.horizontal)
                
                Spacer()
            }
        }
    }
}

struct Toolbar_Previews: PreviewProvider {
    @State static var offset: CGFloat = 250
    
    static var previews: some View {
        Toolbar(imageStringUrl: "https://sun9-43.userapi.com/impf/c854220/v854220563/136392/vCakNgKV8ho.jpg?size=568x608&quality=96&sign=f4deffe9d8c70e8c617d43e8779afff5&type=album", startOffset: 250, offset: $offset)
    }
}

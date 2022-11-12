//
//  Toolbar.swift
//  MovieCatalog
//
//  Created by  Aleksey Feofilov on 30.10.2022.
//

import SwiftUI

struct ToolbarView: View {
    var imageStringUrl: String
    var startOffset: CGFloat
    var title: String
//    @Binding var offset: CGFloat
//    @Binding var currentMoveId: String?
    
    @ObservedObject var viewModel: ToolbarViewModel
    
    var body: some View {
        ZStack {
            VStack {
                PosterView(imageStringUrl: imageStringUrl, height: startOffset, offset: $viewModel.offset)
                Spacer()
            }
            .ignoresSafeArea()
            
            
            HStack {
                VStack {
                    Button {
                        viewModel.currentMoveId = nil
                    } label: {
                        Image("ArrowIcon")
                    }
                    .padding(.leading)
                    .padding(.top, 4)
                    
                    Spacer()
                }
                Spacer()
            }

            
            VStack {
                Spacer()
                    .frame(height: animationState(min: 0, minValue: 100, max: startOffset - 100, maxValue: startOffset, current: viewModel.offset))
                
                HStack{
                    Spacer()
                        .frame(width: animationState(min: 52, minValue: 100, max: 0, maxValue: startOffset, current: viewModel.offset))
                    
                    Text(title)
                        .font(.system(size: animationState(min: 24, minValue: 100, max: 36, maxValue: startOffset, current: viewModel.offset)))
                        .foregroundColor(.white)
                        .coordinateSpace(name: "NavBar")
                    
                    Spacer()
                    
                    Image(systemName: viewModel.isFavorite ? "heart.fill" : "heart")
                        .opacity(animationState(min: 1, minValue: 0, max: 0, maxValue: startOffset, current: viewModel.offset))
                        .foregroundColor(Color.accentColor)
                        .onTapGesture {
                            viewModel.refavorite()
                        }
                }
                .padding(.horizontal)
                
                Spacer()
            }
        }
    }
}

struct ToolbarView_Previews: PreviewProvider {
    @State static var offset: CGFloat = 0
    
    static var previews: some View {
        ToolbarView(imageStringUrl: "https://sun9-43.userapi.com/impf/c854220/v854220563/136392/vCakNgKV8ho.jpg?size=568x608&quality=96&sign=f4deffe9d8c70e8c617d43e8779afff5&type=album", startOffset: 250, title: "Movie name", /*offset: $offset, currentMoveId: .constant(nil),*/ viewModel: ToolbarViewModel(offset: 250, currentMoveId: .constant(""), authorizationFlag: .constant(false)))
    }
}

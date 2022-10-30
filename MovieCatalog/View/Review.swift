//
//  Review.swift
//  MovieCatalog
//
//  Created by  Aleksey Feofilov on 30.10.2022.
//

import SwiftUI

struct Review: View {
    var avatar: String
    var name: String
    var isAnonymous: Bool
    var isMine: Bool
    var createdTime: String
    var ratting: Float
    var reviewText: String
    var haveOwn: Bool
    
    @State var showReview: Bool = false
    
    var body: some View {
        ZStack {
            VStack{
                HStack{
                    Text("Отзывы")
                    Spacer()
                    
                    if(!haveOwn){
                        Image(systemName: "plus")
                            .foregroundColor(Color.accentColor)
                            .padding(.trailing, 4)
                            .onTapGesture {
                                showReview = true
                            }
                    }
                }
                
                VStack{
                    HStack{
                        AsyncImage(url: URL(string: avatar)){ phase in
                            switch phase {
                            case .empty:
                                ProgressView()
                                
                            case .success(let image):
                                if(isAnonymous){
                                    Image("ProfileImage")
                                }
                                else{
                                    image
                                        .resizable()
                                        .frame(width: 40, height: 40, alignment: .center)
                                        .clipShape(Circle())
                                }
                                
                            case .failure:
                                Image("ProfileImage")
                                
                            @unknown default:
                                EmptyView()
                            }
                        }
                        
                        VStack(alignment: .leading){
                            Text(isAnonymous ? "Анонимный пользователь" : name)
                                .font(Font.custom("IBMPlexSans-Medium", size: 16))
                            if(isMine){
                                Text("мой отзыв")
                                    .font(Font.custom("IBMPlexSans-Regular", size: 12))
                                    .foregroundColor(.gray)
                            }
                        }
                        
                        Spacer()
                        
                        Ratting(ratting)
                    }
                    
                    Text(reviewText)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(Font.custom("IBMPlexSans-Regular", size: 14))
                    
                    Spacer()
                        .frame(height: 4)
                    
                    HStack{
                        Text(createdTime)
                            .font(Font.custom("IBMPlexSans-Regular", size: 12))
                            .foregroundColor(.gray)
                        Spacer()
                        
                        if(isMine){
                            EditButton()
                                .onTapGesture {
                                    showReview = true
                                }
                            DeleteButton()
                        }
                    }
                }
                .padding(6)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.gray, lineWidth: 1)
                )
            }
            
            if(showReview){
                Color.black.opacity(0.2)
                    .ignoresSafeArea()
                
                ReviewDialog()
            }
        }
    }
}

struct Review_Previews: PreviewProvider {
    static var previews: some View {
        Review(avatar: "https://sun9-43.userapi.com/impf/c854220/v854220563/136392/vCakNgKV8ho.jpg?size=568x608&quality=96&sign=f4deffe9d8c70e8c617d43e8779afff5&type=album", name: "Aleksey", isAnonymous: false, isMine: false, createdTime: "07.10.2022", ratting: 8.7, reviewText: "So so so so so so so so so so so so so so so so os oso so so soso so soso soos so os os osos os ososos oos ososos osososososososos o", haveOwn: true)
    }
}

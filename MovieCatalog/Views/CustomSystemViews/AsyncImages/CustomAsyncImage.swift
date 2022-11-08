//
//  CustomAsyncImage.swift
//  MovieCatalog
//
//  Created by  Aleksey Feofilov on 30.10.2022.
//

import SwiftUI

struct CustomAsyncImage: View {
    var imageStringUrl: String
    var failureImage: Image
    
    var body: some View {
        AsyncImage(url: URL(string: imageStringUrl)){phase in
            switch phase {
            case .empty:
                failureImage
                
            case .success(let image):
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                
            case .failure:
                failureImage
                
            @unknown default:
                EmptyView()
            }
        }
    }
}

struct CustomAsyncImage_Previews: PreviewProvider {
    static var previews: some View {
        CustomAsyncImage(imageStringUrl: "https://sun9-43.userapi.com/impf/c854220/v854220563/136392/vCakNgKV8ho.jpg?size=568x608&quality=96&sign=f4deffe9d8c70e8c617d43e8779afff5&type=album", failureImage: Image("ProfileImage"))
    }
}

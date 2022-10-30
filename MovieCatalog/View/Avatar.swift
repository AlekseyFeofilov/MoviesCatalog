//
//  Avatar.swift
//  MovieCatalog
//
//  Created by  Aleksey Feofilov on 29.10.2022.
//

import SwiftUI

struct Avatar: View {
    var url: String
    
    var body: some View {
        AsyncImage(url: URL(string: url)){ phase in
            switch phase {
            case .empty:
                ProgressView()
                
            case .success(let image):
                image
                    .resizable()
                    .frame(width: 88, height: 88, alignment: .center)
                    .clipShape(Circle())
                
            case .failure:
                Image("ProfileImage")
                
            @unknown default:
                EmptyView()
            }
        }
    }
}

struct Avatar_Previews: PreviewProvider {
    static var previews: some View {
        Avatar(url: "https://sun9-43.userapi.com/impf/c854220/v854220563/136392/vCakNgKV8ho.jpg?size=568x608&quality=96&sign=f4deffe9d8c70e8c617d43e8779afff5&type=album")
    }
}

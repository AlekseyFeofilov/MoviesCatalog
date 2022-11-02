//
//  MovieScreen.swift
//  MovieCatalog
//
//  Created by  Aleksey Feofilov on 30.10.2022.
//

import SwiftUI

struct MovieScreen: View {
    @State var offset: CGFloat = 250
    @State var contentHeight: CGFloat = 0
    
    var body: some View {
        ZStack {
            Color("BackgroundColor")
                .ignoresSafeArea()
            
            Toolbar(imageStringUrl: "https://sun9-43.userapi.com/impf/c854220/v854220563/136392/vCakNgKV8ho.jpg?size=568x608&quality=96&sign=f4deffe9d8c70e8c617d43e8779afff5&type=album", startOffset: 250, offset: $offset)
                .zIndex(1)
            
            
            ScrollView{
                Spacer()
                    .frame(height: 250)
                
                GeometryReader{ proxy in
                    VStack{
                        
                        MovieInfo(description: "Бухгалтер Энди Дюфрейн обвинён в убийстве собственной жены и её любовника. Оказавшись в тюрьме под названием Шоушенк, он сталкивается с жестокостью и беззаконием, царящими по обе стороны решётки. Каждый, кто попадает в эти стены, становится их рабом до конца жизни. Но Энди, обладающий живым умом и доброй душой, находит подход как к заключённым, так и к охранникам, добиваясь их особого к себе расположения", Year: 1994, Country: "США", Time: "142 мин.", Slogan: "«Страх - это кандалы. Надежда - это свобода»", Producer: "Фрэнк Дарабонт", Budget: "$25 000 000", Fees: "$28 418 687", Age: "16+")
                            .padding(.bottom)
                        MovieInfo(description: "Бухгалтер Энди Дюфрейн обвинён в убийстве собственной жены и её любовника. Оказавшись в тюрьме под названием Шоушенк, он сталкивается с жестокостью и беззаконием, царящими по обе стороны решётки. Каждый, кто попадает в эти стены, становится их рабом до конца жизни. Но Энди, обладающий живым умом и доброй душой, находит подход как к заключённым, так и к охранникам, добиваясь их особого к себе расположения", Year: 1994, Country: "США", Time: "142 мин.", Slogan: "«Страх - это кандалы. Надежда - это свобода»", Producer: "Фрэнк Дарабонт", Budget: "$25 000 000", Fees: "$28 418 687", Age: "16+")
                            .padding(.bottom)
                        MovieInfo(description: "Бухгалтер Энди Дюфрейн обвинён в убийстве собственной жены и её любовника. Оказавшись в тюрьме под названием Шоушенк, он сталкивается с жестокостью и беззаконием, царящими по обе стороны решётки. Каждый, кто попадает в эти стены, становится их рабом до конца жизни. Но Энди, обладающий живым умом и доброй душой, находит подход как к заключённым, так и к охранникам, добиваясь их особого к себе расположения", Year: 1994, Country: "США", Time: "142 мин.", Slogan: "«Страх - это кандалы. Надежда - это свобода»", Producer: "Фрэнк Дарабонт", Budget: "$25 000 000", Fees: "$28 418 687", Age: "16+")
                            .padding(.bottom)
                        MovieInfo(description: "Бухгалтер Энди Дюфрейн обвинён в убийстве собственной жены и её любовника. Оказавшись в тюрьме под названием Шоушенк, он сталкивается с жестокостью и беззаконием, царящими по обе стороны решётки. Каждый, кто попадает в эти стены, становится их рабом до конца жизни. Но Энди, обладающий живым умом и доброй душой, находит подход как к заключённым, так и к охранникам, добиваясь их особого к себе расположения", Year: 1994, Country: "США", Time: "142 мин.", Slogan: "«Страх - это кандалы. Надежда - это свобода»", Producer: "Фрэнк Дарабонт", Budget: "$25 000 000", Fees: "$28 418 687", Age: "16+")
                            .padding(.bottom)

                        GenreStack(genres: ["Драма", "Комедия", "Детектив", "Телепузик", "Остиохандрос"])
                        
                        Review(avatar: "https://sun9-43.userapi.com/impf/c854220/v854220563/136392/vCakNgKV8ho.jpg?size=568x608&quality=96&sign=f4deffe9d8c70e8c617d43e8779afff5&type=album", name: "Aleksey", isAnonymous: false, isMine: false, createdTime: "07.10.2022", ratting: 8.7, reviewText: "So so so so so so so so so so so so so so so so os oso so so soso so soso soos so os os osos os ososos oos ososos osososososososos o", haveOwn: true)
                        
                        
                    }
                    .onChange(of: proxy.frame(in: .global)) { newValue in
                        offset = newValue.origin.y - proxy.frame(in: .named("NavBar")).height
                    }
                }
                .padding(.horizontal)
            }
        }
    }
}

struct MovieScreen_Previews: PreviewProvider {
    static var previews: some View {
        MovieScreen()
    }
}

//
//  MovieDescription.swift
//  MovieCatalog
//
//  Created by  Aleksey Feofilov on 30.10.2022.
//

import SwiftUI

struct MovieInfo: View {
    var description: String
    var Year: Int
    var Country: String
    var Time: String
    var Slogan: String
    var Producer: String
    var Budget: String
    var Fees: String
    var Age: String
    
    var body: some View {
        VStack{
            Text(description)
                .foregroundColor(.white)
                .font(Font.custom("IBMPlexSans-Regular", size: 14))
                .fixedSize(horizontal: false, vertical: true)
                
            AboutMovie(Year: Year, Country: Country, Time: Time, Slogan: Slogan, Producer: Producer, Budget: Budget, Fees: Fees, Age: Age)
                .padding(.top)
        }
    }
}

struct MovieInfo_Previews: PreviewProvider {
    static var previews: some View {
        MovieInfo(description: "Бухгалтер Энди Дюфрейн обвинён в убийстве собственной жены и её любовника. Оказавшись в тюрьме под названием Шоушенк, он сталкивается с жестокостью и беззаконием, царящими по обе стороны решётки. Каждый, кто попадает в эти стены, становится их рабом до конца жизни. Но Энди, обладающий живым умом и доброй душой, находит подход как к заключённым, так и к охранникам, добиваясь их особого к себе расположения", Year: 1994, Country: "США", Time: "142 мин.", Slogan: "«Страх - это кандалы. Надежда - это свобода»", Producer: "Фрэнк Дарабонт", Budget: "$25 000 000", Fees: "$28 418 687", Age: "16+")
    }
}

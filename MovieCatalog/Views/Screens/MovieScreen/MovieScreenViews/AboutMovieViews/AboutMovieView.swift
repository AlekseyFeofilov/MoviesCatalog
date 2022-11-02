//
//  AboutMovie.swift
//  MovieCatalog
//
//  Created by  Aleksey Feofilov on 30.10.2022.
//

import SwiftUI

struct AboutMovieView: View {
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
            Text("О фильме")
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(Font.custom("IBMPlexSans-Medium", size: 16))
                .foregroundColor(.white)
                .padding(.bottom)
            
            movieCharacteristicView(characteristicName: "Год", characteristicValue: String(Year))
            movieCharacteristicView(characteristicName: "Страна", characteristicValue: Country)
            movieCharacteristicView(characteristicName: "Время", characteristicValue: Time)
            movieCharacteristicView(characteristicName: "Слоган", characteristicValue: Slogan)
            movieCharacteristicView(characteristicName: "Режисёр", characteristicValue: Producer)
            movieCharacteristicView(characteristicName: "Бюджет", characteristicValue: Budget)
            movieCharacteristicView(characteristicName: "Сборы в мире", characteristicValue: Fees)
            movieCharacteristicView(characteristicName: "Возраст", characteristicValue: Age)
        }
    }
}

struct AboutMovieView_Previews: PreviewProvider {
    static var previews: some View {
        AboutMovieView(Year: 1994, Country: "США", Time: "142 мин.", Slogan: "«Страх - это кандалы. Надежда - это свобода»", Producer: "Фрэнк Дарабонт", Budget: "$25 000 000", Fees: "$28 418 687", Age: "16+")
    }
}

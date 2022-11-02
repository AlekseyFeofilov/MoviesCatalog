//
//  AboutMovie.swift
//  MovieCatalog
//
//  Created by  Aleksey Feofilov on 30.10.2022.
//

import SwiftUI

struct AboutMovie: View {
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
            
            movieCharacteristic(characteristicName: "Год", characteristicValue: String(Year))
            movieCharacteristic(characteristicName: "Страна", characteristicValue: Country)
            movieCharacteristic(characteristicName: "Время", characteristicValue: Time)
            movieCharacteristic(characteristicName: "Слоган", characteristicValue: Slogan)
            movieCharacteristic(characteristicName: "Режисёр", characteristicValue: Producer)
            movieCharacteristic(characteristicName: "Бюджет", characteristicValue: Budget)
            movieCharacteristic(characteristicName: "Сборы в мире", characteristicValue: Fees)
            movieCharacteristic(characteristicName: "Возраст", characteristicValue: Age)
        }
    }
}

struct AboutMovie_Previews: PreviewProvider {
    static var previews: some View {
        AboutMovie(Year: 1994, Country: "США", Time: "142 мин.", Slogan: "«Страх - это кандалы. Надежда - это свобода»", Producer: "Фрэнк Дарабонт", Budget: "$25 000 000", Fees: "$28 418 687", Age: "16+")
    }
}

//
//  movieCharacteristic.swift
//  MovieCatalog
//
//  Created by  Aleksey Feofilov on 30.10.2022.
//

import SwiftUI

struct MovieCharacteristicView: View {
    var characteristicName: String
    var characteristicValue: String
    
    var body: some View {
        HStack(alignment: .top){
            Text(characteristicName)
                .frame(width: 100, alignment: .leading)
                .foregroundColor(.gray)
            Text(characteristicValue)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, alignment: .leading)
            Spacer()
        }
        .font(Font.custom("Montserrat-Medium", size: 12))
    }
}

struct MovieCharacteristicView_Previews: PreviewProvider {
    static var previews: some View {
        VStack{
            MovieCharacteristicView(characteristicName: "name", characteristicValue: "value")
            MovieCharacteristicView(characteristicName: "name", characteristicValue: "reauly long valueeeee ohhhhhhhhhhh")
            MovieCharacteristicView(characteristicName: "and very long naaaaaaaa aaaaaaame", characteristicValue: "reauly long valueeeee ohhh hhh hhhhh")
        }
    }
}

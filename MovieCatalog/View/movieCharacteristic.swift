//
//  movieCharacteristic.swift
//  MovieCatalog
//
//  Created by  Aleksey Feofilov on 30.10.2022.
//

import SwiftUI

struct movieCharacteristic: View {
    var characteristicName: String
    var characteristicValue: String
    
    var body: some View {
        HStack{
            Text(characteristicName)
                .frame(width: 100, alignment: .leading)
                .foregroundColor(.gray)
            Text(characteristicValue)
                .foregroundColor(.black)
                .frame(maxWidth: .infinity, alignment: .leading)
            Spacer()
        }
        .padding(.horizontal)
    }
}

struct movieCharacteristic_Previews: PreviewProvider {
    static var previews: some View {
        movieCharacteristic(characteristicName: "name", characteristicValue: "value")
        movieCharacteristic(characteristicName: "name", characteristicValue: "reauly long valueeeee ohhhhhhhhhhh")
        movieCharacteristic(characteristicName: "and very long naaaaaaaa aaaaaaame", characteristicValue: "reauly long valueeeee ohhh hhh hhhhh")
    }
}

//
//  Ratting.swift
//  MovieCatalog
//
//  Created by  Aleksey Feofilov on 27.10.2022.
//

import SwiftUI

struct Ratting: View {
    var ratting: Float
    
    init(_ ratting: Float){
        self.ratting = ratting
    }
    
    var body: some View {
        Text(String(ratting))
            .frame(width: 56, height: 28)
            .foregroundColor(.white)
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color(hue: Double(120 * self.ratting) / 3600, saturation: 1, brightness: 1))
            )
    }
}

struct Ratting_Previews: PreviewProvider {
    static var previews: some View {
        Ratting(0)
    }
}

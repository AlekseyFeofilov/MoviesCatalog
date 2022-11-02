//
//  Title.swift
//  MovieCatalog
//
//  Created by  Aleksey Feofilov on 28.10.2022.
//

import SwiftUI

struct Title: View {
    var text: String
    
    init(_ text: String){
        self.text = text
    }
    
    var body: some View {
        HStack{
            Text(text)
                .foregroundColor(Color.accentColor)
                .font(Font.custom("IBMPlexSans-Regular", size: 24))
            Spacer()
        }
    }
}

struct Title_Previews: PreviewProvider {
    static var previews: some View {
        Title("Hello World")
    }
}

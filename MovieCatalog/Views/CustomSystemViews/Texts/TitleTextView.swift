//
//  Title.swift
//  MovieCatalog
//
//  Created by  Aleksey Feofilov on 28.10.2022.
//

import SwiftUI

struct TitleTextView: View {
    var text: String
    
    init(_ text: String){
        self.text = text
    }
    
    var body: some View {
        HStack{
            Text(text)
                .foregroundColor(Color.accentColor)
                .font(Font.custom(IBMPlexSansRegularName, size: mediumFontSize))
                .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

struct TitleTextView_Previews: PreviewProvider {
    static var previews: some View {
        TitleTextView("Hello World")
    }
}

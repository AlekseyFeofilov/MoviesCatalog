//
//  ReviewText.swift
//  MovieCatalog
//
//  Created by  Aleksey Feofilov on 11.11.2022.
//

import SwiftUI

struct ReviewTextView: View {
    @Binding var text: String
    
    init(text: Binding<String>) {
        self._text = text
        UITextView.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        ZStack(alignment: .top) {
            if text.isEmpty {
                HStack {
                    Text("Ваш комментарий...")
                        .foregroundColor(.gray)
                        .padding(.top, 12)
                        .padding(.leading, 12)
                    
                    Spacer()
                }
            }
            
            TextEditor(text: $text)
                .foregroundColor(.black)
                .background(.white)
                .opacity(text.isEmpty ? 0.5 : 1)
                .padding(.top, 4)
                .padding(.leading, 8)
        }
        .frame(maxWidth: .infinity, maxHeight: 120, alignment: .center)
        .background(
            RoundedRectangle(cornerRadius: 6)
                .fill(.white)
        )
    }
}

struct ReviewTextView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color(.gray).ignoresSafeArea()
            
            ReviewTextView(text: .constant(""))
        }
    }
}

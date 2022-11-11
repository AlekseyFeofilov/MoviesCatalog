//
//  ToolbarViewModel.swift
//  MovieCatalog
//
//  Created by  Aleksey Feofilov on 10.11.2022.
//

import Foundation
import SwiftUI

class ToolbarViewModel: ObservableObject{
//    var imageStringUrl: String
//    var startOffset: CGFloat
//    var title: String
    @Published var offset: CGFloat
    @Binding var currentMoveId: String?
    @Published var isFavorite: Bool = false
    @Binding var authorizationFlag: Bool
    
    init(offset: CGFloat, currentMoveId: Binding<String?>, authorizationFlag: Binding<Bool>){
        self.offset = offset
        self._currentMoveId = currentMoveId
        self._authorizationFlag = authorizationFlag
        
        if let data = UserDefaults.standard.data(forKey: "favoriteMovies"){
            
            if let decoded = String(data: data, encoding: .utf8){
                let strings = decoded.split(separator: ",")
                self.isFavorite = strings.contains(where: { it in it == currentMoveId.wrappedValue ?? ""})
            }
        }
    }
    
    func refavorite(){
        if isFavorite {
            deleteFavoriteMovie(movieId: currentMoveId!, authorizationFlag: $authorizationFlag)
            getFavoriteMovies(authorizationFlag: $authorizationFlag, resultHandle: {_ in })
        }
        else{
            addFavoriteMovie(movieId: currentMoveId!, authorizationFlag: $authorizationFlag)
            getFavoriteMovies(authorizationFlag: $authorizationFlag, resultHandle: {_ in })
        }
        
        isFavorite.toggle()
    }
}

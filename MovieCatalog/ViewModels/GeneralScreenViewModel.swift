//
//  MovieCatalogAppVIewModel.swift
//  MovieCatalog
//
//  Created by  Aleksey Feofilov on 08.11.2022.
//

import Foundation

class GeneralScreenViewModel: ObservableObject{
    @Published var isAuthorized = false
    
    init(){
        if let _ = getToken() {
            isAuthorized = true
        }
        else {
            isAuthorized = false
        }
    }
}

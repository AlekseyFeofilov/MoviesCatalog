//
//  NavigationViewModelView.swift
//  MovieCatalog
//
//  Created by  Aleksey Feofilov on 08.11.2022.
//

import Foundation
import SwiftUI

class NavigationViewModel: ObservableObject{
    @Published var currentScreen = 0
    @Binding var isAuthorized: Bool
    @Published var currentMoviewId: String? = nil
    
    init(isAuthorized: Binding<Bool>){
        self._isAuthorized = isAuthorized
    }
}

//
//  GeneralScreen.swift
//  MovieCatalog
//
//  Created by  Aleksey Feofilov on 07.11.2022.
//

import SwiftUI

struct GeneralScreen: View {
    @ObservedObject var viewModel = GeneralScreenViewModel()
    
    var body: some View {
        if viewModel.isAuthorized {
            NavView(viewModel: NavigationViewModel(isAuthorized: $viewModel.isAuthorized))
        }
        else {
            AuthorizationScreen(viewModel: AuthorizationScreenViewModel(isAthorized: $viewModel.isAuthorized))
        }
    }
}

struct GeneralScreen_Previews: PreviewProvider {
    static var previews: some View {
        GeneralScreen()
    }
}

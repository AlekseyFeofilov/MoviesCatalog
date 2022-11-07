//
//  GeneralScreen.swift
//  MovieCatalog
//
//  Created by  Aleksey Feofilov on 07.11.2022.
//

import SwiftUI

struct GeneralScreen<ViewModel>: View where ViewModel: GeneralScreenViewModel {
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        if viewModel.isAuthorized {
            NavigationView()
        }
        else {
            AuthorizationScreen(viewModel: viewModel as! AuthorizationScreenViewModel)
        }
    }
}

struct GeneralScreen_Previews: PreviewProvider {
    static var previews: some View {
        GeneralScreen(viewModel: AuthorizationScreenViewModel())
    }
}

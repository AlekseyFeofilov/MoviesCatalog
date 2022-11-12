//
//  General.swift
//  MovieCatalog
//
//  Created by  Aleksey Feofilov on 28.10.2022.
//

import SwiftUI

struct NavView: View {
    @ObservedObject var viewModel: NavigationViewModel
    
    init(viewModel: NavigationViewModel){
        self.viewModel = viewModel
        
        UITabBar.appearance().shadowImage = UIImage()
        UITabBar.appearance().backgroundImage = UIImage()
        UITabBar.appearance().isTranslucent = true
        UITabBar.appearance().backgroundColor = .black
    }
    
    var body: some View {
        if $viewModel.currentMoviewId.wrappedValue == nil {
            TabView (selection: $viewModel.currentScreen){
                
                MainScreen(viewModel: MainScreenViewModel(isAuthorized: viewModel.$isAuthorized, currentMovieId: $viewModel.currentMoviewId))
                    .tabItem {
                        Label(mainText, image: viewModel.currentScreen == 0 ? Assets.navigationActiveMainImage : Assets.navigationMainImage)
                    }
                    .tag(0)
                
                ProfileScreen(viewModel: ProfileScreenViewModel(isAuthorized: $viewModel.isAuthorized))
                    .tabItem {
                        Label(profileText, image: viewModel.currentScreen == 1 ? Assets.navigationActiveProfileImage : Assets.navigationProfileImage)
                    }
                    .tag(1)
            }
            .onAppear{
                let tabBarAppearance: UITabBarAppearance = UITabBarAppearance()
                tabBarAppearance.configureWithDefaultBackground()
                tabBarAppearance.backgroundColor = UIColor(Color(Assets.tabBarColor))
                UITabBar.appearance().standardAppearance = tabBarAppearance
                
                UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
            }
        }
        else{
            MovieScreen(viewModel: MovieScreenViewModel(currentMovieId: $viewModel.currentMoviewId, authorizationFlag: viewModel.$isAuthorized))
        }
    }
}

struct NavigationView_Previews: PreviewProvider {
    static var previews: some View {
        NavView(viewModel: NavigationViewModel(isAuthorized: .constant(false)))
    }
}

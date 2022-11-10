//
//  General.swift
//  MovieCatalog
//
//  Created by  Aleksey Feofilov on 28.10.2022.
//

import SwiftUI

struct NavigationView: View {
    @ObservedObject var viewModel: NavigationViewModelView
    
    init(viewModel: NavigationViewModelView){
        self.viewModel = viewModel
        
        UITabBar.appearance().shadowImage = UIImage()
        UITabBar.appearance().backgroundImage = UIImage()
        UITabBar.appearance().isTranslucent = true
        UITabBar.appearance().backgroundColor = .black
    }
    
    var body: some View {
        TabView (selection: $viewModel.currentScreen){
            
            MainScreen(viewModel: MainScreenViewModel(isAuthorized: viewModel.$isAuthorized))
                .tabItem {
                    Label(mainText, image: viewModel.currentScreen == 0 ? navActiveMainImageName : navMainImageName)
                }
                .tag(0)
            
            ProfileScreen(viewModel: ProfileScreenViewModel(isAuthorized: $viewModel.isAuthorized))
                .tabItem {
                    Label(profileText, image: viewModel.currentScreen == 1 ? navActiveProfileImageName : navProfileImageName)
                }
                .tag(1)
        }
        .onAppear{
            let tabBarAppearance: UITabBarAppearance = UITabBarAppearance()
            tabBarAppearance.configureWithDefaultBackground()
            tabBarAppearance.backgroundColor = UIColor(Color(tabBarColorName))
            UITabBar.appearance().standardAppearance = tabBarAppearance
            
            UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
            
        }
        
    }
}

struct NavigationView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView(viewModel: NavigationViewModelView(isAuthorized: .constant(false)))
    }
}

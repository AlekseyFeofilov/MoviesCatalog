//
//  MovieCatalogApp.swift
//  MovieCatalog
//
//  Created by  Aleksey Feofilov on 24.10.2022.
//
//

import SwiftUI

@main
struct MovieCatalogApp: App {
    init() {
        #if DEBUG
        var injectionBundlePath = "/Applications/InjectionIII.app/Contents/Resources"
        #if targetEnvironment(macCatalyst)
        injectionBundlePath = "\(injectionBundlePath)/macOSInjection.bundle"
        #elseif os(iOS)
        injectionBundlePath = "\(injectionBundlePath)/iOSInjection.bundle"
        #endif
        Bundle(path: injectionBundlePath)?.load()
        #endif
    }

    var body: some Scene {
        WindowGroup {
            GeneralScreen(viewModel: GeneralScreenViewModel())
        }
    }
}

//
//  TextFieldExtension.swift
//  MovieCatalog
//
//  Created by  Aleksey Feofilov on 21.10.2022.
//

import SwiftUI

extension TextField {
    func placeholder<Content: View>(
            when shouldShow: Bool,
            alignment: Alignment = .leading,
            @ViewBuilder placeholder: () -> Content) -> some View {

        ZStack(alignment: alignment) {
            placeholder().opacity(shouldShow ? 1 : 0)
            self
        }
    }
}

//
//  Gender.swift
//  MovieCatalog
//
//  Created by  Aleksey Feofilov on 06.11.2022.
//

import Foundation

enum Gender {
    case male
    case female
    
    var value: Int {
        switch self {
        case .male:
            return 0
        case .female:
            return 1
        }
    }
}

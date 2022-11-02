//
//  AnimationState.swift
//  MovieCatalog
//
//  Created by  Aleksey Feofilov on 30.10.2022.
//

import SwiftUI

func animationState(min: CGFloat, minValue: CGFloat, max: CGFloat, maxValue: CGFloat, current: CGFloat) -> CGFloat {
    let expression: (CGFloat) -> CGFloat = { value in
        (max - min) * (value - minValue) / (maxValue - minValue) + min
    }

    return current < minValue ? min : current > maxValue ? max : expression (current)
}

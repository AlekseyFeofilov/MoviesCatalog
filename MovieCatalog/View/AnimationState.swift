//
//  AnimationState.swift
//  MovieCatalog
//
//  Created by  Aleksey Feofilov on 30.10.2022.
//

import SwiftUI

func animtionState(whenVariable: CGFloat, lessThen: CGFloat, minState: CGFloat, moreThen:CGFloat, maxState: CGFloat, elseCalculateBy: CGFloat) -> CGFloat{
    return whenVariable < lessThen ? minState : whenVariable > moreThen ? maxState : elseCalculateBy
}

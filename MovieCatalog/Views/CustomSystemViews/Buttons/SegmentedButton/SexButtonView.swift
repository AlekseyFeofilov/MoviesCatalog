//
// Created by  Aleksey Feofilov on 25.10.2022.
//

import SwiftUI

struct SexButtonView: View {
    private var leftText: String = maleText
    private var rightText: String = femaleText
    
    @Binding var value: Gender?
    
    var isLeftSelected: Binding<Bool> { Binding(
        get: { value == .male },
        set: { _ in }
    )}
    
    var isRightSelected: Binding<Bool> { Binding(
        get: { value == .female },
        set: { _ in }
    )}

    init (_ gender: Binding<Gender?>){
        self._value = gender
    }
    
    var body: some View {
        HStack(spacing: 0){
            DividedButtonView (
                text: leftText,
                side: .left,
                action: {
                    value = value == .male ? nil : .male
                },
                activeFlag: isLeftSelected
            )
            
            DividedButtonView (
                text: rightText,
                side: .right,
                action: {
                    value = value == .female ? nil : .female
                },
                activeFlag: isRightSelected
            )
        }
        .frame(maxWidth: .infinity, maxHeight: fieldHeight)
    }
}

struct SegmentedButtonView_Previews: PreviewProvider {
    @State static var gender: Gender? = Gender.male
    
    static var previews: some View {
        SexButtonView($gender)
    }
}

//
// Created by  Aleksey Feofilov on 25.10.2022.
//

import SwiftUI

struct SexButtonView: View {
    private var leftText: String = maleText
    private var rightText: String = femaleText
    
    @State private var isLeftSelected: Bool = false
    @State private var isRightSelected: Bool = false
    @Binding var value: Gender?
    
    init (_ gender: Binding<Gender?>){
        self._value = gender
    }
    
    var body: some View {
        HStack(spacing: 0){
            DividedButtonView (
                text: leftText,
                side: .left,
                action: {
                    isLeftSelected.toggle()
                    isRightSelected = false
                    value = .male
                },
                activeFlag: $isLeftSelected
            )
            
            DividedButtonView (
                text: rightText,
                side: .right,
                action: {
                    isRightSelected.toggle()
                    isLeftSelected = false
                    value = .female
                },
                activeFlag: $isRightSelected
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

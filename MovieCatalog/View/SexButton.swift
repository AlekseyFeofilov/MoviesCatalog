//
// Created by  Aleksey Feofilov on 25.10.2022.
//

import SwiftUI

struct SexButton: View {
    private var leftText: String
    private var rightText: String

    private var leftValue: Any
    private var rightValue: Any
    
    @State private var isLeftSelected: Bool = false
    @State private var isRightSelected: Bool = false
    
    var selected: Any? {
        get {
            if (isLeftSelected) {
                return leftValue
            }
            else if (isRightSelected){
                return rightValue
            }
            else {
                return nil
            }
        }
    }
    
    init (_ leftText: String, leftValue: String, _ rightText: String, rightValue: String) {
        self.leftValue = leftValue
        self.rightValue = rightValue
        self.leftText = leftText
        self.rightText = rightText
    }
    
    var body: some View {
        HStack{
            DividedButton (
                text: leftText,
                side: .left,
                action: {
                    isLeftSelected.toggle()
                    isRightSelected = false
                },
                activeFlag: $isLeftSelected
            )
            
            DividedButton (
                text: rightText,
                side: .right,
                action: {
                    isRightSelected.toggle()
                    isLeftSelected = false
                },
                activeFlag: $isRightSelected
            )
        }
        .frame(maxWidth: .infinity, maxHeight: 44)
    }
}

class SexButton_Previews: PreviewProvider {
    static var previews: some View {
        SexButton("Left", leftValue: "M", "Right", rightValue: "F")
    }

    #if DEBUG
    @objc class func injected() {
        let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
        windowScene?.windows.first?.rootViewController =
                UIHostingController(rootView: ContentView())
    }
    #endif
}

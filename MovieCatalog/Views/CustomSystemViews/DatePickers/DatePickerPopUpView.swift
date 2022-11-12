//
//  DatePickerPopUp.swift
//  MovieCatalog
//
//  Created by  Aleksey Feofilov on 26.10.2022.
//

import SwiftUI

struct DatePickerPopUpView: View {
    @Binding var savedDate: Date?
    @State var selectedDate: Date = Date()
    
    var body: some View {
        DatePicker(Assets.datePickerTitle, selection: $selectedDate, displayedComponents: [.date])
            .accentColor(Color.accentColor)
            .datePickerStyle(GraphicalDatePickerStyle())
            .onChange(of: selectedDate, perform: { _ in
                savedDate = selectedDate
            })
            .padding()
            .background(
                Color(Assets.backgroundColor)
                    .cornerRadius(datePickerCornerRadius)
            )
    }
}


struct DatePickerPopUpView_Previews: PreviewProvider {
    @State static var savedDate: Date? = nil
    
    static var previews: some View {
        DatePickerPopUpView(savedDate: $savedDate)
    }
}

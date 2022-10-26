//
//  DatePickerPopUp.swift
//  MovieCatalog
//
//  Created by  Aleksey Feofilov on 26.10.2022.
//

import SwiftUI

struct DatePickerPopUp: View {
    @Binding var showDatePicker: Bool
    @Binding var savedDate: Date?
    @State var selectedDate: Date = Date()
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.3)
                .edgesIgnoringSafeArea(.all)
            
            DatePicker("Test", selection: $selectedDate, displayedComponents: [.date])
                .tint(Color.accentColor)
                .datePickerStyle(GraphicalDatePickerStyle())
                .onChange(of: selectedDate, perform: { _ in
                    savedDate = selectedDate
                    showDatePicker = false
                })
                .accentColor(Color.accentColor)
                .padding()
                .background(
                    Color.white
                        .cornerRadius(30)
                )
        }
    }
}


struct DatePickerPopUp_Previews: PreviewProvider {
    @State static var showDatePicker: Bool = true
    @State static var savedDate: Date? = nil

    static var previews: some View {
        DatePickerPopUp(showDatePicker: $showDatePicker, savedDate: $savedDate)
    }
}

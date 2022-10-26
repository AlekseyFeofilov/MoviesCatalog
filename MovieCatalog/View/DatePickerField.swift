//
//  DataPickerField.swift
//  MovieCatalog
//
//  Created by  Aleksey Feofilov on 25.10.2022.
//

import SwiftUI

struct DatePickerField: View {
    var placeholder: String = "Enter"
    @Binding var text: String

    @State var showDatePicker: Bool = false
    @State var savedDate: Date? = nil
    
    let formatter = DateFormatter()
    
    init(placeholder: String, text: Binding<String>){
        self.placeholder = placeholder
        self._text = text
        formatter.dateFormat = "dd.MM.YYYY"
    }
    
    private var formatedDate: Binding<String> { Binding (
        get: {
            if (self.savedDate == nil) {
                return ""
            }
            else {
                return formatter.string(from: self.savedDate!)
            }
        },
        set: {
            _ in
        })
    }
    
    var body: some View {
        ZStack {
            CustomTextField(placeholder: placeholder, text: formatedDate)
            HStack{
                Spacer()
                
                Button(action: {
                    showDatePicker.toggle()
                }, label: {
                    Image("CalendarIcon")
                        .padding(.trailing, 8)
                })
            }
            .frame(maxWidth: .infinity)
            
            if showDatePicker {
                DatePickerPopUp(showDatePicker: $showDatePicker, savedDate: $savedDate, selectedDate: savedDate ?? Date())
                    .transition(.opacity)
            }
        }
        .animation(.easeIn, value: showDatePicker)
    }
}

struct DataPickerField_Previews: PreviewProvider {
    @State static var date: Date = Date()
    @State static var text: String = ""
    
    static var previews: some View {
        DatePickerField(placeholder: "Enter", text: $text)
    }
}

//
//  DataPickerField.swift
//  MovieCatalog
//
//  Created by  Aleksey Feofilov on 25.10.2022.
//

import SwiftUI

struct DatePickerFieldView: View {
    var placeholder: String
    @Binding var text: String
    @Binding var savedDate: Date?
    
    @State var showDate = false
    
    init(placeholder: String = enterText, text: Binding<String>, savedDate: Binding<Date?>){
        self.placeholder = placeholder
        self._text = text
        self._savedDate = savedDate
        formatter.dateFormat = russianDateFormat
    }
    
    let formatter = DateFormatter()
    
    private var formattedDate: Binding<String> { Binding (
        get: {
            if (savedDate == nil) {
                return emptyString
            }
            else {
                return formatter.string(from: savedDate!)
            }
        },
        set: {
            _ in
        })
    }
    
    var body: some View {
        ZStack {
            CustomTextField(placeholder: placeholder, text: formattedDate)
                .disabled(true)
            
            ZStack(alignment: .trailing) {
                Text(fullStringText).foregroundColor(.black.opacity(0))
                Image(calendarIconName)
                    .padding(.trailing, smallPadding)
            }
            .frame(maxWidth: .infinity, alignment: .trailing)
        }
        .onTapGesture {
            showDate = true
        }
        .sheet(isPresented: $showDate) {
            DatePickerPopUpView(savedDate: $savedDate, selectedDate: savedDate ?? Date())
                .background(BackgroundClearView())
        }
        
    }
}

struct BackgroundClearView: UIViewRepresentable {
    func makeUIView(context: Context) -> UIView {
        let view = UIView()
        DispatchQueue.main.async {
            view.superview?.superview?.backgroundColor = .clear
        }
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {}
}

/*
 DatePickerPopUpView(showDatePicker: $showDatePicker, savedDate: $savedDate, selectedDate: savedDate ?? Date())
 .transition(.opacity)
 */

struct DatePickerFieldView_Previews: PreviewProvider {
    @State static var date: Date? = Date()
    @State static var text: String = ""
    
    static var previews: some View {
        ZStack {
            Color(backgroundColorName)
            DatePickerFieldView(text: $text, savedDate: $date)
        }
        .ignoresSafeArea()
    }
}

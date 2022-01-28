//
//  TextViewWithCountedWords.swift
//  JamalSale
//
//  Created by Hossam on 18/09/2021.
//

import SwiftUI
import Combine
struct TextViewWithPlaceholder: View {
    internal init( text : Binding<String> , title: String, placeHolder: String, height: CGFloat = 100) {
        self.title = title
        self.placeHolder = placeHolder
        self.height = height
        self._text = text
    }
    
    @Binding var text : String
    let title : String
    let placeHolder : String
    @State private var isEntering : Bool = false
     var height : CGFloat = 100
    
    
    var body: some View {
        UITextView.appearance().backgroundColor = UIColor.clear
        return VStack (alignment:.leading , spacing:8){
            Text(title)
                .titleCairoFont()
                .foregroundColor(.globalGreen)
            ZStack(alignment:.topLeading){
                    RoundedRectangle(cornerRadius: 16, style: .continuous)
                        .fill(Color.titledTextFieldBackground, strokeBorder: Color.titledTextFieldBorder, lineWidth: 1)

                TextEditor(text: (isEntering || !text.isFullyEmpty ) ? $text : .constant(placeHolder))
                        .titleCairoFont()
                        .foregroundColor((isEntering || !text.isFullyEmpty )  ? .black : Color.titledTextFieldPlaceHolder )
                        .onTapGesture {
                            isEntering = true
                        }
                }
            
            .frame(height : height)
           
            
        }
        

    }
    

    
}

struct TextViewWithCountedWords_Previews: PreviewProvider {
    static var previews: some View {
        TextViewWithPlaceholder(text: .constant("j44441lj"), title: "معلومات الأب", placeHolder: "ادخل الاب هنا")
            .environment(\.layoutDirection, .rightToLeft)
    }
}

extension String {
    var isFullyEmpty : Bool {
        self.isEmpty || self == "" || self == " " || self == "  "
    }
}



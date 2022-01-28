//
//  TitledTextField.swift
//  JamalSale
//
//  Created by Hossam on 04/09/2021.
//

import SwiftUI

struct TitledTextField: View {
    @Binding var text : String
    let placeHolder : String
    var title : String?
    var iconImage : Image?
    @Binding var isErrorPresented : Bool
    var errorMessageText : String?
    var body: some View {
        
        
            
        VStack(alignment:.leading , spacing: 4){
                if let title = title {
                    Text(title)
                        .titleCairoFont()
                        .foregroundColor(.globalGreen)
                }
                ZStack{
                    RoundedRectangle( cornerRadius: 10, style: .continuous)
                        
                        .fill(Color.titledTextFieldBackground, strokeBorder: Color.titledTextFieldBorder, lineWidth: 1)
                        
                        .frame( height: 45)
                        
                    TextField(placeHolder, text: $text)
                        .padding(.horizontal)
                }
            }
            
        
        
        .font(cairoFont: CairoFontSemiBold(size: 17))    }
}

struct TitledTextField_Previews: PreviewProvider {
    static var previews: some View {
        TitledTextField(text: .constant(""), placeHolder: "البريد الإلكتروني", title: "البريد الالكتروني", isErrorPresented: .constant(false))
            .environment(\.layoutDirection, .rightToLeft)
    }
}

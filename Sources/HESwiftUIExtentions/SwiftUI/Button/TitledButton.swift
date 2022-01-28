//
//  TitleButtons.swift
//  JamalSale
//
//  Created by Hossam on 10/09/2021.
//

import SwiftUI

struct TitledButton: View {
    
    let title : String?
    let placeholder : String
    var choosedValue : String? = nil
    var action : ()->Void = {}
    @State private var isPressed : Bool = false
    
    var body: some View {
        VStack (alignment: .leading , spacing : 5){
            
            if let title = title {
                Text(title)
                    .foregroundColor(.globalGreen)
                    .font(cairoFont: CairoFontSemiBold(size: 17))
            }
            RoundedRectangle(cornerRadius: 11, style: .continuous)
                .fill(Color.titledTextFieldBackground, strokeBorder: Color.titledTextFieldBorder, lineWidth: 1)
                .frame( height: 45)
                .overlay(
                    HStack {
                        Text(choosedValue != nil ? choosedValue! : placeholder )
                            .font(cairoFont: CairoFontSemiBold(size: 17))
                            .foregroundColor(choosedValue != nil ? .black : .titledTextFieldPlaceHolder )
                        Spacer()
                        
                        Image(systemName: "arrowtriangle.down.fill")
                            .foregroundColor(Color(#colorLiteral(red: 0.6823529412, green: 0.7294117647, blue: 0.7725490196, alpha: 1)))
                        
                    }
                    .padding(.horizontal)
                )
        }
        .onTapGesture(perform: {
            action()
        })
        .pressAndReleaseEffect(scaleEffect: 0.99, duration: 0.1)
        
    }
}

struct TitleButtons_Previews: PreviewProvider {
    static var previews: some View {
        TitledButton(title: "الاب", placeholder: "اختار الاب", choosedValue: nil, action: {})
            .environment(\.layoutDirection, .rightToLeft)
            
    }
}

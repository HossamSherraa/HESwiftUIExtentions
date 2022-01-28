//
//  ColoredLabel.swift
//  JamalSale
//
//  Created by Hossam on 06/09/2021.
//

import SwiftUI

struct ColoredLabel<Content : View> : View , Identifiable {
    var id: UUID = UUID()
    
    let forgroundColor : Color
    @ViewBuilder var content : Content
    var label : AnyView?
    
    init( @ViewBuilder content : ()->Content  , forgroundColor : Color  , label : (()->AnyView?)? = nil) {
        self.content = content()
        self.forgroundColor = forgroundColor
        if let label = label {
            self.label = label()
        }
    }
    var body: some View {
     
           
        HStack{
            content
                
                .font(cairoFont: CairoFontSemiBold(size: 13.4))
                .foregroundColor(forgroundColor)
                .padding(.horizontal, 10)
                .background( RoundedRectangle(cornerRadius: 10)
                                .fill(forgroundColor)
                                .brightness(0.40)
                                .opacity(0.35)
                )
            label
        }
        
        
               
                
        
    }
}

struct ColoredLabel_Previews: PreviewProvider {
    static var previews: some View {
        ColoredLabel(content: {
            Text("الاب : ابو الجمال الرئاسة")
                .eraseToAnyView()
        }, forgroundColor: .globalGreen)
    }
}

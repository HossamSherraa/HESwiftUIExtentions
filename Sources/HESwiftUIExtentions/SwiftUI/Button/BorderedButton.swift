//
//  BorderedButton.swift
//  JamalSale
//
//  Created by Hossam on 04/09/2021.
//

import SwiftUI

//Used IN Landing Signup 
public struct RoundedBorderedButtonStyle: ButtonStyle {
    public init(backgroundColor: Color, fontColor: Color, borderedColor: Color) {
        self.backgroundColor = backgroundColor
        self.fontColor = fontColor
        self.borderedColor = borderedColor
    }
    
    let backgroundColor : Color
    let fontColor : Color
    let borderedColor : Color
    
    public func makeBody(configuration: Configuration) -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20 , style: .continuous)
                .fill(backgroundColor, strokeBorder: borderedColor, lineWidth: 1)
                .frame(height: 60)
            configuration.label
                .font(cairoFont: CairoFontBold(size: 19))
                .foregroundColor(fontColor)
        }
        .buttonPressEffect(isPressed: configuration.isPressed)
    }
}


struct RoundedBorderedButtonStyle_Preview : PreviewProvider {
    static var previews: some View {
        Button("Title", action: {})
            .buttonStyle(RoundedBorderedButtonStyle(backgroundColor: .titledTextFieldBackground, fontColor: .globalGreen, borderedColor: .titledTextFieldBorder))
        
    }
}

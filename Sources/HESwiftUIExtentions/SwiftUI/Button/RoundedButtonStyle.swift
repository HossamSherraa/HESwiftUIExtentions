//
//  RoundedButtonStyle.swift
//  JamalSale
//
//  Created by Hossam on 10/09/2021.
//

import SwiftUI
struct RoundedButtonStyle : ButtonStyle {
    let forgroundColor : Color
    var isFullColor = false
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(forgroundColor)
            .padding(.horizontal )
            .padding(.vertical , 4)
            .background(
            RoundedRectangle(cornerRadius: 4000, style: .continuous)
                .fill(isFullColor ? forgroundColor : forgroundColor.opacity(0.1) )
            )
            .buttonPressEffect( scaleEffect : 0.9 , isPressed: configuration.isPressed)
            .animation(.spring())
            
    }
    
    
}

struct RoundedButtonStyle_Preview : PreviewProvider {
    static var previews: some View {
         Button("مؤسسة الزمول", action: {})
            .buttonStyle(RoundedButtonStyle(forgroundColor: .blue))
        
    }
}

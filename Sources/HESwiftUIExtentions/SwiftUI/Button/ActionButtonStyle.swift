//
//  ActionButton.swift
//  JamalSale
//
//  Created by Hossam on 04/09/2021.
//

import SwiftUI

struct ActionButtonStyle: ButtonStyle {
    let backgroundColor : Color
    let fontColor : Color
    @Binding var isLoading : Bool
    
    func makeBody(configuration: Configuration) -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20 , style: .continuous)
                .fill(backgroundColor)
                .frame(height: 60)
            HStack {
                configuration.label
                    .font(cairoFont: CairoFontBold(size: 19))
                    .foregroundColor(fontColor)
                if isLoading {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: .white))
                        .animation(.easeIn)
                      
                }
            }
        }
        .buttonPressEffect(isPressed: configuration.isPressed)
       
    }
    
   
}

extension View {
    
    func buttonPressEffect( scaleEffect : CGFloat = 0.99 , opacity : Double = 0.94 ,isPressed : Bool )-> some View  {
        if isPressed {
           return self.scaleEffect(scaleEffect)
            .opacity(opacity)
            
        }else {
           return
            self.scaleEffect(1)
            .opacity(1)
        }
    }
}


struct ActionButton_Preview : PreviewProvider {
    static var previews: some View {
        Button("Signin", action: {})
            .buttonStyle(ActionButtonStyle(backgroundColor: .globalGreen, fontColor: .white, isLoading: .constant(false)))
    }
}



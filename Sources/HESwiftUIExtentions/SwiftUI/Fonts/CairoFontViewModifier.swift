//
//  CairoFontViewModifier.swift
//  JamalSale
//
//  Created by Hossam on 04/09/2021.
//

import SwiftUI

/*
 View
 .font( tinySize : 1111 ,cairoFont : CairoFont(normalSize))
 */
struct CairoFontModifier : ViewModifier {
    let cairoFont : CairoFont
    func body(content: Content) -> some View {
        content
            .font(.custom(cairoFont.fontNameInBundel , size: cairoFont.size ))
    }
}

extension View {
   public  func font(cairoFont : CairoFont)->some View {
         modifier(CairoFontModifier(cairoFont: cairoFont))
    }
}


struct CairoFontModifierTiny : ViewModifier {
    @EnvironmentObject var sizeMode : SizeModeWrapper
    let tinySize : Double
    let cairoFont : CairoFont
    func body(content: Content) -> some View {
        
    }
}

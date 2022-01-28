//
//  CairoFont.swift
//  JamalSale
//
//  Created by Hossam on 04/09/2021.
//

import SwiftUI

//TheGoal
//.cairoFont(CairoBlack(16))

//Steps
//protocol called CairoFont
// concrete will provide size
//HowO/C Princile . when adding new weight I will create new One , instead of change the concrete

protocol CairoFont {
    var size : CGFloat {get}
    var fontNameInBundel : String {get}
}

struct CairoFontBlack : CairoFont {
    var size: CGFloat
    
    var fontNameInBundel: String {
        "Cairo-Black"
    }
}


struct CairoFontBold : CairoFont {
    var size: CGFloat

    var fontNameInBundel: String {
        "Cairo-Bold"
    }
    
    
}


struct CairoFontExtraLight : CairoFont {
    var size: CGFloat
    
    var fontNameInBundel: String {
        "Cairo-ExtraLight"
    }
    
    
}


struct CairoFontLight : CairoFont {
    var size: CGFloat
    
    var fontNameInBundel: String {
        "Cairo-Light"
    }
    
    
}


struct CairoFontRegular : CairoFont {
    var size: CGFloat
    
    var fontNameInBundel: String {
        "Cairo-Regular"
    }
    
    
}


struct CairoFontSemiBold : CairoFont {
    var size: CGFloat
    
    var fontNameInBundel: String {
        "Cairo-SemiBold"
    }
    
}


extension View {
    func titleCairoFont()-> some View{
        self.font(cairoFont: CairoFontSemiBold(size: 17))
    }
}

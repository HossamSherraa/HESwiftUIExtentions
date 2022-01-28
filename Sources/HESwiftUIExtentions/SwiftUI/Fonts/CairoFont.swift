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

public protocol CairoFont {
    var size : CGFloat {get}
    var fontNameInBundel : String {get}
}

public struct CairoFontBlack : CairoFont {
    public init(size: CGFloat) {
        self.size = size
    }
    
    
  public  var size: CGFloat
    
    public var fontNameInBundel: String {
        "Cairo-Black"
    }
}


public struct CairoFontBold : CairoFont {
    public init(size: CGFloat) {
        self.size = size
    }
    
    public var size: CGFloat

    public var fontNameInBundel: String {
        "Cairo-Bold"
    }
    
    
}


public struct CairoFontExtraLight : CairoFont {
    public init(size: CGFloat) {
        self.size = size
    }
    
    public  var size: CGFloat
    
    public var fontNameInBundel: String {
        "Cairo-ExtraLight"
    }
    
    
}


public struct CairoFontLight : CairoFont {
    public init(size: CGFloat) {
        self.size = size
    }
    
    public var size: CGFloat
    
    public var fontNameInBundel: String {
        "Cairo-Light"
    }
    
    
}


public struct CairoFontRegular : CairoFont {
    public init(size: CGFloat) {
        self.size = size
    }
    
    public  var size: CGFloat
    
    public var fontNameInBundel: String {
        "Cairo-Regular"
    }
    
    
}


public struct CairoFontSemiBold : CairoFont {
    public init(size: CGFloat) {
        self.size = size
    }
    
    public var size: CGFloat
    
    public var fontNameInBundel: String {
        "Cairo-SemiBold"
    }
    
}


extension View {
    public func titleCairoFont()-> some View{
        self.font(cairoFont: CairoFontSemiBold(size: 17))
    }
}

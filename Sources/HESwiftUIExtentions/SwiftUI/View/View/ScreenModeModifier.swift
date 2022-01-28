//
//  ScreenModeModifier.swift
//  JamalSale
//
//  Created by Hossam on 10/09/2021.
//

import SwiftUI
import Combine
//I need a global Value for Screen Size Mode that will be avaible as EnviromentObject Value , got from ReadSize On The Main APp
class SizeModeWrapper : ObservableObject {
    @Published var sizeMode : SizeMode = .tiny
    
    func getValueForSizeMode<T>(tiny : T , normal : T)->T{
        switch sizeMode {
        case .tiny:
            return tiny
        case .normal:
            return normal
        }
    }
    
    
}


struct ScreenSizeModeReaderModifier : ViewModifier {
    @Binding var sizeModeWrapper : SizeModeWrapper
    func body(content: Content) -> some View {
        content
            .readSize { size in
                sizeModeWrapper.sizeMode =  getSizeMode(from:size)
            }
    }
    
    func getSizeMode(from size : CGSize)->SizeMode {
        print(size)
        if size.width > IPHONE_SE_1ST_Width {
            return .normal
        }else {
            return .tiny
        }
    }
    
    
}

extension View {
    func readScreenSizeMode(sizeMode : Binding<SizeModeWrapper>) -> some View {
        self.modifier(ScreenSizeModeReaderModifier(sizeModeWrapper: sizeMode))
    }
}

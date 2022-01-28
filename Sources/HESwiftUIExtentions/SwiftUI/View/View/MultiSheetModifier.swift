//
//  MultiSheetModifier.swift
//  JamalSale
//
//  Created by Hossam on 10/10/2021.
//

import Foundation
import SwiftUI
struct MultiSheetModifier<T:View> : ViewModifier {
    @Binding var isPreseted : Bool
    var content : T
    init(isPresented : Binding<Bool> , @ViewBuilder content : ()->T){
        self._isPreseted = isPresented
        self.content = content()
    }
    func body(content: Content) -> some View {
        content
            .background(
            Color.clear
                
                .fullScreenCover(isPresented: $isPreseted, onDismiss: nil, content: {self.content})
        )
    }
}

extension View {
    func multiSheet<T:View>(isPresented : Binding<Bool> , @ViewBuilder content : ()->T)-> some View{
        return self.modifier(MultiSheetModifier(isPresented: isPresented, content: content))
    }
}

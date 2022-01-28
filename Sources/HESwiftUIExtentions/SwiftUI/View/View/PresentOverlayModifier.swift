//
//  PresentOverlayModifier.swift
//  JamalSale
//
//  Created by Hossam on 22/11/2021.
//

import SwiftUI
struct PresentOverlayModifier<V:View> : ViewModifier {
    @Binding var isPresented : Bool
    @ViewBuilder var contentV : V
    func body(content: Content) -> some View {
        ZStack {
            content
            if isPresented {
                self.contentV
                    .zIndex(1000000)
                    
            }
        }
    }
}

extension View {
    func presentOverlay<V:View>(isPresented : Binding<Bool> , content : ()->V )-> some View {
        self.modifier(PresentOverlayModifier<V>(isPresented: isPresented, contentV: content))
    }
}

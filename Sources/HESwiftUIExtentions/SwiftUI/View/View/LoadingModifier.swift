//
//  LoadingModifier.swift
//  JamalSale
//
//  Created by Hossam on 12/11/2021.
//

import SwiftUI

struct LoadingViewModifier : ViewModifier{
    @Binding var isLoading : Bool
    func body(content: Content) -> some View {
        content.overlay(
        
        ConditionalView(condition: isLoading, content: {
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle(tint: .gray))
        })
        )
    }
}

extension View {
    func loading(_ isLoading : Binding<Bool>)->some View {
        self.modifier(LoadingViewModifier(isLoading: isLoading))
    }
    
    func loadingBig(_ isLoading : Binding<Bool>)-> some View {
        self.modifier(BigLoadingViewModifier(isLoading: isLoading))
    }
}


struct BigLoadingViewModifier : ViewModifier {
    @Binding var isLoading : Bool
    func body(content: Content) -> some View {
        content.overlay(
            ConditionalView(condition: isLoading, content: {
                BigLoadingView()
            })
        )
    }
}

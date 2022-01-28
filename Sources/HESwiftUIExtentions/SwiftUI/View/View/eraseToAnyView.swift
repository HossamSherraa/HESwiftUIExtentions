//
//  eraseToAnyView.swift
//  JamalSale
//
//  Created by Hossam on 06/09/2021.
//


import  SwiftUI
extension View {
    func eraseToAnyView() -> AnyView{
        return AnyView(self)
    }
}

extension View {
   
    func eraseToColoredLabel()-> some View {
        ColoredLabel(content: {
            self
        }, forgroundColor: .clear)
    }
}

//
//  OnPressAndRelease.swift
//  JamalSale
//
//  Created by Hossam on 11/09/2021.
//

import SwiftUI

extension View {
    func pressAndReleaseEffect(scaleEffect : CGFloat = 0.97 , opacityEffect : Double = 0.90 , duration : Double = 0.1)->some View {
        
        Button(action: {}, label: {
            self
        })
        .buttonStyle(PressAndReleaseFakeButtonStyle(scaleEffect: scaleEffect, opacityEffect: opacityEffect , duration : duration ))
        
    }
}


struct PressAndReleaseFakeButtonStyle : ButtonStyle {
    let scaleEffect : CGFloat
    let opacityEffect : Double
    let duration : Double
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .buttonPressEffect(scaleEffect: scaleEffect, opacity: opacityEffect, isPressed: configuration.isPressed)
            .animation(.easeIn(duration: duration))
    }
}

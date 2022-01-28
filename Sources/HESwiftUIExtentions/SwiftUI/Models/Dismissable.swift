//
//  Dismissable.swift
//  JamalSale
//
//  Created by Hossam on 23/10/2021.
//

import Foundation
import SwiftUI
protocol Dismissable {
     var presentationMode: Binding<PresentationMode> {get}
}
extension View where Self : Dismissable {
    
    func dismiss(){
        self.presentationMode.wrappedValue.dismiss()
    }
}

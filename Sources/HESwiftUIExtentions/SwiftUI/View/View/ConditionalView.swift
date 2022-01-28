//
//  ConditionalView.swift
//  JamalSale
//
//  Created by Hossam on 10/09/2021.
//

import SwiftUI

struct ConditionalView<Content : View> : View {
    let condition : Bool
    @ViewBuilder var content : Content
    
    var body: some View {
        Group{
            if condition {
                content
            }
        }
    }
    
}

//
//  LoadingView.swift
//  JamalSale
//
//  Created by Hossam on 06/10/2021.
//

import SwiftUI

struct LoadingView: View {
    @Binding var isVisible : Bool
    var body: some View {
        ZStack{
            Color.black
                .opacity(0.3)
                .ignoresSafeArea()
            RoundedRectangle(cornerRadius: 16, style: .continuous)
                .fill(Color.white)
                .frame(width: 70, height: 70, alignment: .center)
            ProgressView()
                .scaleEffect(1.3)
                .progressViewStyle(CircularProgressViewStyle(tint: .globalGreen))
            
        }
        .opacity(isVisible ? 1 :0)
        .animation(.easeInOut)
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView(isVisible: .constant(true))
    }
}

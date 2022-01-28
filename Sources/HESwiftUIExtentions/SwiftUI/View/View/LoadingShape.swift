//
//  LoadingShape.swift
//  JamalSale
//
//  Created by Hossam on 14/11/2021.
//

import SwiftUI

struct LoadingShape: View {
    @State var isAnimated : Bool = false
    @State var sTrime : Bool = false
   
    var body: some View {
        ZStack{
        Circle()
            .stroke(lineWidth: 10)
            .frame(width: 30, height: 30)
            .foregroundColor(Color.titledTextFieldBorder)
            
            Circle()
                .trim(from: 0.2, to: sTrime ? 1 : 1 )
                .stroke(lineWidth: 8)
                .frame(width: 30, height: 30)
                .foregroundColor(Color.globalGreen)
                .rotationEffect(isAnimated ? .degrees(-360): .degrees(0) )
                
            
        }
        .onAppear {
            withAnimation(.linear(duration: 0.3).repeatForever(autoreverses: false)) {
                isAnimated = true
            }
            
            
        }
        
    }
}

struct LoadingShape_Previews: PreviewProvider {
    static var previews: some View {
        LoadingShape()
    }
}

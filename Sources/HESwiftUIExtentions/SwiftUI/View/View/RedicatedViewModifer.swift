//
//  RedicatedViewModifer.swift
//  JamalSale
//
//  Created by Hossam on 13/11/2021.
//

import SwiftUI



struct RedecatedViewModifier : ViewModifier {
    @Binding var condition : Bool
    @State var startAnimate : Bool = false
    @State var size : CGSize = .zero
    func body(content: Content) -> some View {
        if condition {
                content
                .readSize { size in
                    self.size = size
                }
                .overlay(
                    Rectangle()
                        .foregroundColor(.titledTextFieldBorder)
                        .overlay(
                            
                            Rectangle()
                                .fill(Color.titledTextFieldPlaceHolder)
                                .frame(width: 20 ,height: 400)
                                .rotationEffect(.degrees(45))
                                .position(x: startAnimate ? -100 : size.width + 100)
                                .blur(radius:35)
                            , alignment: .center)
                        .clipped()
                          , alignment: .center)
                .clipShape(RoundedRectangle(cornerRadius: 10 , style: .continuous))
                .padding(.horizontal)
                .onAppear {
                    withAnimation(.linear(duration: 0.8).repeatForever(autoreverses: false)) {
                        startAnimate.toggle()
                    }
                }
        }else {
            content
        }
    }
}

extension View {
    func redecated(condition : Binding<Bool>)-> some View {
        modifier(RedecatedViewModifier(condition: condition))
    }
}




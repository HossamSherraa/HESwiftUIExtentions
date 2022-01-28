//
//  SuccessViewModifier.swift
//  JamalSale
//
//  Created by Hossam on 28/12/2021.
//

import SwiftUI
struct SuccessViewModifier : ViewModifier {
    @Binding var successMessage : String?
    func body(content: Content) -> some View {
        ZStack(alignment:.top){
            Color.black
                .opacity(0.2)
                .ignoresSafeArea()
            RoundedRectangle(cornerRadius: 16, style: .circular)
                .fill(Color.globalGreen, strokeBorder: Color.globalGreen, lineWidth: 1)
                .frame(width: nil, height: 80, alignment: .center)
                .offset( y: successMessage != nil ? 0 : -120 )
                .opacity(successMessage != nil ? 1 : 0 )
                .padding()
                .overlay(
                    VStack{
                        Image(systemName: "hand.thumbsup.fill")
                            .foregroundColor(.white)
                        Text("successMessage")
                            .titleCairoFont()
                            .foregroundColor(.white)
                            .foregroundColor(.red)
                    }
                )
            
        }
        .opacity(successMessage == nil ? 0 : 1  )
        .animation(.easeInOut)
    }
}


struct SuccessViewModifier_Preview : PreviewProvider {
    static var previews: some View {
        ZStack{
            Color.red
        }
        .modifier(SuccessViewModifier(successMessage: .constant("تم تعديل الإعلان")))
    }
}

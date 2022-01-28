//
//  ErrorViewModifier.swift
//  JamalSale
//
//  Created by Hossam on 07/10/2021.
//

//import SwiftUI
//
//struct MessageView: View {
//    @Binding var message : PresentableMessage?
//    var body: some View {
//        
//        ZStack(alignment: .top){
//            Color.white.opacity(0.8)
//                .ignoresSafeArea()
//            RoundedRectangle(cornerRadius: 16, style: .continuous)
//                .fill(message?.color ?? .globalGreen)
//                .frame( height: 80)
//                .padding()
//                .offset( y: message != nil ? 0 : -120 )
//                .opacity(message != nil ? 1 : 0 )
//                .overlay(
//                    VStack(spacing:0){
//                        Text(message?.title ?? "")
//                            .padding(.horizontal)
//                            .foregroundColor(.white)
//                            .font(cairoFont: CairoFontSemiBold(size: 16))
//                        
//                        Text(message?.subTitle ?? "")
//                            .padding(.horizontal)
//                            .foregroundColor(.white)
//                            .font(cairoFont: CairoFontRegular(size: 15))
//                    }
//                )
//        }
//        .opacity(message == nil ? 0 : 1  )
//        .animation(.easeInOut , value: message != nil)
//            
//        
//        
//    }
//}
//
////struct ErrorView_Previews: PreviewProvider {
////    static var previews: some View {
////        ErrorView(errorMessage: .constant("يوجد خطأ يا معلم "))
////    }
////}
//
//struct MessageModifier : ViewModifier {
//    @Binding var message : PresentableMessage?
//    func body(content: Content) -> some View {
//        content
//            .overlay(
//                MessageView(message: _message)
//            )
//            
//        
//    }
//}
//
//extension View {
//    func errorMessage(_ message : Binding<PresentableMessage?> )-> some View {
//        self.modifier(MessageModifier(message: message))
//    }
//}

//
//  CheckBox.swift
//  JamalSale
//
//  Created by Hossam on 11/09/2021.
//

import SwiftUI

//CheckBox
struct CheckBox <T:SelectableItem>: View , Identifiable {
    var id = UUID()
    let item : T
    @Binding var selectedItem : T?
    
    @State private var pressed : Bool = false
    
    
    var body: some View {
        HStack(spacing:15){
            Text(item.text)
                .font(cairoFont: CairoFontSemiBold(size: 18))
            RoundedRectangle(cornerRadius: 10 , style: .continuous)
                .fill(Color.titledTextFieldBackground, strokeBorder: Color(#colorLiteral(red: 0.6558918357, green: 0.7264099121, blue: 0.7713714838, alpha: 1)), lineWidth: 1)
                .frame(width: 26, height: 26)
                .overlay(
                    ConditionalView(condition: selectedItem == item, content: {
                        Image(systemName: "checkmark")
                            .font(.system(size: 16 , weight: .black))
                            .foregroundColor(.globalGreen)
                    })
                )
        }
        .onTapGesture {
            withAnimation {
                if selectedItem == item {
                    selectedItem = nil
                }else {
                    self.selectedItem = item
                }
              
            }
        }
        .pressAndReleaseEffect(scaleEffect: 0.96, duration: 0.1)
       
        
    }
    
    
}

struct CheckBox_Preview : PreviewProvider {
    static var previews: some View {
        CheckBox(item: 1, selectedItem: .constant(1))
            .environment(\.layoutDirection, .rightToLeft)
    }
    
}

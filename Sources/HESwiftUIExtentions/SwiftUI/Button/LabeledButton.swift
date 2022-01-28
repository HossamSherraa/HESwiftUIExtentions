//
//  LabeledButtons.swift
//  JamalSale
//
//  Created by Hossam on 09/09/2021.
//

import SwiftUI
//Used In Home Top Buttons
struct LabeledButton: View {
    let systemImageName : String
    let title : String
    var enableFullSpace : Bool = false
    var body: some View {
        HStack{
            Image(systemName: systemImageName)
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(.globalGreen)
            Text(title)
                .font(cairoFont: CairoFontSemiBold(size: 16))
                .foregroundColor(Color(#colorLiteral(red: 0.6598207951, green: 0.7303324342, blue: 0.7752934098, alpha: 1)))
            if enableFullSpace {
                Spacer()
            }
        }
        .padding(.vertical , 6)
        .padding(.horizontal , 8)
        .background(
        RoundedRectangle(cornerRadius: 12, style: .continuous)
            .fill(Color(#colorLiteral(red: 0.9472720027, green: 0.9528134465, blue: 0.9652908444, alpha: 1)))
        )
    }
}

struct LabeledButton_Previews: PreviewProvider {
    static var previews: some View {
        LabeledButton(systemImageName: "applelogo", title: "Apple")
            .environment(\.layoutDirection, .rightToLeft)
            
           
    }
}

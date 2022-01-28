//
//  BackButton.swift
//  JamalSale
//
//  Created by Hossam on 22/09/2021.
//

import SwiftUI

struct BackButton: View {
    let title : String
    let action : ()->Void
    var body: some View {
        Button {
            action()
        } label: {
            HStack{
                Image(systemName: "chevron.right")
                Text(title)
            }
            .foregroundColor(.globalGreen)
            .font(cairoFont: CairoFontBold(size: 20))
        }
    }
}

struct BackButton_Previews: PreviewProvider {
    static var previews: some View {
        BackButton(title : "الإعلانات" , action: {})
    }
}

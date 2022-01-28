//
//  BackButton.swift
//  JamalSale
//
//  Created by Hossam on 22/09/2021.
//

import SwiftUI

public struct BackButton: View {
    public init(title: String, action: @escaping () -> Void) {
        self.title = title
        self.action = action
    }
    
    let title : String
    let action : ()->Void
    public var body: some View {
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

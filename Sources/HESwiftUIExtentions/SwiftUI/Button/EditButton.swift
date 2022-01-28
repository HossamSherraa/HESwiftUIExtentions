//
//  EditButton.swift
//  JamalSale
//
//  Created by Hossam on 02/01/2022.
//

import SwiftUI
struct FilledButtonStyle : ViewModifier {
    let color : Color
    
    
    
    func body(content: Content) -> some View {
        content
            .foregroundColor(color)
            .padding(.horizontal)
            .padding(.vertical , 3)
            .background(
                RoundedRectangle(cornerRadius: 10, style: .continuous)
                    .foregroundColor(color.opacity(0.15))
                
            )
            
    }
}

struct EditButtonStyle_Preview : PreviewProvider{
    static var previews: some View {
        Button {
            
        } label: {
            Text("Edit")
                .filledStyle(with: .red)
        }

    }
}


extension Text {
    func filledStyle(with color : Color )->some View {
        modifier(FilledButtonStyle(color: color))
    }
}

//
//  ReadOnlyTextView.swift
//  JamalSale
//
//  Created by Hossam on 17/11/2021.
//

import SwiftUI

struct ReadOnlyTextView: View {
    let title : String
    let text : String
    let height :  CGFloat = 100
    var body: some View {
        return VStack (alignment:.leading , spacing:8){
            Text(title)
                .titleCairoFont()
                .foregroundColor(.globalGreen)
            ZStack(alignment:.topLeading){
                    RoundedRectangle(cornerRadius: 16, style: .continuous)
                        .fill(Color.titledTextFieldBackground, strokeBorder: Color.titledTextFieldBorder, lineWidth: 1)

                
                ScrollView {
                    Text(text)
                        .fixedSize(horizontal: false, vertical: true)
                        
                            .titleCairoFont()
                            .foregroundColor( .black )
                        .padding()
                }
                        
                
                        
                }
            .frame(height : height)
           
            
        }

    }
}

struct ReadOnlyTextView_Previews: PreviewProvider {
    static var previews: some View {
        ReadOnlyTextView(title: "هذا عنوان", text: "سشينب سلمس يبمبيلمبسيمل مسيلبمل ميسبلميبسمل يسملميبسلميس لميبسمليبمل مسيبلميل ميبمليسمل ميسلمبيمل سملبمسيبلم سيمبليمبلمس ليمسبلميبسل ميسبملس يملميبس ميسبل ")
            .environment(\.layoutDirection, .rightToLeft)
    }
}

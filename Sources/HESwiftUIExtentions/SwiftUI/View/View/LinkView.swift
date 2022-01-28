//
//  LinkView.swift
//  JamalSale
//
//  Created by Hossam on 20/09/2021.
//

import SwiftUI

struct LinkContent : Identifiable , Codable , Equatable {
    var id = UUID()
    let url : String
    let title : String
    
    var urlDestination : URL {
        URL(string: url) ?? URL(fileURLWithPath: "")
    }
    static func == (lhs: LinkContent, rhs: LinkContent) -> Bool {
        lhs.url == rhs.url &&
        lhs.title == rhs.title
    }
}


struct LinkView: View {
    let linkContent : LinkContent
    let onPressRemove : ()->Void
    var body: some View {
        HStack{
            Group {
                Image(systemName:"link")
                Link(linkContent.title, destination: linkContent.urlDestination)
                    .font(cairoFont: CairoFontSemiBold(size: 16))
                    
            }
            .foregroundColor(.blue)
            Spacer()
            Button(action: onPressRemove, label: {
                Image(systemName: "trash.fill")
            })
            .foregroundColor(.red)
        }
        .padding(.horizontal)
        .transition(.slide.animation(.easeInOut))
        .animation(.easeInOut)
    }
}

//struct LinkView_Previews: PreviewProvider {
//    static var previews: some View {
//        LinkView(linkContent : LinkContent(url: "", title: ""), onPressRemove: {})
//            .environment(\.layoutDirection, .rightToLeft)
//    }
//}

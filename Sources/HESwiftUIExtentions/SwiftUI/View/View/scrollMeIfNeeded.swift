//
//  scrollMeIfNeeded.swift
//  JamalSale
//
//  Created by Hossam on 08/09/2021.
//

import SwiftUI
struct ScrollMeIfNeededModifier : ViewModifier {
    @Environment(\.safeAreaInsets) private var safeAreaInsets
    @State private var isInScroll : Bool = false
    func body(content: Content) -> some View {
        if isInScroll {
           return ScrollView{
                content
                    .readSize { size in
                        print(size)
                        configIsInScroll(contentHeight: size.height)
                    }
            }
           .eraseToAnyView()
        }else {
            return content
                .readSize { size in
                    print(size)
                    configIsInScroll(contentHeight: size.height)
                }
                .eraseToAnyView()
        }
    }
    
    func configIsInScroll(contentHeight : CGFloat){
       
        isInScroll = isHeightExceedScreenSize(contentHeight: contentHeight)
      
        
    }
    func isHeightExceedScreenSize(contentHeight : CGFloat)->Bool {
        print(getSafeAreaSize() , contentHeight , UIScreen.main.bounds.height)
        return contentHeight > getSafeAreaSize()
    }
    func getSafeAreaSize()->CGFloat {
        UIScreen.main.bounds.height - (safeAreaInsets.bottom + safeAreaInsets.top)
        
    }
    
    
    
}

private struct SafeAreaInsetsKey: EnvironmentKey {
    static var defaultValue: EdgeInsets {
        (UIApplication.shared.windows.first(where: { $0.isKeyWindow })?.safeAreaInsets ?? .zero).insets
    }
}

extension EnvironmentValues {
    
    var safeAreaInsets: EdgeInsets {
        self[SafeAreaInsetsKey.self]
    }
}

private extension UIEdgeInsets {
    
    var insets: EdgeInsets {
        EdgeInsets(top: top, leading: left, bottom: bottom, trailing: right)
    }
}


extension View {
     func scrollIfNeeded()-> some View {
        modifier(ScrollMeIfNeededModifier())
    }
}

//
//  NavigationBarTitle+EXT.swift
//  JamalSale
//
//  Created by Hossam on 04/09/2021.
//

import SwiftUI
extension View {
    func navigationBarColoredTitle(_ title : String ,  colorName : String = "GlobalGreen")->some View {
        let navigationBarTitleManager =  NavigationBarTitleManager(colorName: colorName, fontSize: 30, fontName: "Cairo-Black")
        navigationBarTitleManager.setApperanceToNavigationBar()
       return self.navigationTitle(title)
        
    }

}

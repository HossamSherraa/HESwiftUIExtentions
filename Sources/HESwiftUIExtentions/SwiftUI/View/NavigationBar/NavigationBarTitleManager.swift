//
//  File.swift
//  JamalSale
//
//  Created by Hossam on 04/09/2021.
//

import SwiftUI



struct NavigationBarTitleManager {
     let colorName : String
     let fontSize : CGFloat
    let fontName : String
    
    func setApperanceToNavigationBar() {
        let appearance = UINavigationBarAppearance()
               
               // this overrides everything you have set up earlier.
               appearance.configureWithTransparentBackground()
               
        appearance.largeTitleTextAttributes = getAppearanceLargeTitleTextAttributes()
        appearance.titleTextAttributes = getAppearanceSmallTitleTextAttributes()
              
               
               //In the following two lines you make sure that you apply the style for good
               UINavigationBar.appearance().scrollEdgeAppearance = appearance
               UINavigationBar.appearance().standardAppearance = appearance
               
               // This property is not present on the UINavigationBarAppearance
               // object for some reason and you have to leave it til the end
               UINavigationBar.appearance().tintColor = UIColor(named: colorName)
    }
    
   private  func getAppearanceLargeTitleTextAttributes() -> [NSAttributedString.Key : Any] {
       
       let largeTitleTextAttributes = [
         .font : UIFont(name: fontName, size: fontSize),
            NSAttributedString.Key.foregroundColor : UIColor(named: colorName)
        ]
        return largeTitleTextAttributes as [NSAttributedString.Key : Any]
    }
    
    private func getAppearanceSmallTitleTextAttributes()-> [NSAttributedString.Key : Any] {
        // this only applies to small titles
       let smallTitleTextAttributes = [
         .font : UIFont(name: fontName, size: fontSize),
            NSAttributedString.Key.foregroundColor : UIColor(named: colorName)
        ]
        return smallTitleTextAttributes as [NSAttributedString.Key : Any]
    }
    
}

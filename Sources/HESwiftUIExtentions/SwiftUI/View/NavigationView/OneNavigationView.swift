//
//  OneNavigationView.swift
//  JamalSale
//
//  Created by Hossam on 10/09/2021.
//

import SwiftUI
//I want .navigate(selected : Binding<Selected?> , DestinationView) { selectedItem in }
//If not needed it will be nill

extension NavigationLink where Label == EmptyView{
    
    init?<Selection>(
        selection : Binding<Selection?>,
        @ViewBuilder destination : (Selection)->Destination
                     ) {
        
        if let selectionValue = selection.wrappedValue {
            
            let isActive = Binding {
                return true
            } set: { newValue in
                if newValue == false {
                    selection.wrappedValue = nil
                }
            }

            self.init(
                destination: destination(selectionValue),
                isActive: isActive,
                label:  {EmptyView()} )
        }else {
            return nil
        }
    }
}

extension View {
    func navigateWhen<S , Content : View>(selected : Binding<S?> , @ViewBuilder destination : (S)-> Content) ->some View {
        return background(
        NavigationLink(selection: selected, destination: destination)
        )
    }
}

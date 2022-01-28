//
//  CheckBoxsForm.swift
//  JamalSale
//
//  Created by Hossam on 11/09/2021.
//

import SwiftUI

//CheckBoxsForm(selectableItems : [SelectableItem] , Binding SelectedItem)
struct CheckBoxsForm<T:SelectableItem> : View {
    var title : String
    let items : [T]
    @Binding var selectedItem : T?
    var additionalView : AnyView? = nil
    var body: some View {
        VStack (alignment:.leading, spacing : 8){
            HStack {
                Text(title)
                    .foregroundColor(.globalGreen)
                    .font(cairoFont: CairoFontSemiBold(size: 16))
                    
                Spacer()
                
                
            }
            HStack {
                ForEach(items) {
        
                    CheckBox(item: $0, selectedItem: $selectedItem)
                    Spacer()
                    
                }
                additionalView
            }
        }
    }
    
}

//struct CheckBoxsForm_Previews: PreviewProvider {
//    static var previews: some View {
//       CheckBoxsForm(title: "النوع", checkBoxes: [
//        CheckBox(title: "ذكر", isSelected: .constant(false)) ,
//        CheckBox(title: "انثى", isSelected: .constant(true))
//       ])
//       
//       .environment(\.layoutDirection, .rightToLeft)
//    }
//}

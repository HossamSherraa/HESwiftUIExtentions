//
//  ChoosingView.swift
//  JamalSale
//
//  Created by Hossam on 16/10/2021.
//

import SwiftUI

//ChossingView(items : [T] //ShuldBeInfaried , selectedItem : Binding<T?> // Should Be Infarid)

protocol SelectableItem : Equatable , Identifiable {
    var text : String {get}
}

struct ChoosingView<T>: View  , Dismissable where  T:SelectableItem {
    @Environment(\.presentationMode) var presentationMode
    
    let items : [T]
    @Binding var selectedItem : T?
    let title : String
    
    var body: some View {
    
        //ChoosingViewRow<GenericTypeTOO> Pass T
      
        VStack (alignment: .leading , spacing : 10){
            HStack {
                Button("تم الاختيار") {
                    dismiss()
                }
                .font(cairoFont: CairoFontBold(size: 18))
                .buttonStyle(RoundedButtonStyle(forgroundColor: .globalGreen))
                
                
                Spacer()
                Button("الغاء") {
                    selectedItem = nil
                    dismiss()
                }
                .font(cairoFont: CairoFontBold(size: 18))
                .buttonStyle(RoundedButtonStyle(forgroundColor: .red))
                
            }
            .padding(.horizontal)
            
         
            Text(title)
                .font(cairoFont: CairoFontBold(size: 30))
                .foregroundColor(.globalGreen)
                .padding(.horizontal)
            
            ScrollView {
                VStack {
                    ForEach(items) {
                        ChoosingViewRow.init(selectedItem: $selectedItem, item: $0)
                    }
                }
                
              
            }
        }
       
        
        
    }
}

struct ChoosingViewRow <T: SelectableItem> : View  {

    @Binding var selectedItem :T?
    @State var item : T
    
    var body: some View {
         
        HStack {
            Text(item.text)
                .font(cairoFont: CairoFontBold(size: 17))
                .foregroundColor(.globalGreen)
            Spacer()
            if isSelected {
            Image(systemName: "checkmark.circle")
                .resizable()
                .frame(width: 30, height: 30)
                .font(.system(size: 17, weight: .bold))
                .foregroundColor(.globalGreen)
            }
        }
        .padding(.horizontal , 30)
        .frame(height: 70)
        .background(
            RoundedRectangle(cornerRadius: 16, style: .continuous)
                .fill(isSelected ? Color.gray.opacity(0.19) : Color.gray.opacity(0.1))
        )
        .padding(.horizontal)
        .onTapGesture(perform: {
            self.selectedItem = item
        })
        .pressAndReleaseEffect()
    }
    
    var isSelected : Bool {
         item == selectedItem
    }
    
}

struct ChoosingView_Previews: PreviewProvider {
    static var previews: some View {

        return ChoosingView(items: [1,2,3,4,5,6,7,8], selectedItem: .constant(1), title: "اختر السن")
            .environment(\.layoutDirection, .rightToLeft)
    }
}
extension Int : Identifiable ,SelectableItem {
    public var id : Int {
        return self
    }
    public var text : String {
        return "self.description dfgdfg"
    }
}

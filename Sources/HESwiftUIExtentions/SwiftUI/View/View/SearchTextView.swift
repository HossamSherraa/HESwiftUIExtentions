//
//  SearchTextView.swift
//  JamalSale
//
//  Created by Hossam on 07/12/2021.
//

import SwiftUI
import Combine
class SearchTextViewModel : ViewModel {
    
    @Published var text : String = ""
    //When keyboard appears or disapperas , you will have opportunity to make animation or change states or hide spacific views when you listen to this publisher
    private let keyboardInteractionsSender : PassthroughSubject<Bool , Never>?
    init(keyboardApperanceSubject : PassthroughSubject<Bool , Never>? = nil ){
        self.keyboardInteractionsSender = keyboardApperanceSubject
        super.init()
        listenToKeyboardApperance()
    }
    func listenToKeyboardApperance(){
       NotificationCenter.default.addObserver(self, selector: #selector(onKeyboardApperance), name: UIResponder.keyboardWillShowNotification, object: nil)
       NotificationCenter.default.addObserver(self, selector: #selector(onKeyboardDisApperance), name: UIResponder.keyboardWillHideNotification, object: nil)
    
    }
    
    func endListenRoKeyboardApperance(){
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc
    func onKeyboardApperance(){
        keyboardInteractionsSender?.send(true)
    }
    
    @objc
    func onKeyboardDisApperance(){
        keyboardInteractionsSender?.send(false)
    }
    deinit{
        endListenRoKeyboardApperance()
    }
}
struct SearchTextView: View {
    @StateObject  var viewModel : SearchTextViewModel = .init()
    var isSearchButtonAppears : Bool = true
    let onPressSearch : ((_ searchText : String)->Void)? = nil
    var onChangeText : ((_ textChanged : String)->Void)? = nil
    private let systemImageName : String = "magnifyingglass"
    var body: some View {
        
    
           
                ZStack{
                    RoundedRectangle(cornerRadius: 12, style: .continuous)
                        .fill(Color(#colorLiteral(red: 0.9472720027, green: 0.9528134465, blue: 0.9652908444, alpha: 1)))
                        
                        .frame( height: 40)
                        
                    HStack{
                        Image(systemName: systemImageName)
                            .foregroundColor(.globalGreen)
                            .font(.system(size: 16, weight: .semibold))
                        TextField("البحث", text: $viewModel.text)
                        Button.init {
                            guard let onPressSearch = onPressSearch else {
                                return
                            }

                            onPressSearch(viewModel.text)
                        } label: {
                            if isSearchButtonAppears {
                            Text("إبحث")
                                .font(cairoFont: CairoFontSemiBold(size: 14))
                                .foregroundColor(.globalGreen)
                                .padding(.horizontal , 8)
                                .background(
                                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                                        .fill(Color.globalGreen.opacity(0.2))
                                )
                            }
                        }
                        .opacity(viewModel.text.isFullyEmpty ? 0 :  1)

                    }
                    .padding(.horizontal , 8)
                }
                .onChange(of: viewModel.text, perform: { _ in
                    if let onChangeText = onChangeText {
                        onChangeText(viewModel.text)
                    }
                })
            .font(cairoFont: CairoFontSemiBold(size: 17))
        
    }

            }
            
        
        



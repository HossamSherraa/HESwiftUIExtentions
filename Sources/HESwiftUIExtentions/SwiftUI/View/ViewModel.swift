//
//  File.swift
//  
//
//  Created by Hossam on 28/01/2022.
//

import Foundation
import Combine
import SwiftUI
class ViewModel : ObservableObject  {
    //Error
    @Published var isLoading : Bool = false
    @Published var isIntialLoading : Bool = false
    @Published var message : PresentableMessage? = nil
    
    var shouldDismiss : PassthroughSubject<Bool , Never> = .init()
    
    
    //ErrorManager
     lazy var messageManager : ErrorManager = {
       return TemporaryMessageManager(errorMessagePublisher: _message)
    }()
    
    var getPresentabeMessagePublisher : Published<PresentableMessage?> {
        _message
    }
    
    var subscriptions : Set<AnyCancellable> = []
    
    
    func hideAllErrors(){}
    
    func presentBigLoading(){
        withAnimation {
            isIntialLoading = true
        }
    }
    func hideBigLoading(){
        withAnimation {
            isIntialLoading = false
        }
    }
}

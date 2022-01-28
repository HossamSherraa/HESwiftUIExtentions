//
//  File.swift
//  
//
//  Created by Hossam on 28/01/2022.


//  ErrorManager.swift
//  JamalSale
//
//  Created by Hossam on 23/10/2021.
//

import Combine
import Foundation
import SwiftUI

protocol PresentableMessage {
    var color : Color {get}
    var title : String? {get}
    var subTitle : String? {get}
}
struct SubscribtionCompletionErrorMessage : PresentableMessage{
    
    init(completion : Subscribers.Completion<Error>){
        self.title = completion.errorMessage
    }
    var title: String?
    
    var color: Color {
        .red
    }
    
    
    var subTitle: String? {
        nil
    }
    
    
}
struct DefaultErrorMessage : PresentableMessage {
    let error : Error
    var title: String? {
        if let error  = error as? GlobalError {
            return error.message
        }
        return error.localizedDescription
    }
    var subTitle: String?
    
    var color: Color {
        .red
    }
    
    
}

struct SuccessMessage : PresentableMessage {
    var title: String?
    var subTitle: String?
    
    var color: Color {
        .globalGreen
    }
}

protocol ErrorManager {
    func sendMessage(from message : PresentableMessage , onDismiss : (()->Void)?)
    
}

class TemporaryMessageManager : ErrorManager {
    
    
    //Change publisher with optional string text for 3 seconds and then dismiss to nil // should be used in viewModel
    @Published var messagePublisher : PresentableMessage?
    
    init(errorMessagePublisher : Published<PresentableMessage?>){
        self._messagePublisher = errorMessagePublisher
    }
   private  let dismissingTime : TimeInterval = 3
   
    
    func sendMessage(from message : PresentableMessage , onDismiss : (()->Void)? = nil){
        guard let _ = message.title else {return}
             messagePublisher = message
        dismissAfter(time: dismissingTime, onDismiss: onDismiss)
        
    }
    
  private func getErrorMessage(from completion : Subscribers.Completion<Error>)->String?{
            if let errorMessage = completion.errorMessage {
               return errorMessage
        }
    
      
        return nil
    
    }
    
    private func dismissAfter( time : TimeInterval , onDismiss : (()->Void)? = nil){
        Timer.scheduledTimer(withTimeInterval: time, repeats: false) { [weak self]_ in
            self?.messagePublisher = nil
            (onDismiss ?? {})()
        }
    }
    
    
    
}





extension Subscribers.Completion {
    var errorMessage : String? {
        switch self {
        case .failure(let error) :
            if  let authError = error as? GlobalError {
                return authError.message
            }else {
                return "حدث خطأ ما"
            }
        default : return nil
        }
    }
}





protocol GlobalError : LocalizedError {
    var message : String {get}
    var rawValue : String {get}
}
extension GlobalError {
    var message : String {
        rawValue
    }
}

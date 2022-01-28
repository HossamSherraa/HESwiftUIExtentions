//
//  InfiniteScrollView.swift
//  JamalSale
//
//  Created by Hossam on 13/11/2021.
//

import Foundation
import SwiftUI

/*
 ViewModel Target :-
 1- I need a way to save Objects to and append new Objects , also a way to start loading , and stop loading , and also need a way to start big loading
 
 I need prsentLoading and HideLoading should be called from the view itself , to be able to animate it
 */


class InfiniteScrollViewModel<I : Identifiable & Equatable> : ViewModel  {
   
   
    
    @Published internal var objects : [I] = []
    
    override init() {
        super.init()
        
    }
    func getObjects()->[I] {
        return objects
    }
    
    func loadMoreIfNeeded(object: I ) {
        if isLastObject(object: object){
            print("LoadingMore ... ")
        }
    
    }
    
    func loadInitialObjects(){
      
        
    }
     func appendMore(objects : [I]){
       
            withAnimation {
                self.objects.append(contentsOf: objects)
            }
            self.hideBottomLoading()
        
    }
    
     
    
    internal func showBottomLoading(){
        withAnimation {
            isLoading = true
        }
    }
    
    internal func hideBottomLoading(){
        withAnimation {
            isLoading = false
        }
    }
    
   internal  func isLastObject(object : I)->Bool {
        objects.last == object
    }
    
    
}
struct InfiniteScrollView<T:Equatable & Identifiable , Content : View> : View {
    @Environment (\.horizontalSizeClass) var sizeClass
    @StateObject var viewModel : InfiniteScrollViewModel<T>
    @ViewBuilder var rowView : (T)->Content
   
    var body: some View {
        ScrollView(.vertical, showsIndicators: true) {
            LazyVGrid(columns: getAdsGridColumns(), content: {
                ForEach(viewModel.getObjects()) { object in
                    rowView(object)
                        .padding(.vertical , 5)
                        .onAppear {
                            viewModel.loadMoreIfNeeded(object: object)
                        }
                }
            })
        }
        
        .overlay(ConditionalView(condition: viewModel.isLoading, content: {
            LoadingShape()
                .scaleEffect(0.7)
                .transition(.offset(x: 0, y: 70).combined(with: .opacity))
        }), alignment: .bottom)
        .overlay(
            ConditionalView(condition: viewModel.isIntialLoading, content: {
                BigLoadingView()
            })
            , alignment: .center)
       
  
    }
    
    func getAdsGridColumns()->[GridItem] {
        switch sizeClass {
        case .compact:
            return [.init(.flexible(minimum: 200))]
        case .regular :
            return [.init(.adaptive(minimum: 370 , maximum: .infinity), spacing: 0)]
        default : return []
        }
    }
    
}


//struct InfiniteScrollView_Preview : PreviewProvider{
//    static var previews: some View {
//        return InfiniteScrollView(viewModel:InfiniteScrollViewModel<String>(), rowView: {object in ADSHomeRow(viewModel: .init(ads: FakeData.ads))})
//    }
//}

extension String : Identifiable {
    public var id : String{
        return self
    }
}

struct BigLoadingView: View {
    var body: some View {
        ZStack{
            Color.white.opacity(0.5)
                .ignoresSafeArea()
            RoundedRectangle(cornerRadius: 30, style: .continuous)
                .frame(width: 70, height: 70)
                .foregroundColor(.white)
            LoadingShape()
        }
        
    }
}



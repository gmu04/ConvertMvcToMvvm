//
//  ViewModel_3.swift
//  ConvertMvcToMvvm
//
//  Created by Gokhan Mutlu on 13.10.2026.
//

import Foundation


public final class ViewModel_kvo: NSObject{
    
    public enum ViewState{
        case buttonTitleChanged
    }
    @objc public dynamic var data:Any?
        

    private(set) var buttonTitle:String
    
    init(buttonTitle: String = "") {
        self.buttonTitle = buttonTitle
    }
    
    func businessLogic(){
        buttonTitle += " ++"
        print("Business logic outcome: \(buttonTitle)")
        self.data = ViewState.buttonTitleChanged
    }
    
}


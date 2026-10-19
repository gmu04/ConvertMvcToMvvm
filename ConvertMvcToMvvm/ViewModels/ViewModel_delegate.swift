//
//  ViewModel_1.swift
//  ConvertMvcToMvvm
//
//  Created by Gokhan Mutlu on 12.10.2026.
//

import Foundation

protocol ViewModel_1Delegate: AnyObject {
    func titleChanged()
}

class ViewModel_delegate{
    
    weak var delegate:ViewModel_1Delegate?
    
    private(set) var buttonTitle:String{
        didSet{
            delegate?.titleChanged()
        }
    }
        
    init(buttonTitle: String = "") {
        self.buttonTitle = buttonTitle
    }
    
    
    func businessLogic(){
        buttonTitle += " ++"
        print("Business logic outcome: \(buttonTitle)")
    }
    
    func businessLogic2(_ completion:/*@escaping*/ (String)->Void){
        completion(buttonTitle + "?")
    }
    
}

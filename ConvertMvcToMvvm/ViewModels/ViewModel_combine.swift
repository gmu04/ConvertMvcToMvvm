//
//  ViewModel_combine.swift
//  ConvertMvcToMvvm
//
//  Created by Gokhan Mutlu on 19.10.2026.
//

import Foundation
import Combine

final class ViewModel_combine{
    
    @Published private(set) var buttonTitle:String
    
    init(buttonTitle: String = "") {
        self.buttonTitle = buttonTitle
    }
    
    func businessLogic(){
        buttonTitle += " ++"
        print("such as button title - for example, \(buttonTitle)")
        //self.data = ViewState.buttonTitleChanged
    }
    
}

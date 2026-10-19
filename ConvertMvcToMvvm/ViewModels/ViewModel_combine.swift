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
    var cancellables = Set<AnyCancellable>()
    
    init(buttonTitle: String = "") {
        self.buttonTitle = buttonTitle
    }
    
    func businessLogic(){
        self.buttonTitle += " ++"
        print("Business logic outcome: \(buttonTitle)")
    }
    
}

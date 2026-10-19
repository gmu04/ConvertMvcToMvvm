//
//  ViewModel_2.swift
//  ConvertMvcToMvvm
//
//  Created by Gokhan Mutlu on 13.10.2026.
//

import Foundation

final class ViewModel_notificationCenter{
    
    private(set) var buttonTitle:String
    
    init(buttonTitle: String = "") {
        self.buttonTitle = buttonTitle
    }
    
    func businessLogic(){
        buttonTitle += " ++"
        print("Business logic outcome: \(buttonTitle)")
        NotificationCenter.default.post(name: .viewModel_2DataChangedNotification, object: nil)
    }
    
}


extension NSNotification.Name{
    public static var viewModel_2DataChangedNotification = Notification.Name("viewModel_2DataChangedNotification")
}

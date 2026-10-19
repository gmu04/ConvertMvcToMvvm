//
//  ViewController_MVC.swift
//  ConvertMvcToMvvm
//
//  Created by Gokhan Mutlu on 12.10.2026.
//

import UIKit
/*
    MVC design pattern
        - business logic in viewcontroller
 
 */


final class ViewController_mvc: UIViewController {
    
    // ?!: state in viewcontroller
    var buttonTitle:String!
    
    required init?(coder: NSCoder) {
        fatalError("Not implemented")
    }
    
    init(buttonTitle: String!) {
        self.buttonTitle = buttonTitle
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        button.configuration?.title = buttonTitle
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        view.addSubview(button)

        let SA = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: SA.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: SA.centerYAnchor)
        ])
    }
    
    @objc func buttonTapped(){
        // let's assume there's some business logic happening here
        //there's an action here that relies on the state of your application
        self.businessLogic()
    }
    
    private func businessLogic(){
        self.buttonTitle += " ++"
        print("Business logic outcome: \(self.buttonTitle!)")
        button.setTitle(buttonTitle, for: .normal)
    }
    
    
    lazy var button:UIButton = {
        let bt = UIButton(frame: .zero)
        var config = UIButton.Configuration.filled()
        config.baseBackgroundColor = .systemBlue
        config.baseForegroundColor = .white
        config.background.cornerRadius = 5
        config.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20)
        bt.configuration = config
        bt.translatesAutoresizingMaskIntoConstraints = false
        return bt
    }()
    
    

}

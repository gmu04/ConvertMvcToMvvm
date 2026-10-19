//
//  ViewController_MVVM_1.swift
//  ConvertMvcToMvvm
//
//  Created by Gokhan Mutlu on 12.10.2026.
//

import UIKit

final class ViewController_delegate: UIViewController {
    
    //It’s not the view controller’s responsibility to keep track of the state
    //var buttonTitle:String!
    
    private var vm:ViewModel_delegate!
    
    required init?(coder: NSCoder) {
        fatalError("Not implemented")
    }
    
    init(){
        super.init(nibName: nil, bundle: nil)
    }
    
    convenience init(_ vm:ViewModel_delegate) {
        self.init()
        self.vm = vm
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        vm.delegate = self

        titleChanged()
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
        vm.businessLogic()
        vm.businessLogic2 { str in
            print("businessLogic2 -> \(str)")
        }
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

extension ViewController_delegate: ViewModel_1Delegate{
    func titleChanged() {
        button.setTitle(vm.buttonTitle, for: .normal)
    }
    
    
}

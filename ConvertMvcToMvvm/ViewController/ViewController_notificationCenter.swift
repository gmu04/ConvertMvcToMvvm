//
//  ViewController_MVVM_2.swift
//  ConvertMvcToMvvm
//
//  Created by Gokhan Mutlu on 13.10.2026.
//

import UIKit

final class ViewController_notificationCenter: UIViewController {
    
    private var vm:ViewModel_notificationCenter!

    required init?(coder: NSCoder) {
        fatalError("Not implemented")
    }
    
    init(){
        super.init(nibName: nil, bundle: nil)
    }
    
    convenience init(_ vm:ViewModel_notificationCenter) {
        self.init()
        self.vm = vm
        NotificationCenter.default.addObserver(self, selector: #selector(viewModelDataChanged), name: .viewModel_2DataChangedNotification, object: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
    }
    
    @objc private func viewModelDataChanged(){
        self.titleChanged()
    }
    
    private func titleChanged() {
        button.configuration?.title = vm.buttonTitle
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

//
//  ViewController_MVVM_4.swift
//  ConvertMvcToMvvm
//
//  Created by Gokhan Mutlu on 19.10.2026.
//

import UIKit
import Combine

final class ViewController_combine: UIViewController{
    
    private var vm:ViewModel_combine!
    
    required init?(coder: NSCoder) {
        fatalError("Not implemented")
    }
    
    init(){
        super.init(nibName: nil, bundle: nil)
    }
    
    convenience init(_ vm:ViewModel_combine) {
        self.init()
        self.vm = vm

    }
    
    deinit {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //set initial title
        titleChanged()
        
        bindValues()
        
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        view.addSubview(button)

        let SA = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: SA.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: SA.centerYAnchor)
        ])
    }
    
    private func bindValues(){
        //listen to state changes
        vm.$buttonTitle
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: { [weak self] _ in
                self?.titleChanged()
            })
            .store(in: &vm.cancellables)
    }

    
    @objc func buttonTapped(){
        // let's assume there's some business logic happening here
        //there's an action here that relies on the state of your application
        vm.businessLogic()
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

//
//  HomeViewController.swift
//  ConvertMvcToMvvm
//
//  Created by Gokhan Mutlu on 19.10.2026.
//

import UIKit

class HomeViewController: UIViewController {
    
    // MARK: - UI Components
    
    private lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 16
        stack.alignment = .fill
        stack.distribution = .fillEqually
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private lazy var mvcButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("MVC (fat-client)", for: .normal)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 18, weight: .medium)
        button.layer.cornerRadius = 12
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(mvcButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var delegateButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("MVVM + Delegate", for: .normal)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 18, weight: .medium)
        button.layer.cornerRadius = 12
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(delegateButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var notificationCenterButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("MVVM + NotificationCenter", for: .normal)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 18, weight: .medium)
        button.layer.cornerRadius = 12
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(notificationCenterButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var kvoButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("MVVM + KVO", for: .normal)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 18, weight: .medium)
        button.layer.cornerRadius = 12
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(kvoButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var combineButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("MVVM + Combine", for: .normal)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 18, weight: .medium)
        button.layer.cornerRadius = 12
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(combineButtonTapped), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - Setup
    
    private func setupUI() {
        view.backgroundColor = .systemBackground
        title = "MVC ⇢ MVVM"
        
        // Add buttons to stack view
        stackView.addArrangedSubview(mvcButton)
        stackView.addArrangedSubview(delegateButton)
        stackView.addArrangedSubview(notificationCenterButton)
        stackView.addArrangedSubview(kvoButton)
        stackView.addArrangedSubview(combineButton)
        
        // Add stack view to view
        view.addSubview(stackView)
        
        // Setup constraints
        NSLayoutConstraint.activate([
            // Stack view constraints - centered vertically and horizontally
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            
            // Button height constraints
            mvcButton.heightAnchor.constraint(equalToConstant: 50),
            delegateButton.heightAnchor.constraint(equalToConstant: 50),
            notificationCenterButton.heightAnchor.constraint(equalToConstant: 50),
            kvoButton.heightAnchor.constraint(equalToConstant: 50),
            combineButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    // MARK: - Actions
    
    @objc private func mvcButtonTapped() {
        let viewController = ViewController_mvc(buttonTitle: "MVC")
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    @objc private func delegateButtonTapped() {
        let vm = ViewModel_delegate(buttonTitle: "MVVM + Delegate")
        let viewController = ViewController_delegate(vm)
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    @objc private func notificationCenterButtonTapped() {
        let vm = ViewModel_notificationCenter(buttonTitle: "MVVM + Notification Center")
        let viewController = ViewController_notificationCenter(vm)
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    @objc private func kvoButtonTapped() {
        let vm = ViewModel_kvo(buttonTitle: "MVVM + KVO")
        let viewController = ViewController_kvo(vm)
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    @objc private func combineButtonTapped() {
        let vm = ViewModel_combine(buttonTitle: "MVVM + Combine")
        let viewController = ViewController_combine(vm)
        navigationController?.pushViewController(viewController, animated: true)
    }
}

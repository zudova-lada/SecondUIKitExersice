//
//  ViewController.swift
//  SecondUIKitExercise
//
//  Created by Лада Зудова on 05.03.2023.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var firstButton = Button(text: "First button")
    private lazy var secondButton = Button(text: "Second button")
    private lazy var thirdButton = Button(text: "Third button")

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        [firstButton, secondButton, thirdButton].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        view.addSubview(firstButton)
        view.addSubview(secondButton)
        view.addSubview(thirdButton)
        
        NSLayoutConstraint.activate([
            firstButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            firstButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            
            secondButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            secondButton.topAnchor.constraint(equalTo: firstButton.bottomAnchor, constant: 30),
            
            thirdButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            thirdButton.topAnchor.constraint(equalTo: secondButton.bottomAnchor, constant: 30)
        ])
        
        thirdButton.addTarget(self, action: #selector(openModalController), for: .touchUpInside)
    }
    
    @objc
    private func openModalController() {
        let vc = UIViewController()
        vc.view.backgroundColor = .cyan
        self.present(vc, animated: true)
    }
    
}


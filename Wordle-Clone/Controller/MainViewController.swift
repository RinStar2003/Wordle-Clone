//
//  MainViewController.swift
//  Wordle-Clone
//
//  Created by мас on 23.11.2022.
//

import UIKit

class MainViewController: UIViewController {

    let keyboardVC = KeyboardViewController()
    let rectanglesVC = GameViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.backgroundColor = .systemGray6
        addViews()
    }
    
    private func addViews() {
        
        addChild(keyboardVC)
        keyboardVC.didMove(toParent: self)
        keyboardVC.view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(keyboardVC.view)
        
        addChild(rectanglesVC)
        rectanglesVC.didMove(toParent: self)
        rectanglesVC.view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(rectanglesVC.view)
        
        addConstraits()
    }

    func addConstraits() {
        
        NSLayoutConstraint.activate([
                    rectanglesVC.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                    rectanglesVC.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                    rectanglesVC.view.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                    rectanglesVC.view.bottomAnchor.constraint(equalTo: keyboardVC.view.topAnchor),
                    rectanglesVC.view.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.6),

                    keyboardVC.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                    keyboardVC.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                    keyboardVC.view.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
                ])
    }
}


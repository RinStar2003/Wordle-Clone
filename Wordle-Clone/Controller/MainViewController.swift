//
//  MainViewController.swift
//  Wordle-Clone
//
//  Created by мас on 23.11.2022.
//

import UIKit

class MainViewController: UIViewController {

    let answers = [
        "grime", "nerve", "train", "intro"
    ]
    
    var answer = ""
    
    private var guesses: [[Character?]] = Array(
        repeating: Array(repeating: nil, count: 5),
        count: 6
    )
    
    let keyboardVC = KeyboardViewController()
    let rectanglesVC = GameViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        answer = answers.randomElement() ?? "after"
        view.backgroundColor = .systemGray6
        addViews()
    }
    
    private func addViews() {
        
        addChild(keyboardVC)
        keyboardVC.didMove(toParent: self)
        keyboardVC.delegate = self
        keyboardVC.view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(keyboardVC.view)
        
        addChild(rectanglesVC)
        rectanglesVC.didMove(toParent: self)
        rectanglesVC.view.translatesAutoresizingMaskIntoConstraints = false
        rectanglesVC.datasource = self
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

extension MainViewController: KeyboardViewControllerDelegate{
    func keyboardViewController(_ vc: KeyboardViewController, didTapKey letter: Character) {

        // Update the guesses
        
        var stop = false
        for i in 0..<guesses.count {
            for j in 0..<guesses[i].count {
                if guesses[i][j] == nil {
                    guesses[i][j] = letter
                    stop = true
                    break
                }
            }
            if stop {
                break
            }
            
        }
        
        rectanglesVC.reloadData()

    }
}

extension MainViewController: GameViewControllerDataSource {
    var currentGuesses: [[Character?]] {
        return guesses
    }
    
    func boxColor(at indexPath: IndexPath) -> UIColor? {
        
        let rowIndex = indexPath.section
        let indexedAnswer = Array(answer)
        
        let count = guesses[rowIndex].compactMap({ $0 }).count
        guard count == 5 else {
            return nil
        }
        
        guard let letter = guesses[indexPath.section][indexPath.row],
            indexedAnswer.contains(letter) else {
            return .systemRed
        }
        
        if indexedAnswer[indexPath.row] == letter {
            return .systemGreen
        }
        return .systemOrange
        
    }

}

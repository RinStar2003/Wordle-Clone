//
//  KeyboardViewController.swift
//  Wordle-Clone
//
//  Created by мас on 23.11.2022.
//

import UIKit

class KeyboardViewController: UIViewController {

    let letters = ["qwertyuiop","asdfghjkl", "zxcvbnm"]
    private var keys: [[Character]] = []
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 2
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        collectionView.backgroundColor = .yellow
        
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            
            
            
        ])
    }
}

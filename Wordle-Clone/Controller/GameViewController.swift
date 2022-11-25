//
//  GameViewController.swift
//  Wordle-Clone
//
//  Created by мас on 23.11.2022.
//

import UIKit

class GameViewController: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource {
    
    let guesses: [[Character?]] = Array(
    
        repeating: Array(repeating: nil, count: 5),
        count: 6
    )
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 4
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        collectionView.backgroundColor = .clear
                
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: CollectionViewCell.identifier)
        
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 10),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),

        ])

    }
}

extension GameViewController {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
    
        return guesses.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return guesses[section].count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.identifier, for: indexPath) as? CollectionViewCell else {
            fatalError()
        }
                
        cell.contentView.backgroundColor = nil
        
        cell.layer.borderColor = UIColor.systemGray3.cgColor
        cell.layer.borderWidth = 1
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let margin: CGFloat = 20
        let size: CGFloat = (collectionView.frame.size.width - margin) / 5
        
        return CGSize(width: size, height: size)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {

        return UIEdgeInsets(top: 2, left: 2, bottom: 2, right: 2)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}

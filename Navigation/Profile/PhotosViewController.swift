//
//  PhotosViewController.swift
//  Navigation
//
//  Created by Valery Shel on 24.10.2020.
//  Copyright © 2020 Artem Novichkov. All rights reserved.
//

import UIKit

class PhotosViewController: UIViewController {
    

    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(
            PhotosCollectionViewCell.self,
            forCellWithReuseIdentifier: String(describing: PhotosCollectionViewCell.reuseIdentifier))

        collectionView.toAutoLayout()
        collectionView.backgroundColor = .white
        collectionView.dataSource = self
        collectionView.delegate = self

        return collectionView
    }()
    
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Photo Gallery"
        setupLayout()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = false
    }

    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }
}

extension PhotosViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        PhotoStorage.photos.count
    }
        
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: PhotosCollectionViewCell = collectionView.dequeueReusableCell(
            withReuseIdentifier: String(describing: PhotosCollectionViewCell.reuseIdentifier),
            for: indexPath
        ) as! PhotosCollectionViewCell

        cell.photos = PhotoStorage.photos[indexPath.item]
        return cell
    }
    
}


extension PhotosViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)

    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.width/3.0 - 16
        let height = width 

        return CGSize(width: width, height: height)
    }
        
}

private extension PhotosViewController {
    func setupLayout() {
        view.addSubview(collectionView)
        
        let constraints = [
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
}


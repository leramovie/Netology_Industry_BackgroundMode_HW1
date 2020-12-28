//
//  PhotosCollectionViewCell.swift
//  Navigation
//
//  Created by Valery Shel on 24.10.2020.
//  Copyright © 2020 Artem Novichkov. All rights reserved.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    
    static let reuseIdentifier = "PhotosCollectionViewCell"
    
    var photos: Photo? {
        didSet {
            guard let photos = photos else { return }
            imageView.image = photos.photo
        }
    }

    private let imageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.toAutoLayout()
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
     
        contentView.backgroundColor = .white
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
    
private extension PhotosCollectionViewCell {
    func setupLayout() {
        contentView.addSubview(imageView)
    
        let constraints = [
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ]
        NSLayoutConstraint.activate(constraints)
    }

}

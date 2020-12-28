//
//  PhotosTableViewCell.swift
//  Navigation
//
//  Created by Valery Shel on 21.10.2020.
//  Copyright © 2020 Artem Novichkov. All rights reserved.
//

import UIKit

class PhotosTableViewCell: UITableViewCell {
    
    
    static let reuseIdentifier = "PhotosTableViewCell"
    

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.text = "Photos"
        return label
    }()
    
    private lazy var imageNext: UIImageView = {
        let image = UIImageView()
        image.image = #imageLiteral(resourceName: "redo")
        image.toAutoLayout()
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    
    private lazy var firstImage: UIImageView = {
        let image = UIImageView()
        image.image = #imageLiteral(resourceName: "15")
        image.contentMode = .scaleToFill
        image.toAutoLayout()
        image.clipsToBounds = true
        image.layer.cornerRadius = 6
        return image
    }()
    
    private lazy var secondImage: UIImageView = {
        let image = UIImageView()
        image.image = #imageLiteral(resourceName: "11")
        image.contentMode = .scaleToFill
        image.toAutoLayout()
        image.clipsToBounds = true
        image.layer.cornerRadius = 6
        return image
    }()
    
    private lazy var thirdImage: UIImageView = {
        let image = UIImageView()
        image.image = #imageLiteral(resourceName: "19")
        image.contentMode = .scaleToFill
        image.clipsToBounds = true
        image.toAutoLayout()
        image.layer.cornerRadius = 6
        return image
    }()
    
    private lazy var fourthImage: UIImageView = {
        let image = UIImageView()
        image.image = #imageLiteral(resourceName: "5")
        image.contentMode = .scaleToFill
        image.toAutoLayout()
        image.clipsToBounds = true
        image.layer.cornerRadius = 6
        return image
    }()
    
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 8
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        return stackView
    }()

    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupLayout()
    }
 
}


private extension PhotosTableViewCell {
    func setupLayout() {
        
        contentView.addSubviews(titleLabel, imageNext, stackView)
        
        stackView.addArrangedSubview(firstImage)
        stackView.addArrangedSubview(secondImage)
        stackView.addArrangedSubview(thirdImage)
        stackView.addArrangedSubview(fourthImage)
        
        let constraints = [
            
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            titleLabel.bottomAnchor.constraint(equalTo: stackView.topAnchor, constant: -12),

            imageNext.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            imageNext.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
            imageNext.heightAnchor.constraint(equalToConstant: 20),
            imageNext.widthAnchor.constraint(equalToConstant: 20),
            
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12),
            stackView.heightAnchor.constraint(equalToConstant: (UIScreen.main.bounds.width - 24)/4 )
        ]
        NSLayoutConstraint.activate(constraints)
    }
}


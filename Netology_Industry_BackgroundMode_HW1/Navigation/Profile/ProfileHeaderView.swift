//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Valery Shel on 09.10.2020.
//  Copyright © 2020 Artem Novichkov. All rights reserved.
//

import UIKit


final class ProfileHeaderView: UIView {
    
    
    @IBOutlet weak var avatarImageView: UIImageView! {
        didSet {
            avatarImageView.layer.cornerRadius = avatarImageView.frame.width / 2
            avatarImageView.layer.borderWidth = 3.0
            avatarImageView.layer.borderColor = UIColor.white.cgColor
        }
    }
    
    @IBOutlet weak var fullNameLabel: UILabel! {
        didSet {
            fullNameLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
            fullNameLabel.textColor = .white
            fullNameLabel.text = "Lera's cat - Cox"
        }
    }
    
    @IBOutlet weak var statusLabel: UILabel! {
        didSet {
            statusLabel.text = "В сети"
            statusLabel.textColor = .white
        }
    }
    
    @IBOutlet weak var statusTextField: UITextField! {
        didSet {
            statusTextField.placeholder = "Waiting for something"
        }
    }
    
    @IBOutlet weak var setStatusButton: UIButton! {
        didSet {
            setStatusButton.layer.cornerRadius = 4
            setStatusButton.layer.shadowColor = UIColor.gray.cgColor
            setStatusButton.layer.shadowOffset = CGSize(width: 4, height: 4)
            setStatusButton.layer.shadowOpacity = 0.7
            setStatusButton.layer.shadowRadius = 4
            setStatusButton.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
            setStatusButton.setTitle("Show status", for: .normal)
            setStatusButton.setTitleColor(.white, for: .normal)
            setStatusButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        }
    }
    
    @objc func buttonPressed() {
        showStatusText()
    }
    
    
   private func showStatusText() {
        if let enteredStatusText = statusTextField.text {
            print(enteredStatusText)
        } else {
            print("I don't see entered status. Try enter again")
        }
    }
}



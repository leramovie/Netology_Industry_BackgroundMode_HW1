//
//  ProfileTableHeaderView.swift
//  Navigation
//
//  Created by Valery Shel on 21.10.2020.
//  Copyright © 2020 Artem Novichkov. All rights reserved.
//

import UIKit


class ProfileTableHeaderView: UIView {
    
   var expandedPhoto: UIImageView = UIImageView()
            
    private lazy var avatar: UIImageView = {
        let image = UIImageView()
        image.image = #imageLiteral(resourceName: "CoxCat")
        image.layer.cornerRadius = 50
        image.layer.masksToBounds = true
        image.layer.borderWidth = 3.0
        image.layer.borderColor = UIColor.white.cgColor
        image.isUserInteractionEnabled = true
        
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(tappedAvatar))
        tapRecognizer.delegate = self
        tapRecognizer.numberOfTapsRequired = 1
        image.addGestureRecognizer(tapRecognizer)

        return image
    }()
    
    private let userName: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.textColor = .black
        label.text = "Lera's cat - Cox"
        
        return label
    }()
    
    private let textField: UITextField = {
        var textField = UITextField()
        textField.placeholder = "Waiting for something..."
        textField.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        textField.textColor = .black
        
        return textField
    }()
    
    private let showStatusButton: UIButton = {
        var button = UIButton()
        button.layer.cornerRadius = 4
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowOpacity = 0.7
        button.layer.shadowRadius = 4
        button.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        button.setTitle("Show status", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        
        return button
    }()
    
    //MARK: Stored for advances Avatar after tapped
    let backgroundAvatar: UIView = {
        let avatarView = UIView()
        avatarView.frame = UIScreen.main.bounds
        avatarView.backgroundColor = #colorLiteral(red: 0.1192706074, green: 0.129136893, blue: 0.1434701552, alpha: 0.7747752568)
        
        return avatarView
    }()
    
    let closeAvatar: UIButton = {
        let button = UIButton(frame: CGRect(x: UIScreen.main.bounds.maxX - 30, y: 0, width: 15, height: 15))
        button.tintColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1).withAlphaComponent(0.1)
        button.sizeToFit()
        button.setImage(UIImage(contentsOfFile: "closeIcon"), for: button.state)
        button.addTarget(self, action: #selector(closeAvatarPopup), for: .touchUpInside)
        button.tintColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)

        return button
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupLayout()

    }
    
    required init?(coder: NSCoder) {
        fatalError("init[coder:] has not been implemented")
    }
    
    private func setupLayout() {
        
        addSubviews(avatar, userName, showStatusButton, textField)

        
        let constraints = [
            avatar.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            avatar.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            avatar.widthAnchor.constraint(equalToConstant: 100),
            avatar.heightAnchor.constraint(equalToConstant: 100),
            
            userName.topAnchor.constraint(equalTo: topAnchor, constant: 27),
            userName.leadingAnchor.constraint(equalTo: avatar.trailingAnchor, constant: 20),
            userName.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            textField.topAnchor.constraint(equalTo: showStatusButton.topAnchor, constant: -34),
            textField.leadingAnchor.constraint(equalTo: userName.leadingAnchor),
            textField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            showStatusButton.topAnchor.constraint(equalTo: avatar.bottomAnchor, constant: 16),
            showStatusButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            showStatusButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            showStatusButton.heightAnchor.constraint(equalToConstant: 50),
            showStatusButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    @objc func buttonPressed() {
        showStatusText()
    }
    
    @objc func closeAvatarPopup() {
        
        UIView.animate(withDuration: 0.5,
                       animations: { [weak self] in
                        self?.backgroundAvatar.alpha = 0.0
                        self?.closeAvatar.alpha = 0.0
                        self?.expandedPhoto.alpha = 0.0
            
                       }) { [weak self] _ in
                        self?.backgroundAvatar.isHidden = true
                        self?.closeAvatar.isHidden = true
                        self?.expandedPhoto.isHidden = true
                    }
    }
    
    private func showStatusText() {
        if let enteredStatusText = textField.text {
            print(enteredStatusText)
        } else {
            print("I don't see entered status. Try enter again")
        }
    }
    
    private func checkAvatarWasTappedAlready() -> Bool  {

        if self.backgroundAvatar.isHidden == true {
            print("backgroundAvatar already added as subview and Close button was tapped")
            return true
        } else {
            print("probably avatar haven't been opened never ever")
            return false
        }
       
    }
    
    @objc func tappedAvatar() {
        
       let avatarWasTappedInSession = checkAvatarWasTappedAlready()
    
        if avatarWasTappedInSession == false {
            UIView.animateKeyframes(withDuration: 0.5, delay: 0, options: []) {
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1) { [self] in
                 
                    //Не удалось предотвратить реверс, поэтому добавлено новое значение фото
                    let photoImage = avatar.image
                    expandedPhoto = UIImageView(image: photoImage)
                    
                    addSubview(backgroundAvatar)
                    backgroundAvatar.addSubview(expandedPhoto)
                    backgroundAvatar.addSubview(closeAvatar)
            
                    expandedPhoto.center = backgroundAvatar.center
                    expandedPhoto.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
                    expandedPhoto.contentMode = .scaleAspectFit
                    expandedPhoto.layer.masksToBounds = false
                    expandedPhoto.layer.cornerRadius = 0
                    expandedPhoto.layer.borderWidth = 0
                }
                
            } completion: { finished in
                
                if finished == true {
                    UIView.animateKeyframes(withDuration: 0.3, delay: 0.5) { [self] in
                        print(finished)
                        closeAvatar.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1).withAlphaComponent(1)
                    }
                } else {
                    print("Анимация раскрытия картинки не сработала")
                }
            }
        } else {
            
            UIView.animate(withDuration: 0.5,
                           animations: { [weak self] in
                            self?.backgroundAvatar.alpha = 1.0
                            self?.closeAvatar.alpha = 1.0
                            self?.expandedPhoto.alpha = 1.0
                
                           }) { [weak self] _ in
                            self?.backgroundAvatar.isHidden = false
                            self?.closeAvatar.isHidden = false
                            self?.expandedPhoto.isHidden = false
            }
        }
        
    }

}



extension ProfileTableHeaderView: UIGestureRecognizerDelegate {
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldBeRequiredToFailBy otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
}

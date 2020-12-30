//
//  LoginView.swift
//  Navigation
//
//  Created by Valery Shel on 17.10.2020.
//  Copyright © 2020 Artem Novichkov. All rights reserved.
//
//
//import UIKit
//
//protocol LoginViewDelegate: AnyObject {
//    func didTapLoginButton()
//}
//
//@available(iOS 13.0, *)
//class LoginView: UIView {
//    
//    weak var delegate: LoginViewDelegate?
//
//    private let iconVK: UIImageView = {
//        let imageView = UIImageView()
//        imageView.image = #imageLiteral(resourceName: "logo")
//        imageView.contentMode = .scaleAspectFit
//        return imageView
//    }()
//    
//    
//    private let loginTextField: UITextField = {
//        var loginTextField = UITextField()
//        loginTextField.roundCornersWithRadius(10, top: true, bottom: false, shadowEnabled: false)
//        loginTextField.placeholder = "Email or phone"
//        loginTextField.font = UIFont.systemFont(ofSize: 16, weight: .regular)
//        loginTextField.tintColor = Styles.Colors.accentColor
//        loginTextField.backgroundColor = Styles.Colors.systemGray6
//        loginTextField.layer.borderColor = UIColor.lightGray.cgColor
//        loginTextField.layer.borderWidth = 0.5
//        loginTextField.textColor = .black
//        loginTextField.autocapitalizationType = .none
//        loginTextField.setLeftPaddingPoints(10)
//        
//        return loginTextField
//    }()
//    
//    private let passwordTextField:UITextField = {
//        var passwordTextField = UITextField()
//        passwordTextField.roundCornersWithRadius(10, top: false, bottom: true, shadowEnabled: false)
//        passwordTextField.placeholder = "Password"
//        passwordTextField.font = UIFont.systemFont(ofSize: 16, weight: .regular)
//        passwordTextField.tintColor = Styles.Colors.accentColor
//        passwordTextField.backgroundColor = Styles.Colors.systemGray6
//        passwordTextField.layer.borderColor = UIColor.lightGray.cgColor
//        passwordTextField.layer.borderWidth = 0.5
//        passwordTextField.textColor = .black
//        passwordTextField.autocapitalizationType = .none
//        passwordTextField.setLeftPaddingPoints(10)
//        passwordTextField.isSecureTextEntry = true
//        passwordTextField.isEnabled = true
//        passwordTextField.isUserInteractionEnabled = true
//        
//        return passwordTextField
//    }()
//    
//    private let loginStackView: UIStackView = {
//        
//        let stackView = UIStackView()
//        stackView.axis = .vertical
//        stackView.distribution = .fillEqually
//        stackView.alignment = .fill
//        stackView.spacing = 0
//
//        return stackView
//    }()
//    
//    private lazy var loginButton: UIButton = {
//        let button = UIButton(type: .system)
//        button.setTitle("Log In", for: .normal)
//        button.setBackgroundImage(UIImage(named: "blue_pixel"), for: .normal)
//        button.setBackgroundImage(#imageLiteral(resourceName: "blue_pixel").alpha(0.8), for: .selected)
//        button.setBackgroundImage(#imageLiteral(resourceName: "blue_pixel").alpha(0.8), for: .disabled)
//        button.setBackgroundImage(#imageLiteral(resourceName: "blue_pixel").alpha(0.8), for: .highlighted)
//        button.setTitleColor(.white, for: .normal)
//        button.layer.cornerRadius = 10
//        button.layer.masksToBounds = true
//        button.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
//        button.isEnabled = true
//        button.isUserInteractionEnabled = true
//
//        return button
//    }()
//    
//    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        
//        setupLayout()
//    }
//    
//    
//    required init?(coder: NSCoder) {
//        fatalError("init[coder:] has not been implemented")
//    }
//    
//    private func setupLayout() {
//        
//        addSubviews(iconVK, loginStackView, loginButton)
//        loginStackView.addArrangedSubview(loginTextField)
//        loginStackView.addArrangedSubview(passwordTextField)
//        
//        let constraints = [
//            iconVK.topAnchor.constraint(equalTo: topAnchor, constant: 120),
//            iconVK.centerXAnchor.constraint(equalTo: centerXAnchor),
//            iconVK.widthAnchor.constraint(equalToConstant: 100),
//            iconVK.heightAnchor.constraint(equalToConstant: 100),
//            
//            loginStackView.topAnchor.constraint(equalTo: iconVK.bottomAnchor, constant: 120),
//            loginStackView.heightAnchor.constraint(equalToConstant: 100),
//            loginStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
//            loginStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
//            
//            loginButton.topAnchor.constraint(equalTo: loginStackView.bottomAnchor, constant: 16),
//            loginButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
//            loginButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
//            loginButton.heightAnchor.constraint(equalToConstant: 50),
//            loginButton.bottomAnchor.constraint(equalTo: bottomAnchor)
//        ]
//        NSLayoutConstraint.activate(constraints)
//    }
//    
//    @objc func loginButtonTapped() {
//        delegate?.didTapLoginButton()
//    }
//}
//
//
//extension UIView {
//
//  func roundCornersWithRadius(_ radius: CGFloat, top: Bool? = true, bottom: Bool? = true, shadowEnabled: Bool = true, shadowOffset: CGSize = CGSize(width: 4, height: 4), shadowRadius: CGFloat = CGFloat(4), shadowColor: CGColor? = UIColor.black.cgColor, shadowOpacity: Float = 0.7 ) {
//    var maskedCorners = CACornerMask()
//    if shadowEnabled {
//      clipsToBounds = true
//      layer.masksToBounds = false
//      layer.shadowOpacity = shadowOpacity
//      layer.shadowColor = shadowColor
//      layer.shadowRadius = shadowRadius
//      layer.shadowOffset = shadowOffset
//    }
//    switch (top, bottom) {
//    case (true, false):
//      maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
//    case (false, true):
//      maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
//    case (true, true):
//      maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner, .layerMaxXMaxYCorner, .layerMinXMaxYCorner]
//    default:
//      break
//    }
//    layer.cornerRadius = radius
//    layer.maskedCorners = maskedCorners
//  }
//}
//
//
//extension UITextField {
//    func setLeftPaddingPoints(_ amount:CGFloat){
//        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
//        self.leftView = paddingView
//        self.leftViewMode = .always
//    }
//    func setRightPaddingPoints(_ amount:CGFloat) {
//        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
//        self.rightView = paddingView
//        self.rightViewMode = .always
//    }
//}

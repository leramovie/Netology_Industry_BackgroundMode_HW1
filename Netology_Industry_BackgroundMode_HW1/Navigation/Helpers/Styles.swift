//
//  Styles.swift
//  Navigation
//
//  Created by Valery Shel on 18.10.2020.
//  Copyright © 2020 Artem Novichkov. All rights reserved.
//
import UIKit

enum Styles {
    enum Images {}
    enum Colors {}
    enum Fonts {}
}

extension Styles.Images {
    static let coxCat: UIImage = #imageLiteral(resourceName: "CoxCat")
    static let iconVK: UIImage = #imageLiteral(resourceName: "logo")
}


extension Styles.Colors {
    static let accentColor: UIColor = UIColor(named: "ColorSet") ?? #colorLiteral(red: 0.2823529412, green: 0.5215686275, blue: 0.8, alpha: 1)
    static let systemGray6: UIColor = UIColor(red: 242/255.0, green: 242/255.0, blue: 247/255.0, alpha: 1.0)
    static let postTitleColor: UIColor = UIColor(red: 0.2, green: 0.478, blue: 0.718, alpha: 1)
    static let postDesctiprionColor: UIColor = UIColor(red: 0.426, green: 0.432, blue: 0.458, alpha: 1)
}

extension Styles.Fonts {
    
    
}

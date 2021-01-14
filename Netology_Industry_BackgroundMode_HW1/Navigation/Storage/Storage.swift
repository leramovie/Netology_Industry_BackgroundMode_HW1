//
//  Storage.swift
//  Navigation
//
//  Created by Valery Shel on 20.10.2020.
//  Copyright © 2020 Artem Novichkov. All rights reserved.
//

import Foundation

struct Storage {
    static let posts = [
        
            PostDetail(author: "Piter Rabbit",
                 description: "It's me",
                 image: #imageLiteral(resourceName: "OnlyPiter"),
                 likes: 342,
                 views: 1000 ),
            
            PostDetail(author: "Piter Rabbit",
                 description: "My dear Mama",
                 image: #imageLiteral(resourceName: "MotherAndPiter"),
                 likes: 456,
                 views: 1112 ),
            
            PostDetail(author: "Piter Rabbit",
                 description: "My Sweetheart",
                 image: #imageLiteral(resourceName: "PiterAndLady"),
                 likes: 500,
                 views: 2000 ),
            
            PostDetail(author: "Piter Rabbit",
                 description: "Friends forever",
                 image: #imageLiteral(resourceName: "PiterAndRabbit"),
                 likes: 234,
                 views: 500 )
        
        
    ]
}

//
//  posts.swift
//  VetEks Golf
//
//  Created by Duane Jordaan on 2017/07/08.
//  Copyright © 2017 Duane Jordaan. All rights reserved.
//

import Foundation
class Post {
    var name: String
    var gross: String
    var par: String
    var photoUrl: String
    var score: String
    var stroke: String
    //var date: String
    
    init(nameText: String,grossText: String, photoUrlString: String, parText: String, scoreText: String, strokeText: String) {
        name = nameText
        gross = grossText
        par = parText
        photoUrl = photoUrlString
        score = scoreText
        stroke = strokeText
    }
}

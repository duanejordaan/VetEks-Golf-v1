//
//  score.swift
//  VetEks Golf
//
//  Created by Duane Jordaan on 2017/06/20.
//  Copyright © 2017 Duane Jordaan. All rights reserved.
//

import Foundation

class Scorecard {
    var name = ""
    var date = ""
    var score = ""
    var image = ""

init(name: String, date: String, score: String, image: String) {
    self.name = name
    self.date = date
    self.score = score
    self.image = image
}
}

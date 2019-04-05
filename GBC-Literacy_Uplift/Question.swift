//
//  Question.swift
//  GBC-Literacy_Uplift
//
//  Created by Maxim Paxton on 2019-04-04.
//  Copyright © 2019 Maxim Paxton. All rights reserved.
//

import Foundation

class Question{
    var id:Int
    var question:String
    var rightAnswer:String
    var wrong1:String
    var wrong2:String
    var wron3:String
    
    init(id:Int, question:String, rightAnswer:String, wrong1:String, wrong2:String, wrong3:String) {
        self.id = id
        self.question = question
        self.rightAnswer = rightAnswer
        self.wrong1 = wrong1
        self.wrong2 = wrong2
        self.wron3 = wrong3
    }
}

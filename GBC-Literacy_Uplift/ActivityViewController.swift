//
//  ActivityViewController.swift
//  GBC-Literacy_Uplift
//
//  Created by Maxim Paxton on 2019-03-21.
//  Copyright © 2019 Maxim Paxton. All rights reserved.
//

import UIKit

class ActivityViewController: UIViewController {
    
    
    var msg_unit:String!
    var msg_lesson:String!
    var questionS = [Question]()
    
    //No databse Yet, Just logic of the page
    let questions = ["Favourite Pet?","Favourite Color?","Favourite Teams?"]
    
    let answers = [["Dog","Cat","Bird","Snake"],["Red","Yellow","Green","Orange"],["Raptors","Bulls","Knicks","Nuggets"]]
    ///////////////////////////////////////////
    var currentQuestion = 0
    var rightAnwer:UInt32 = 0
    var score:Int = 0
    

    @IBOutlet weak var fromLessonLabel: UILabel!
    
    //Button are linked to this function
    @IBAction func answered(_ sender: AnyObject) {
        if(sender.tag ==  Int(rightAnwer)){
            score += 1
            print("Right")
        }else{
            print("Wrong")
        }
        if currentQuestion != questions.count{
            displayNextQuestion()
        }else{
            performSegue(withIdentifier: "showScore", sender: self)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //take away back option
        navigationItem.hidesBackButton = true
        print(questionS)
//        if let m = msg_unit{
//            fromLessonLabel.text = m
//        } else{
//            fromLessonLabel.text = "empty"
//        }
//        if let m = msg_lesson{
//            fromLessonLabel.text = fromLessonLabel.text! + m
//        } else{
//            fromLessonLabel.text = fromLessonLabel.text! + "empty"
//        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        displayNextQuestion()
    }
    
    //Function that updates View
    func displayNextQuestion(){
        fromLessonLabel.text = questions[currentQuestion]
        rightAnwer = arc4random_uniform(4) + 1
        //Create Button
        var button:UIButton = UIButton()
        var x = 1
        
        for i in 1...4{
            //Create a Button
            button = view.viewWithTag(i) as! UIButton
            
            if (i == Int(rightAnwer)){
                button.setTitle(answers[currentQuestion][0], for: .normal)
            } else{
                button.setTitle(answers[currentQuestion][x], for: .normal)
                x = x+1
            }
        }
        currentQuestion += 1
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showScore"{
            let dst = segue.destination as! ScoreViewController
            dst.score = score
        }
        
    }

}

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
    var questionBank = [Question]()
    
//    var questions: [String] {
//        return [questionBank[0].question,questionBank[1].question,questionBank[2]] as! [String]
//    }
    
    var questions = [String]()
//    }
    var answers = [[String]]()
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
        print(questionBank[0].question)
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
        assignQuiz()
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
    
    func assignQuiz(){
        questions = [questionBank[0].question,questionBank[1].question,questionBank[2].question]
        
        answers = [[questionBank[0].rightAnswer,questionBank[0].wrong1,questionBank[0].wrong2,questionBank[0].wrong3],[questionBank[1].rightAnswer,questionBank[1].wrong1,questionBank[1].wrong2,questionBank[1].wrong3],[questionBank[2].rightAnswer,questionBank[2].wrong1,questionBank[2].wrong2,questionBank[2].wrong3]]
    }
    

}

//
//  LessonViewController.swift
//  GBC-Literacy_Uplift
//
//  Created by Maxim Paxton on 2019-03-14.
//  Copyright © 2019 Maxim Paxton. All rights reserved.
//

import Foundation
import UIKit
import SQLite3

class LessonViewController: UIViewController {
    
    var msg:String!
    //Db object reference
    var db: OpaquePointer?
    var questions = [Question]()
    var created = false
    
    
    func readValues(){
        questions.removeAll()
        let q = "SELECT * FROM Questions"
        var stmt: OpaquePointer?
        if sqlite3_prepare(db, q,-1, &stmt, nil) != SQLITE_OK{
            let err = String(cString: sqlite3_errmsg(db))
            print("Error preparing stm for Questions in databse:\(err)")
            return
        }
        while sqlite3_step(stmt) == SQLITE_ROW {
            let id = Int(sqlite3_column_int(stmt, 0))
            let question  = String(cString: sqlite3_column_text(stmt, 1))
            let rightAnswer  = String(cString: sqlite3_column_text(stmt, 2))
            print(rightAnswer)
            let wrong1  = String(cString: sqlite3_column_text(stmt, 3))
            let wrong2  = String(cString: sqlite3_column_text(stmt, 4))
            let wrong3  = String(cString: sqlite3_column_text(stmt, 5))
            let u = Question(id: id,question: question, rightAnswer: rightAnswer, wrong1: wrong1, wrong2: wrong2, wrong3: wrong3 )
            questions.append(u)
        }
        print("Loaded Question Bank Into Models")
        
    }
    
    @IBOutlet weak var fromUnitInfo: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Lessons"
        
        if created == false {
            //Db File Creation
            created = true
            let file = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent("databse.db")
            if sqlite3_open(file.path, &db) != SQLITE_OK{
                print("Error opening Databse")
            } else {
                let create = "DROP TABLE IF EXISTS Questions; CREATE TABLE IF NOT EXISTS Questions (id INTEGER PRIMARY KEY AUTOINCREMENT, question TEXT , rightAnswer TEXT, wrong1 TEXT, wrong2 TEXT, wrong3 TEXT )"
                if sqlite3_exec(db,create,nil,nil,nil) != SQLITE_OK{
                    let err = String(cString: sqlite3_errmsg(db))
                    print("Error creating databse:\(err)")
                }
            }
            addQuestionBank()
        }
        readValues()
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //passing data ahead for future database
        if segue.identifier == "lesson1"{
            let dst = segue.destination as! ActivityViewController
            dst.msg_unit = msg
            dst.msg_lesson = "lesson1"
            dst.questionS = questions
        } else if segue.identifier == "lesson2"{
            let dst = segue.destination as! ActivityViewController
            dst.msg_unit = msg
            dst.questionS = questions
            dst.msg_lesson = "lesson2"
        } else if segue.identifier == "lesson3"{
            let dst = segue.destination as! ActivityViewController
            dst.msg_unit = msg
            dst.questionS = questions
            dst.msg_lesson = "lesson3"
        }
    }
    
    func addQuestionBank(){
        
        //Populate databse with Question Bank
        let questions = ["Favourite Pet?","Favourite Color?","Favourite Teams?",
                         "What's your favourite food?","What's your favourite Car?","What's your favourite Day",
                         "What's your favourite Actor?","What's your favourite Subject?","What's your favourite Country?",
                         "What is 2+2?","What is 2+10","What is 2+5?",
                         "What is the capital of Canada?","What is the Capital of Italy", "What is the Capital of Denmark?",
                         "Fire is...", "Water is...","Ice is ...",
                         "Spaghetti is...","Mac and chees is...","Onion Soup is ..",
                         "What is Water?","What is Potassium?","What is Hydrogen?",
                         "What is Love?","What is a Guitar?","What is a Lion?"]
        
        //Answers
        let answers = [["Dog","Cat","Bird","Snake"],["Red","Yellow","Green","Orange"],["Raptors","Bulls","Knicks","Nuggets"],
                       ["Pizza","Hot Dogs","Tacos","Tomatoes"],["Tesle","Golf","Corolla","Ford"],["Sunday","Monday","Wednesday","Thursday"],
                       ["Robert De Niro","Nicholas Cage","Mark Ruffalo","Patrick Stewart"],["Math","Biology","English","Gym"],["Canada","Iceland","Poland","Italy"],
                       ["4","3","2","1"],["12","11","10","9"],["7","6","5","4"],
                       ["Ottawa","Toronto","Vancouver","Montreal"],["Rome","Venice","Turin","Naples"],["Copenhaghen","Berlin","Amsterdam","Brussels"],
                       ["Hot","Cold","Wet","Liquid"],["Wet","Solid","Air","Oily"],["Cold","Hot","Liquid","Air"],
                       ["Italian","Japanese","Mexican","American"],["American","Mexican","Brazilian","Danish"],["French","Italian","German","Spanish"],
                       ["H2O","k","H","O"],["K","H","H2O","O"],["H","H20","K","O"],
                       ["A feeling","An object","An animal","A fish"],["An Instrument","A felling","A human","A fish"],["An animal","A Human","A feeling","A fish"]]
        ///////////////////////////////////////////
        
        let insert = "INSERT INTO Questions (id,question, rightAnswer, wrong1, wrong2, wrong3) VALUES(?, ?, ?, ?, ?, ?)"
        var stmt: OpaquePointer?
        let SQLITE_TRANSIENT = unsafeBitCast(OpaquePointer(bitPattern: -1), to: sqlite3_destructor_type.self)
        
        for i in 0...26{
            if sqlite3_prepare(db, insert,-1, &stmt, nil) != SQLITE_OK{
                let err = String(cString: sqlite3_errmsg(db))
                print("Error binding Question to database:\(err)")
                return
            }
            sqlite3_bind_int(stmt, 1, Int32(i))
            if sqlite3_bind_text(stmt, 2, questions[i], -1, SQLITE_TRANSIENT) != SQLITE_OK{
                let err = String(cString: sqlite3_errmsg(db))
                print("Error binding Question to database:\(err)")
                return
            }
            if sqlite3_bind_text(stmt, 3, answers[i][0], -1, SQLITE_TRANSIENT) != SQLITE_OK{
                let err = String(cString: sqlite3_errmsg(db))
                print("Error binding rightAnswer to database:\(err)")
                return
            }
            if sqlite3_bind_text(stmt, 4, answers[i][1], -1, SQLITE_TRANSIENT) != SQLITE_OK{
                let err = String(cString: sqlite3_errmsg(db))
                print("Error binding wrong1 to database:\(err)")
                return
            }
            if sqlite3_bind_text(stmt, 5, answers[i][2], -1, SQLITE_TRANSIENT) != SQLITE_OK{
                let err = String(cString: sqlite3_errmsg(db))
                print("Error binding wrong2 to database:\(err)")
                return
            }
            if sqlite3_bind_text(stmt, 6, answers[i][3], -1, SQLITE_TRANSIENT) != SQLITE_OK{
                let err = String(cString: sqlite3_errmsg(db))
                print("Error binding wrong3 to database:\(err)")
                return
            }
            if sqlite3_step(stmt) != SQLITE_DONE{
                let err = String(cString: sqlite3_errmsg(db))
                print("Error at insert Statement for Questions in database:\(err)")
                return
            }
        }
        print("Database Created!")
        
        
    }
    
    
}

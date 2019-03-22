//
//  LessonViewController.swift
//  GBC-Literacy_Uplift
//
//  Created by Maxim Paxton on 2019-03-14.
//  Copyright © 2019 Maxim Paxton. All rights reserved.
//

import Foundation
import UIKit

class LessonViewController: UIViewController {
    
    var msg:String!
    
    @IBOutlet weak var fromUnitInfo: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Lessons"
        
        if let m = msg{
            fromUnitInfo.text = m
        } else{
            fromUnitInfo.text = "empty"
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "lesson1"{
            let dst = segue.destination as! ActivityViewController
            dst.msg_unit = msg
            dst.msg_lesson = "lesson1"
        } else if segue.identifier == "lesson2"{
            let dst = segue.destination as! ActivityViewController
            dst.msg_unit = msg
            dst.msg_lesson = "lesson2"
        } else if segue.identifier == "lesson3"{
            let dst = segue.destination as! ActivityViewController
            dst.msg_unit = msg
            dst.msg_lesson = "lesson3"
        }
    }
    
    
}

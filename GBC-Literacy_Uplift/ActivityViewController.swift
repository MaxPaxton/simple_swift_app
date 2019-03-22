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

    @IBOutlet weak var fromLessonLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let m = msg_unit{
            fromLessonLabel.text = m
        } else{
            fromLessonLabel.text = "empty"
        }
        if let m = msg_lesson{
            fromLessonLabel.text = fromLessonLabel.text! + m
        } else{
            fromLessonLabel.text = fromLessonLabel.text! + "empty"
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

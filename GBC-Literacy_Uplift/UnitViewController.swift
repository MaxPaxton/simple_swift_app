//
//  UnitViewController.swift
//  GBC-Literacy_Uplift
//
//  Created by Maxim Paxton on 2019-03-14.
//  Copyright © 2019 Maxim Paxton. All rights reserved.
//

import Foundation
import UIKit

class UnitViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Units"
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "unit1"{
            let dst = segue.destination as! LessonViewController
            dst.msg = "unit1"
        } else if segue.identifier == "unit2"{
            let dst = segue.destination as! LessonViewController
            dst.msg = "unit2"
        } else if segue.identifier == "unit3"{
            let dst = segue.destination as! LessonViewController
            dst.msg = "unit3"
        }
    }
    
    
}

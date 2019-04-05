//
//  LogInController.swift
//  GBC-Literacy_Uplift
//
//  Created by Maxim Paxton on 2019-03-14.
//  Copyright © 2019 Maxim Paxton. All rights reserved.
//

import Foundation
import UIKit

class LogInController:UIViewController{
    
    @IBOutlet weak var userNameFiled: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "GBC-Literacy Uplift"
    }
    @IBAction func logInTap(_ sender: Any) {
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //passing data ahead for future database
        if segue.identifier == "main"{
            let dst = segue.destination as! ViewController
            dst.userName = userNameFiled.text
        }
    }
}

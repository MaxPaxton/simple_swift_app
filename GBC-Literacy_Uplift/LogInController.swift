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
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "GBC-Literacy Uplift"
    }
    @IBAction func logInTap(_ sender: Any) {
    }
}

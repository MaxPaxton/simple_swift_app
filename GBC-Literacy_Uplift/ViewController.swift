//
//  ViewController.swift
//  GBC-Literacy_Uplift
//
//  Created by Maxim Paxton on 2019-03-14.
//  Copyright © 2019 Maxim Paxton. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var userName:String!
    //var password:String?
    let logoImage = UIImage(named: "material")
    
    @IBOutlet weak var welcomeLbl: UILabel!
    
    @IBAction func logOutBtn(_ sender: Any) {
        self.navigationController?.pushViewController(self.storyboard?.instantiateViewController(withIdentifier: "LogInController") as! LogInController, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "GBC-Literacy Uplift"
        //Don't go back, must log out
        navigationItem.hidesBackButton = true


    }
    
    override func viewDidAppear(_ animated: Bool) {
        if userName == ""{
            userName = " Student"
        }
        if userName == nil {
            userName = " Student"
        }
        welcomeLbl.text = "Welcome "+userName
    }
    

}


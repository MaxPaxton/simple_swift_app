//
//  ScoreViewController.swift
//  GBC-Literacy_Uplift
//
//  Created by Maxim Paxton on 2019-03-22.
//  Copyright © 2019 Maxim Paxton. All rights reserved.
//

import UIKit

class ScoreViewController: UIViewController {
    
    var score:Int! = 0
    
    @IBAction func returnBtn(_ sender: Any) { self.navigationController?.pushViewController(self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController, animated: true)
    }
    
    @IBOutlet weak var scoreLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        
        if let s = score{
            scoreLbl.text = scoreLbl.text! + String(s)
        } else{
            scoreLbl.text = "empty"
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

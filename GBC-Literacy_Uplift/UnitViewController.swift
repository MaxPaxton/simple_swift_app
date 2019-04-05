//
//  UnitViewController.swift
//  GBC-Literacy_Uplift
//
//  Created by Maxim Paxton on 2019-03-14.
//  Copyright © 2019 Maxim Paxton. All rights reserved.
//

import Foundation
import UIKit
import SQLite3

class UnitViewController: UIViewController {
    
    //Db object reference
    var db: OpaquePointer?
    var units = [Unit]()
    
    func readValues(){
        units.removeAll()
        let q = "SELECT * FROM Units"
        var stmt: OpaquePointer?
        if sqlite3_prepare(db, q,-1, &stmt, nil) != SQLITE_OK{
            let err = String(cString: sqlite3_errmsg(db))
            print("Error preparing stm for Units in databse:\(err)")
            return
        }
        while sqlite3_step(stmt) == SQLITE_ROW {
            let id = Int(sqlite3_column_int(stmt, 0))
            let name  = String(cString: sqlite3_column_text(stmt, 1))
            let u = Unit(id: id,name: name)
            units.append(u)
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Units"
        
        //Db File Creation
        let file = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent("databse.db")
        if sqlite3_open(file.path, &db) != SQLITE_OK{
            print("Error opening Databse")
        } else {
            let create = "CREATE TABLE IF NOT EXISTS Units (id INTEGER PRIMARY KEY AUTOINCREMENT , name TEXT )"
            if sqlite3_exec(db,create,nil,nil,nil) != SQLITE_OK{
                let err = String(cString: sqlite3_errmsg(db))
                print("Error creating databse:\(err)")
            }
        }
        addUnits()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //passing data ahead for future database
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
    
    func addUnits(){
        let insert = "INSERT INTO Units (name) VALUES(?)"
        var stmt: OpaquePointer?
        
        for i in 1...3{
            if sqlite3_prepare(db, insert,-1, &stmt, nil) != SQLITE_OK{
                let err = String(cString: sqlite3_errmsg(db))
                print("Error preparing stm for Units in databse:\(err)")
                return
            }
            if sqlite3_bind_text(stmt, 1, "Unit\(i)", -1, nil) != SQLITE_OK{
                let err = String(cString: sqlite3_errmsg(db))
                print("Error inserting Units in databse:\(err)")
                return
            }
            if sqlite3_step(stmt) != SQLITE_DONE{
                let err = String(cString: sqlite3_errmsg(db))
                print("Error at insert Statement for Units in databse:\(err)")
                return
            }
        }
        
    
    }
    
    
}

//
//  ViewController.swift
//  Alert App Draft 2
//
//  Created by Jade Meyer on 9/1/18.
//  Copyright © 2018 Jade Meyer. All rights reserved.
//

import UIKit

class LogInPage: UIViewController {
    
    
    @IBOutlet weak var phoneNumberTxtFld: UITextField!
    
    @IBOutlet weak var passwordTxtFld: UITextField!
    
    @IBOutlet weak var logInBtn: UIButton!
    
    @IBOutlet weak var incorrectLbl: UILabel!
    
    @IBAction func logInBtnPressed(_ sender: Any) {
        if (phoneNumberTxtFld.text == "9179528274" && passwordTxtFld.text == "jadespwd") || (phoneNumberTxtFld.text == "9292686310" && passwordTxtFld.text == "annaspwd") || (phoneNumberTxtFld.text == "9176352382" && passwordTxtFld.text == "catherinespwd") {
            incorrectLbl.isHidden = true
            self.performSegue(withIdentifier: "logInSegue", sender: self)
        } else {
            incorrectLbl.isHidden = false
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

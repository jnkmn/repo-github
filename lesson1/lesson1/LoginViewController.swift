//
//  LoginViewController.swift
//  lesson1
//
//  Created by Mstan on 03.03.2021.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var loginField:
        UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func onButtonTapped(_ sender: Any) {
        if loginField.text == "admin",
           passwordField.text == "123456" {
            print("pas correct")
        } else {
            print("no user found")
        }
        print("Button tapped")
    }
    
}

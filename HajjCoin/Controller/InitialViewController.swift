//
//  InitialViewController.swift
//  HajjCoin
//
//  Created by Anfal Alatawi on 20/11/1439 AH.
//  Copyright © 1439 Anfal Alatawi. All rights reserved.
//

import UIKit
import Firebase
import Alamofire
import AlamofireImage
//import SVProgressHUD

class InitialViewController: UIViewController {
    
    @IBOutlet weak var passwordLabel: UITextField!
    @IBOutlet weak var phoneNumberLabel: UITextField!
    var ref:DatabaseReference?

    @IBAction func signUpButton(_ sender: UIButton) {
        signUp()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround() 
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func signUp()
    {
        guard let phone = phoneNumberLabel.text else {return}
        guard let password = phoneNumberLabel.text else {return}
        var name : String = "testName"

        Auth.auth().createUser(withEmail: phone, password: password) { (user, error) in
            if error == nil && user != nil{
                print("User Created")
            }
            else{
                print("Error creating user: \(error?.localizedDescription)")
            }
            
            guard let uid = user?.user.uid else {
                return
            }
            
            let usersReference = self.ref?.child("user").child("haaj").child(uid)
            let values = ["phone": phone, "name" : name ] as [String : Any]
            
        }
    }
}

// Put this piece of code anywhere you like
extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

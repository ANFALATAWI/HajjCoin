//
//  QRViewController.swift
//  HajjCoin
//
//  Created by Anfal Alatawi on 19/11/1439 AH.
//  Copyright © 1439 Anfal Alatawi. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class QRViewController: UIViewController {

    @IBOutlet weak var qrImage: UIImageView!
    @IBAction func cancelButton(_ sender: UIButton)
    {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let userID = Auth.auth().currentUser?.uid
        
        print("&&&&&&&& USER ID: \(userID!)")
        
        ref.child("user").child("haaj").child(userID!).observeSingleEvent(of: .value, with: { (snapshot) in
            var value = snapshot.value as? [String : Any]
            //Anfal's added code: (for picture viewing:)
            
            //get image url
            let url = value!["QRCode"] as? String
            print("Got image url.")
            
            // Create a reference to the file you want to download
            let storageRef = Storage.storage()
            let httpsReference = storageRef.reference(forURL: url!)
            print("Got Image ref.")
            
            // Download in memory with a maximum allowed size of 1MB (1 * 1024 * 1024 bytes)
            httpsReference.getData(maxSize: 1 * 1024 * 1024) { data, error in
                if let error = error {
                    print("Error! no image!!")
                    // Uh-oh, an error occurred!
                } else {
                    // Data for "images/island.jpg" is returned
                    let image = UIImage(data: data!)
                    print("Entered without error and got image.")
                    self.qrImage.image = image
                    print("Displayed image.")
                }
            }
        })
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

//
//  ScrollViewController.swift
//  HajjCoin
//
//  Created by Anfal Alatawi on 19/11/1439 AH.
//  Copyright © 1439 Anfal Alatawi. All rights reserved.
//

import UIKit

class ScrollViewController: UIViewController {

    @IBOutlet weak var scrollObject: UIScrollView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        HorizontalScrollView()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func  HorizontalScrollView()
    {
        print("Loaded*****************")
        
        var v1 : MainViewController
        var v2 : ProfileViewController
        var v3 : MapViewController
        
        let profile = self.storyboard?.instantiateViewController(withIdentifier: "profile") as! ProfileViewController
        self.addChildViewController(profile)
        self.scrollObject.addSubview(profile.view)
        self.didMove(toParentViewController: self)
        
        let map = self.storyboard?.instantiateViewController(withIdentifier: "map") as! ViewController
        self.addChildViewController(map)
        self.scrollObject.addSubview(map.view)
        self.didMove(toParentViewController: self)
        
        let main = self.storyboard?.instantiateViewController(withIdentifier: "main") as! MainViewController
        self.addChildViewController(main)
        self.scrollObject.addSubview(main.view)
        self.didMove(toParentViewController: self)
        
        
        var profileFrame : CGRect = profile.view.frame
        profileFrame.origin.x =  self.view.frame.width
        profile.view.frame = profileFrame
        
        var mainFrame : CGRect = main.view.frame
        mainFrame.origin.x =  2 * self.view.frame.width
        main.view.frame = mainFrame
        
        self.scrollObject.contentSize = CGSize(width: (self.view.frame.width) * 3 , height: self.view.frame.height)
        
        self.scrollObject.contentOffset.x = profile.view.frame.origin.x
        
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

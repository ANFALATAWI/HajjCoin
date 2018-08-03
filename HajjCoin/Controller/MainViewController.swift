//
//  MainViewController.swift
//  HajjCoin
//
//  Created by Anfal Alatawi on 19/11/1439 AH.
//  Copyright © 1439 Anfal Alatawi. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBAction func buyButton(_ sender: Any) {
        let alert = UIAlertController(title: "كفارة", message: "الهدي هو ما يذبح من الانعام تقربا لله عز وجل. ويجب في حق المتمتع والقارن أو في حال ارتكاب محضور او ترك واجب. يتم تنفيد الهدي وفق فتاوى شرعية من دار الإفتاء ومرخصه للأداء النسك بالنيابة. ويتم ذبحها بين صلاة العيد وثالث أيام التشريق ويتم توزيعها على فقراء مكة. سيتم خصم مبلغ 480 ريال سعودي من حسابك ويتم ارسال رسالة تأكيد نصية الى رقمك، ورسالة تأكيد أخرى بعد تنفيذ الهدي.", preferredStyle: UIAlertControllerStyle.alert)
        
        //creat a ui action
        
        let action = UIAlertAction(title: "تأكيد", style: .default)
        let cancelAction = UIAlertAction(title: "إلغاء", style: UIAlertActionStyle.cancel, handler: nil)
        alert.addAction(action)
        alert.addAction(cancelAction)
        
        present(alert, animated: true, completion: nil)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
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

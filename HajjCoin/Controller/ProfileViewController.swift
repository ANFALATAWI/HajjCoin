//
//  ProfileViewController.swift
//  HajjCoin
//
//  Created by Anfal Alatawi on 19/11/1439 AH.
//  Copyright © 1439 Anfal Alatawi. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController, UITableViewDelegate, UITableViewDataSource
{
    @IBOutlet weak var historyTable: UITableView!
    
    @IBOutlet weak var balanceLabel: UILabel!
    let list = ["Starbucks", "AlDanube", "Albaik"]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! HistoryTableViewCell
        
        cell.shopNameLabel.text = list[indexPath.row]
        
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        historyTable.delegate = self
        historyTable.dataSource = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}

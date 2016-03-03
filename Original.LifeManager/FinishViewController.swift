//
//  FinishViewController.swift
//  Original.LifeManager
//
//  Created by Aoi Sakaue on 2016/02/25.
//  Copyright © 2016年 Aoi Sakaue. All rights reserved.
//

import UIKit

class FinishViewController: UIViewController {
    
    let saveData = NSUserDefaults.standardUserDefaults()
    
    
    @IBOutlet var todolabel1 : UILabel!
    @IBOutlet var todolabel2 : UILabel!
    @IBOutlet var todolabel3 : UILabel!
    @IBOutlet var todolabel4 : UILabel!
    @IBOutlet var todolabel5 : UILabel!
    @IBOutlet var todolabel6 : UILabel!
    @IBOutlet var todolabel7 : UILabel!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        todolabel1.text = ""
        todolabel2.text = ""
        todolabel3.text = ""
        todolabel4.text = ""
        todolabel5.text = ""
        todolabel6.text = ""
        todolabel7.text = ""
        
            
//    self.presentViewController(alert, animated: true, completion:nil)
//    ToDoTextField.text = ""
}
}
//
//  AddViewController.swift
//  Original.LifeManager
//
//  Created by Aoi Sakaue on 2016/02/25.
//  Copyright © 2016年 Aoi Sakaue. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {
    
    @IBOutlet var ToDoTextField: UITextField!
    @IBOutlet var MemoTextField: UITextField!
    
    var wordArray: [AnyObject] = []
    let saveData = NSUserDefaults.standardUserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        if saveData.arrayForKey("WORD") != nil {
            wordArray = saveData.arrayForKey("WORD")!
        }
    }
    
    
    @IBAction func saveWord() {
        let wordDictionary = ["ToDo":ToDoTextField.text!,"Memo":MemoTextField.text!]
        
        wordArray.append(wordDictionary)
        
        saveData.setObject(wordArray, forKey: "WORD")
        
        let alert = UIAlertController(
            title: "保存完了",
            message: "保存が完了しました",
            preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(
            UIAlertAction(
                title: "OK",
                style: UIAlertActionStyle.Default,
                handler:nil
            )
        )
        self.presentViewController(alert, animated: true, completion:nil)
        ToDoTextField.text = ""
        MemoTextField.text = ""
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    

}

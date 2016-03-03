//
//  AddViewController.swift
//  Original.LifeManager
//
//  Created by Aoi Sakaue on 2016/02/25.
//  Copyright © 2016年 Aoi Sakaue. All rights reserved.
//

import UIKit
//ToDoリストに項目を追加する画面
class AddViewController: UIViewController {
    
    @IBOutlet var ToDoTextField: UITextField!
    @IBOutlet var MemoTextField: UITextField!
    @IBOutlet var DateTextField: UITextField!
    
    @IBOutlet var DatePicker : UIDatePicker!
    
    var wordArray: [AnyObject] = []
    let saveData = NSUserDefaults.standardUserDefaults()
    
    var toolBar:UIToolbar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        if saveData.arrayForKey("WORD") != nil {
            wordArray = saveData.arrayForKey("WORD")!
        }
        
        //datepicker上のtoolbarのdoneボタン
        toolBar = UIToolbar()
        toolBar.sizeToFit()
        let toolBarButton = UIBarButtonItem(title: "完了", style: .Plain, target: self, action: "doneButton")
        toolBar.items = [toolBarButton]
        DateTextField.inputAccessoryView = toolBar
        ToDoTextField.inputAccessoryView = toolBar
        MemoTextField.inputAccessoryView = toolBar
        

    }
    

    @IBAction func saveWord() {
        let wordDictionary = ["ToDo":ToDoTextField.text!,"Memo":MemoTextField.text!,"Date":DateTextField.text!]
        
        wordArray.append(wordDictionary)
        
        saveData.setObject(wordArray, forKey: "WORD")
        
        //予定を保存した時にアラートを表示
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
        DateTextField.text = ""
    }

class UIDatePickerTextField: UITextField {
        
        override  func awakeFromNib() {
            NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("handleFocused:"), name: UITextFieldTextDidBeginEditingNotification, object: nil)
        }
        
        func handleFocused(notification: NSNotification!) {
            var datePickerView  : UIDatePicker = UIDatePicker()
            datePickerView.datePickerMode = UIDatePickerMode.Date
            self.inputView = datePickerView
            datePickerView.addTarget(self, action: Selector("handleDatePicker:"), forControlEvents: UIControlEvents.ValueChanged)
        }
        
         func handleDatePicker(sender: UIDatePicker) {
            var dateFormatter = NSDateFormatter()
            dateFormatter.dateFormat = "yyyy/MM/dd"
            super.text = dateFormatter.stringFromDate(sender.date)
        }
    }
    //テキストフィールドが選択されたらdatepickerを表示
    @IBAction func textFieldEditing(sender: UITextField) {
        
        let datePickerView:UIDatePicker = UIDatePicker()
        datePickerView.datePickerMode = UIDatePickerMode.Date
        sender.inputView = datePickerView
        datePickerView.addTarget(self, action: Selector("datePickerValueChanged:"), forControlEvents: UIControlEvents.ValueChanged)
    }
    
    //datepickerが選択されたらtextfieldに表示
    func datePickerValueChanged(sender:UIDatePicker) {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat  = "yyyy/MM/dd";
        DateTextField.text = dateFormatter.stringFromDate(sender.date)
    }
    
    //toolbarのdoneボタン
    @IBAction func doneButton(){
        DateTextField.resignFirstResponder()
        ToDoTextField.resignFirstResponder()
        MemoTextField.resignFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func DismissKeyboard(){
        
        if ToDoTextField != nil{
            MemoTextField()
        }
        view.endEditing(true)
    }


    
    

}

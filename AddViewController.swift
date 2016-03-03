//
//  AddViewController.swift
//  Original.LifeManager
//
//  Created by Aoi Sakaue on 2016/02/25.
//  Copyright © 2016年 Aoi Sakaue. All rights reserved.
//

import UIKit
//ToDoリストに項目を追加する画面
class AddViewController: UIViewController,UITextFieldDelegate  {
    
    @IBOutlet var ToDoTextField: UITextField!
    @IBOutlet var MemoTextField: UITextField!
//    @IBOutlet var DateTextField: UITextField!
    
    @IBOutlet var DatePicker: UIDatePicker!
    
    @IBOutlet weak var DateTextField: UITextField!
    
    var wordArray: [AnyObject] = []
    let saveData = NSUserDefaults.standardUserDefaults()
    
    let nowDate = NSDate()
    let dateFormat = NSDateFormatter()
    let inputDatePicker = UIDatePicker()
    
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
        
        
        //画面タップでキーボードを隠す
        let singleTap = UITapGestureRecognizer(target: self, action: "onTap:");
        singleTap.numberOfTapsRequired = 1;
        view.addGestureRecognizer(singleTap);
        
        //日付フィールドの設定
        dateFormat.dateFormat = "yyyy年MM月dd日"
        DateTextField.text = dateFormat.stringFromDate(nowDate)
        self.DateTextField.delegate = self
        
        
        // DatePickerの設定(日付用)
        inputDatePicker.datePickerMode = UIDatePickerMode.Date
        DateTextField.inputView = inputDatePicker
        
        // キーボードに表示するツールバーの表示
        let ToolBar = UIToolbar(frame: CGRectMake(0, self.view.frame.size.height/6, self.view.frame.size.width, 40.0))
        ToolBar.layer.position = CGPoint(x: self.view.frame.size.width/2, y: self.view.frame.size.height-20.0)
        ToolBar.barStyle = UIBarStyle.BlackOpaque
        ToolBar.tintColor = UIColor.whiteColor()
        ToolBar.backgroundColor = UIColor.yellowColor()
        
        //ボタンの設定
        //右寄せのためのスペース設定
        let spaceBarButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.FlexibleSpace,target: self,action: "")
        
        //完了ボタンを設定
        let toolBarBtn = UIBarButtonItem(title: "完了", style: .Done, target: self, action: "toolBarBtnPush:")
        
        //ツールバーにボタンを表示
        ToolBar.items = [spaceBarButton,toolBarButton]
        DateTextField.inputAccessoryView = ToolBar

    }
    
    func onTap (recognizer:UIPanGestureRecognizer){
        ToDoTextField.resignFirstResponder();
        MemoTextField.resignFirstResponder();
        DateTextField.resignFirstResponder();

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

//class UIDatePickerTextField: UITextField {
//        
//        override  func awakeFromNib() {
//            NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("handleFocused:"), name: UITextFieldTextDidBeginEditingNotification, object: nil)
//        }
//        
//        func handleFocused(notification: NSNotification!) {
//            var datePickerView  : UIDatePicker = UIDatePicker()
//            datePickerView.datePickerMode = UIDatePickerMode.Date
//            self.inputView = datePickerView
//            datePickerView.addTarget(self, action: Selector("handleDatePicker:"), forControlEvents: UIControlEvents.ValueChanged)
//        }
//        
//         func handleDatePicker(sender: UIDatePicker) {
//            var dateFormatter = NSDateFormatter()
//            dateFormatter.dateFormat = "yyyy/MM/dd"
//            super.text = dateFormatter.stringFromDate(sender.date)
//        }
//    }
//    //テキストフィールドが選択されたらdatepickerを表示
//    @IBAction func textFieldEditing(sender: UITextField) {
//        
//        let datePickerView:UIDatePicker = UIDatePicker()
//        datePickerView.datePickerMode = UIDatePickerMode.Date
//        sender.inputView = datePickerView
//        datePickerView.addTarget(self, action: Selector("datePickerValueChanged:"), forControlEvents: UIControlEvents.ValueChanged)
//    }
//    
//    //datepickerが選択されたらtextfieldに表示
//    func datePickerValueChanged(sender:UIDatePicker) {
//        let dateFormatter = NSDateFormatter()
//        dateFormatter.dateFormat  = "yyyy/MM/dd";
//        DateTextField.text = dateFormatter.stringFromDate(sender.date)
//    }
//    
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
    
    
    //完了を押すとピッカーの値を、テキストフィールドに挿入して、ピッカーを閉じる
    func toolBarBtnPush(sender: UIBarButtonItem){
        
        var pickerDate = inputDatePicker.date
        DateTextField.text = dateFormat.stringFromDate(pickerDate)
        
        self.view.endEditing(true)
    }
    

    
    
}
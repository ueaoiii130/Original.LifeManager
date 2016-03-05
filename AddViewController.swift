//
//  AddViewController.swift
//  Original.LifeManager
//
//  Created by Aoi Sakaue on 2016/02/25.
//  Copyright © 2016年 Aoi Sakaue. All rights reserved.
//

import UIKit
//ToDoリストに項目を追加する画面//再編集のとこ以外はOK
class AddViewController: UIViewController,UITextFieldDelegate  {
    
    
//使うものたち宣言
    @IBOutlet var ToDoTextField: UITextField!
//    var task: ToDo? = nil
    @IBOutlet var MemoTextField: UITextField!
    
    @IBOutlet var DateTextField: UITextField!
    
    @IBOutlet var DatePicker: UIDatePicker!

    
   
//配列から取り出すための
    var wordArray: [AnyObject] = []
    let saveData = NSUserDefaults.standardUserDefaults()
    
//現在の日付取得
    let nowDate = NSDate()
    let dateFormat = NSDateFormatter()
    let inputDatePicker = UIDatePicker()
    
    
    
    var toolBar:UIToolbar!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view
        
        //取り出すための
        if saveData.arrayForKey("WORD") != nil {
            wordArray = saveData.arrayForKey("WORD")!
        }
        
        
//後から編集できるように、、、
//        if let taskToDo = task {
//            ToDoTextField.text = taskToDo.item
//        }
        
        
        //toolbarのdoneボタン
        toolBar = UIToolbar()
        toolBar.sizeToFit()
        let toolBarButton = UIBarButtonItem(title: "OK", style: .Plain, target: self, action: "doneButton")
        toolBar.items = [toolBarButton]
        //キーボード、ぴっかーについてくるための
        DateTextField.inputAccessoryView = toolBar
        ToDoTextField.inputAccessoryView = toolBar
        MemoTextField.inputAccessoryView = toolBar
        
        
        //画面タップでキーボードを隠すための
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
        
        // キーボードに表示するツールバーの表示、色とか
        let ToolBar = UIToolbar(frame: CGRectMake(0, self.view.frame.size.height/6, self.view.frame.size.width, 40.0))
        ToolBar.layer.position = CGPoint(x: self.view.frame.size.width/2, y: self.view.frame.size.height-20.0)
        ToolBar.barStyle = UIBarStyle.BlackOpaque
        ToolBar.tintColor = UIColor.whiteColor()
        ToolBar.backgroundColor = UIColor.yellowColor()
        
        //ボタンの設定
        //右寄せのためのスペース設定
        let spaceBarButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.FlexibleSpace,target: self,action: "")
        
        //完了ボタンを設定
        _ = UIBarButtonItem(title: "完了", style: .Done, target: self, action: "toolBarBtnPush:")
        
        //ツールバーにボタンを表示
        ToolBar.items = [spaceBarButton,toolBarButton]
        DateTextField.inputAccessoryView = ToolBar

    }
    //タップで隠すための
    func onTap (recognizer:UIPanGestureRecognizer){
        ToDoTextField.resignFirstResponder();
        MemoTextField.resignFirstResponder();
        DateTextField.resignFirstResponder();

    }
    
//再編集できるようにするための
//    @IBAction func save(sender: UIBarButtonItem) {
//        if task != nil {
//            editTask()
//        } else {
//            createTask()
//        }
//        navigationController!.popViewControllerAnimated(true)
//    }
//    
//    func createTask() {
//        let newTask: Todo = Todo.MR_createEntity() as! Todo
//        newTask.item = todoField.text
//        newTask.managedObjectContext!.MR_saveToPersistentStoreAndWait()
//    }
//    
//    func editTask() {
//        task?.item = todoTextField.text
//        task?.managedObjectContext!.MR_saveToPersistentStoreAndWait()
//    }

    @IBAction func saveWord() {
        let wordDictionary = ["todo":ToDoTextField.text!,"memo":MemoTextField.text!,"date":DateTextField.text!]
        
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

    //toolbarのdoneボタン
    func doneButton(){
        DateTextField.resignFirstResponder()
        ToDoTextField.resignFirstResponder()
        MemoTextField.resignFirstResponder()
        toolBarBtnPush()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //完了を押すとピッカーの値を、テキストフィールドに挿入して、ピッカーを閉じる
    func toolBarBtnPush(){
        
        let pickerDate = inputDatePicker.date
        DateTextField.text = dateFormat.stringFromDate(pickerDate)
        
        self.view.endEditing(true)
    }
    

    
    
}
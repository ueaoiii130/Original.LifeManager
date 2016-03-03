//
//  ToDoTableViewController.swift
//  Original.LifeManager
//
//  Created by Aoi Sakaue on 2016/02/21.
//  Copyright © 2016年 Aoi Sakaue. All rights reserved.
//

import UIKit
import CTCheckbox

//ToDoリストの画面
class ToDoTableViewController: UITableViewController {
    
    var wordArray: [AnyObject] = []
    let saveData = NSUserDefaults.standardUserDefaults()
    
    
    //    @IBOutlet var plusButton: UIButton!
    //    @IBOutlet var backButton: UIButton!
    //    @IBOutlet var doButton: UIButton!
    
    var checkbox = CTCheckbox()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        //TableViewCellを使えるようにする
        tableView.registerNib(UINib(nibName: "TableViewCell", bundle:nil), forCellReuseIdentifier: "todoCell")
        
        // 編集ボタンを右上に配置
        navigationItem.rightBarButtonItem = editButtonItem()
        
//        let modoru = UIBarButtonItem(title: "back", style: UIBarButtonItemStyle.Plain,target:self, action: "addTapped")
//        navigationItem.setLeftBarButtonItem(modoru, animated: true)
        
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    //セクションの数を設定する
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    //セルの個数を指定する
    override func tableView(tableView: UITableView, numberOfRowsInSection section:Int) -> Int {
        return wordArray.count
    }
    
    //    テーブルセルにデータをセットします
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("todoCell", forIndexPath: indexPath) as! TableViewCell
        
        ////        後でif文挿入
        
        //        if todoLabel != nil {
        //            self.addSubView(todo!)
        //        }
        //        if indexPath != nil {
        //            wordarray.removeAtIndex(index!)
        //        }
        
        //        if memoTextField.text != "" && todoTextField.text != "" {
        //
        //            let wordDictionary =
        //            ["Memo": MemoTextField.text!,"Todo":ToDoTextField.text!]
        //            wordArray.append(wordDictionary)
        //            saveData.setObject(wordArray, forKey: "WORD")
        //
        //        }
        cell.ToDoLabel?.text = String(wordArray[indexPath.row]["ToDo"] as! String)
        cell.MemoLabel?.text = String(wordArray[indexPath.row]["Memo"] as! String)
//        cell.DateLabel?.text = String(wordArray[indexPath.row]["Date"] as! String)

        
        
        
        
        
        cell.checkbox.tag = indexPath.row
        cell.checkbox.addTarget(self, action: "checked:", forControlEvents: .ValueChanged)
        cell.setData()
        return cell
    }
    
    
    //セル削除ボタン
    override func tableView(tableView: UITableView, editingStyleForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCellEditingStyle {
        return UITableViewCellEditingStyle.Delete
    }
    
    //deleteボタンが押された時の処理
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        wordArray.removeAtIndex(indexPath.row)
        tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Fade)
        //wordArrayの保存を行う
        saveData.setObject(wordArray, forKey: "WORD")
        
    }
//編集ボタンを出す
    override func setEditing(editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        tableView.editing = editing
    }
//移動可能に
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
//移動後の処理
    override func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath) {
        let todoCell = wordArray[sourceIndexPath.row]
       
            wordArray.removeAtIndex(sourceIndexPath.row)
            wordArray.insert(todoCell, atIndex: destinationIndexPath.row)
        
    }

    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        if saveData.arrayForKey("WORD") != nil {
            wordArray = saveData.arrayForKey("WORD")!
        }
        tableView.reloadData()
    }
       
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    //    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    //        // #warning Incomplete implementation, return the number of sections
    //        return 0
    //    }
    
    //    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    //        // #warning Incomplete implementation, return the number of rows
    //        return 0
    //    }
    
    
    //ボタンを押した時の移動
    @IBAction func plusButton(seque: UIStoryboardSegue) {
        
    }
    
    @IBAction func backButton(){
        navigationController?.popToRootViewControllerAnimated(true)
    }
    
    @IBAction func doButton(seque: UIStoryboardSegue) {
        
    }
//スワイプ
   /* @IBAction func swipeSegue(sender: UISwipeGestureRecognizer) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }*/
    
//    @IBAction func swipePrepareSegue(sender: UISwipeGestureRecognizer) {
//        prepareForSegue(<#T##segue: UIStoryboardSegue##UIStoryboardSegue#>, sender: nil)
//    }

    
    //チェックボックス挑戦！
    // テーブルビュー
    //        var tableView: UITableView!
    
    // テーブルデータ
    //        var tableData = [
    //            "データ1",
    //            "データ2",
    //            "データ3",
    //            "データ4",
    //            "データ5",
    //        ]
    // 選択中のセル
    //        var selected = [
    //    for (var index = numberOfRowsInSection section:Int) -> Int {
    ////            println("\(name)です。")
    //
    //    ]
    //    }
    
    
    //        override func viewDidLoad() {
    //            super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    let barHeight: CGFloat = UIApplication.sharedApplication().statusBarFrame.size.height
    
    //            let displayWidth = self.view.frame.width
    //            let displayHeight = self.view.frame.height
    
    //            tableView = UITableView(frame: CGRect(x:0, y:barHeight, width:displayWidth, height:displayHeight - barHeight))
    //
    //            tableView.registerClass(CustomTableViewCell.self, forCellReuseIdentifier: "todoCell")
    
    
    //
    // ⭐️ここがポイント　セルの選択状態を保持します
    //    for in文で配列の数だけチェックボックス表示
    func checked(sender:CTCheckbox) {
        var selected: [Bool] = []
        for i in 0 ..< wordArray.count {
            selected.append(false)
        }
        
        selected[sender.tag] = sender.checked
    }
    
    
    class CustomTableViewCell: UITableViewCell{
        var checkbox = CTCheckbox()
        
        func setData() -> Void {
            ////             ⭐️ここもポイント　チェックボックスを追加します
            checkbox.frame = CGRectMake(self.frame.width - 44, 0, 22, self.frame.height)
            checkbox.checkboxColor = UIColor.blackColor()
            checkbox.checkboxSideLength = 22
            self.addSubview(checkbox)
        }
    }
     func ToDotableView(table: UITableView, didSelectRowAtIndexPath indexPath:NSIndexPath) {
    }
    
    
}
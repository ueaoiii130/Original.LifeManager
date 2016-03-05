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
    
//再編集のための
//    var todoEntities: [todo]!
    
    //    @IBOutlet var plusButton: UIButton!
    //    @IBOutlet var backButton: UIButton!
    //    @IBOutlet var doButton: UIButton!
    
    var checkbox = CTCheckbox()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//再？        todoEntities = todo.MR_findAll() as? [todo]
        
        tableView.delegate = self
        tableView.dataSource = self
        
        //TableViewCellを使えるようにする
        tableView.registerNib(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "todoCell")
        
        // 編集ボタンを右上に配置
        navigationItem.rightBarButtonItem = editButtonItem()
        
        if saveData.arrayForKey("WORD") != nil {
            wordArray = saveData.arrayForKey("WORD")!
            print(wordArray)
        }
        
        tableView.reloadData()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
    }
//移動後
        override func viewWillAppear(animated: Bool) {
            super.viewWillAppear(animated)
            if saveData.arrayForKey("WORD") != nil {
                wordArray = saveData.arrayForKey("WORD")!
    
            }
    
            tableView.reloadData()
        }

    //セクションの数を決める
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    //セルの個数を決める
    override func tableView(tableView: UITableView, numberOfRowsInSection section:Int) -> Int {
        return wordArray.count
    }
    
    //テーブルセルにデータをセットする
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("todoCell", forIndexPath: indexPath) as! TableViewCell

//WordList見て直し
        let nowIndexPathDictionary: (AnyObject) =  wordArray[indexPath.row]
        
        cell.ToDoLabel.text = nowIndexPathDictionary["todo"] as? String
        cell.MemoLabel.text = nowIndexPathDictionary["memo"] as? String
        cell.DateLabel.text = nowIndexPathDictionary["date"] as? String
        
//もともと
//        cell.ToDoLabel?.text = String(wordArray[indexPath.row]["ToDo"])
//        cell.MemoLabel?.text = String(wordArray[indexPath.row]["Memo"])
//        cell.DateLabel?.text = String(wordArray[indexPath.row]["Date"])

        //チェックボックスのタグ
        cell.checkbox.tag = indexPath.row
        cell.checkbox.addTarget(self, action: "checked:", forControlEvents: .ValueChanged)
        cell.setData()
        return cell
    }
    
    
    //再編集のための遷移//////できれば！！！
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        if segue.identifier == "edit" {
//            let todoController = segue.destinationViewController as! AddViewController
//            let task = todoEntities[tableView.indexPathForSelectedRow()!.row]
//            todoController.task = task
//        }
//    }

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
    //セル移動可能に
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    //セル移動後の処理
    override func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath) {
        let todoCell = wordArray[sourceIndexPath.row]
       
            wordArray.removeAtIndex(sourceIndexPath.row)
            wordArray.insert(todoCell, atIndex: destinationIndexPath.row)
        
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

    
    let barHeight: CGFloat = UIApplication.sharedApplication().statusBarFrame.size.height
    
    //            let displayWidth = self.view.frame.width
    //            let displayHeight = self.view.frame.height
    
    //            tableView = UITableView(frame: CGRect(x:0, y:barHeight, width:displayWidth, height:displayHeight - barHeight))
    //
    //            tableView.registerClass(CustomTableViewCell.self, forCellReuseIdentifier: "todoCell")
    
    
    //
    // セルの選択状態を保持します
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
            ////チェックボックスを追加します
            checkbox.frame = CGRectMake(self.frame.width - 44, 0, 22, self.frame.height)
            checkbox.checkboxColor = UIColor.blackColor()
            checkbox.checkboxSideLength = 22
            self.addSubview(checkbox)
        }
    }
    
    func ToDotableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("todoCell", forIndexPath: indexPath)
        if indexPath.row == 0 {
            cell.textLabel!.text = "０行目"
        }else if indexPath.row == 1 {
            cell.textLabel!.text = "１行目"
        }else if indexPath.row == 2 {
            cell.textLabel!.text = "２行目"
        }else if indexPath.row == 3 {
            cell.textLabel!.text = "3行目"
        }else if indexPath.row == 4 {
            cell.textLabel!.text = "4行目"
        }else if indexPath.row == 5 {
            cell.textLabel!.text = "5行目"
        }else if indexPath.row == 6 {
            cell.textLabel!.text = "6行目"
        }else if indexPath.row == 7 {
            cell.textLabel!.text = "7行目"
        }
        return cell
    }
    func ToDotableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.row == 0 {//0行目
            performSegueWithIdentifier("zeroSegue", sender: indexPath.row)
        }else if indexPath.row == 1 {//1行目
            performSegueWithIdentifier("firstSegue", sender: indexPath.row)
        }else if indexPath.row == 2 {//2行目
            performSegueWithIdentifier("secondSegue", sender: indexPath.row)
        }
    }

//    //各セルの要素を設定する
//    func ToDotableView(table: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//        
//        // tableCell の ID で UITableViewCell のインスタンスを生成
////        let cell = table.dequeueReusableCellWithIdentifier("todoCell", forIndexPath: indexPath)
//        
//        todolabel.text = String(wordArray[indexPath.row]["todo"] as! String)
//
//        // Tag番号 1 で UIImageView インスタンスの生成
//        let imageView = table.viewWithTag(1) as! UIImageView
//        
//        
//        // Tag番号 ２ で UILabel インスタンスの生成
//        let label1 = table.viewWithTag(2) as! UILabel
//        label1.text = "No.\(indexPath.row + 1)"
//        
//        // Tag番号 ３ で UILabel インスタンスの生成
//        let label2 = table.viewWithTag(3) as! UILabel
//        label2.text = "\(label2Array[indexPath.row])"
//        
//        
//        return cell
//    }
    
//    // Cell が選択された場合
//    func ToDotableView(table: UITableView, didSelectRowAtIndexPath indexPath:NSIndexPath) {
//        // [indexPath.row] から画像名を探し、UImage を設定
////        selectedImage = UIImage(named:"\(imgArray[indexPath.row])")
////        if selectedImage != nil {
//            // SubViewController へ遷移するために Segue を呼び出す
//            performSegueWithIdentifier("toSubViewController",sender: nil)
//        }
//        
//    }
    
}

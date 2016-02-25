//
//  ToDoTableViewController.swift
//  Original.LifeManager
//
//  Created by Aoi Sakaue on 2016/02/21.
//  Copyright © 2016年 Aoi Sakaue. All rights reserved.
//

import UIKit
import CTCheckbox

//class ToDoTableViewController: UITableViewController , UITableViewDataSource , UITableViewDelegate{
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
        cell.textLabel?.text = tableData[indexPath.row]
        
        cell.checkbox.tag = indexPath.row
        cell.checkbox.addTarget(self, action: "checked:", forControlEvents: .ValueChanged)
        cell.setData()
        return cell
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        if saveData.arrayForKey("WORD") != nil {
            wordArray = saveData.arrayForKey("WORD")!
        }
        tableView.reloadData()
    }
//   override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//    let cell: UITableViewCell = UITableViewCell(style:UITableViewCellStyle.Subtitle, reuseIdentifier: "todoCell"
//        return cell
//    }


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

    @IBAction func calenderButton(seque: UIStoryboardSegue) {
        
    }
    
    @IBAction func doButton(seque: UIStoryboardSegue) {
        
    }
    

//チェックボックス挑戦！
        // テーブルビュー
//        var tableView: UITableView!
    
        // テーブルデータ
        var tableData = [
            "データ1",
            "データ2",
            "データ3",
            "データ4",
            "データ5",
        ]
        // 選択中のセル
        var selected = [
            false,
            false,
            false,
            false,
            false,
        ]
//        override func viewDidLoad() {
//            super.viewDidLoad()
            // Do any additional setup after loading the view, typically from a nib.
            
            let barHeight: CGFloat = UIApplication.sharedApplication().statusBarFrame.size.height
            
//            let displayWidth = self.view.frame.width
//            let displayHeight = self.view.frame.height
    
//            tableView = UITableView(frame: CGRect(x:0, y:barHeight, width:displayWidth, height:displayHeight - barHeight))
//            
//            tableView.registerClass(CustomTableViewCell.self, forCellReuseIdentifier: "todoCell")
    
//            tableView.delegate = self
//            tableView.dataSource = self
//            
//            self.view.addSubview(tableView)
//        }
    
//        override func didReceiveMemoryWarning() {
//            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
//        }
// tableviewのデリゲートメソッドの一部省略・・・
        
//        // テーブルセルにデータをセットします
//        override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//            let cell = tableView.dequeueReusableCellWithIdentifier("todoCell", forIndexPath: indexPath) as! ToDoTableViewCell
//            cell.textLabel?.text = tableData[indexPath.row]
//    
//            cell.checkbox.tag = indexPath.row
//            cell.checkbox.addTarget(self, action: "checked:", forControlEvents: .ValueChanged)
//            cell.setData()
//            return cell
//        }
//        
        // ⭐️ここがポイント　セルの選択状態を保持します
        func checked(sender:CTCheckbox) {
            selected[sender.tag] = sender.checked
        }

    
//    class CustomTableViewCell: UITableViewCell{
////        var checkbox = CTCheckbox()
//    
//        func setData() -> Void {
////             ⭐️ここもポイント　チェックボックスを追加します
//            checkbox.frame = CGRectMake(self.frame.width - 44, 0, 22, self.frame.height)
//            checkbox.checkboxColor = UIColor.blackColor()
//            checkbox.checkboxSideLength = 22
//            self.addSubview(checkbox)
//}



    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
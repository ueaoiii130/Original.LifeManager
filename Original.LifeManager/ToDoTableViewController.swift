//
//  ToDoTableViewController.swift
//  Original.LifeManager
//
//  Created by Aoi Sakaue on 2016/02/21.
//  Copyright © 2016年 Aoi Sakaue. All rights reserved.
//

import UIKit

class ToDoTableViewController: UITableViewController , UITableViewDataSource , UITableViewDelegate{
    var wordArray: [AnyObject] = []
    let saveData = NSUserDefaults.standardUserDefaults()
    
    @IBOutlet weak var tableView: UIView!
    
    @IBOutlet var plusButton: UIButton!
    @IBOutlet var backButton: UIButton!
    @IBOutlet var doButton: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
//TableViewCellを使えるようにする
        tableView.registerNib(UINib(nibName: "ToDoTableViewCell", bundle:nil), forCellReuseIdentifier: "todoCell")
        
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
//セルの中身の表示の仕方を設定する
    override func tableVew(tableView: UITableView, cellForRowAtIndexPath indexPath:NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("todocell", forIndexPath:indexPath) as!ToDoTableViewCell
//        let nowIndexPathDictionary: (AnyObject) = wordArray[indexPath.row]
//        
//        cell.todoLabel.text = now
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        if saveData.arrayForKey("SCHEDULE") != nil {
            wordArray = saveData.arrayForKey("SCHEDULE")!
        }
        tableView.reloadData()
    }
//    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {let cell: UITableViewCell = UITableViewCell(style:UITableViewCellStyle.Subtitle, reuseIdentifier: "todoCell")
    
//        cell.textLabel?.text = texts[indexPath.row]
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
    @IBAction func plusButton() {
        
    }

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

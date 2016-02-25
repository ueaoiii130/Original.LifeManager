//
//  TableViewCell.swift
//  Original.LifeManager
//
//  Created by Aoi Sakaue on 2016/02/21.
//  Copyright © 2016年 Aoi Sakaue. All rights reserved.
//

import UIKit
import CTCheckbox
//import "NAObjectiveCClass.h"
//
class TableViewCell: UITableViewCell {
    
    var checkbox = CTCheckbox()
    
    @IBOutlet var ToDoLabel: UILabel!
    @IBOutlet var MemoLabel: UILabel!
    
    func setData() -> Void {
        // ⭐️ここもポイント　チェックボックスを追加します
        checkbox.frame = CGRectMake(self.frame.width - 44, 0, 22, self.frame.height)
        checkbox.checkboxColor = UIColor.blackColor()
        checkbox.checkboxSideLength = 22
        self.addSubview(checkbox)
    }


    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    

}
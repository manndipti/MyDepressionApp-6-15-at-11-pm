//
//  QuestionTableViewCell.swift
//  QuestonApp
//
//  Created by student on 6/15/15.
//  Copyright (c) 2015 Mayur. All rights reserved.
//

import UIKit

class QuestionTableViewCell: UITableViewCell {

    @IBOutlet weak var CellImageView: UIImageView!
    
    @IBOutlet weak var headingLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

//
//  GoalCell.swift
//  coursera_goal_post
//
//  Created by Muhammad Hashim on 1/21/20.
//  Copyright © 2020 Muhammad Hashim. All rights reserved.
//

import UIKit

class GoalCell: UITableViewCell {

    @IBOutlet weak var goalDescription: UILabel!
    @IBOutlet weak var goalTerm: UILabel!
    @IBOutlet weak var goalProgress: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func initData(description: String, type: GoalType, progress: String){
        goalDescription.text = description
        goalProgress.text = progress
        goalTerm.text = type.rawValue
    }

}

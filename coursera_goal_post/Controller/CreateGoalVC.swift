//
//  CreateGoalVC.swift
//  coursera_goal_post
//
//  Created by Muhammad Hashim on 1/21/20.
//  Copyright © 2020 Muhammad Hashim. All rights reserved.
//

import UIKit

class CreateGoalVC: UIViewController {
    
    @IBOutlet weak var goalTextView: UITextView!
    @IBOutlet weak var shortTermBtn: UIButton!
    @IBOutlet weak var longTermBtn: UIButton!
    @IBOutlet weak var nextBtn: UIButton!
    
    private var goalType: GoalType = .ShortTerm
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nextBtn.bindToKeyboard()
    }
    
    @IBAction func shortTermPressed(_ sender: Any) {
        goalType = .ShortTerm
        shortTermBtn.setSelected(state: true)
        longTermBtn.setSelected(state: false)
    }
    @IBAction func longTermPressed(_ sender: Any) {
        goalType = .LongTerm
        longTermBtn.setSelected(state: true)
        shortTermBtn.setSelected(state: false)
    }
    @IBAction func nextPressed(_ sender: Any) {
        if !goalTextView.text.isEmpty {
            guard let finishVC = storyboard?.instantiateViewController(identifier: "FinishVC") as? FinishVC else{
                return
            }
            finishVC.initData(description: goalTextView.text, type: goalType)
            presentDetail(detailVC: finishVC)
        }
        
    }
    @IBAction func backPressed(_ sender: Any) {
        dismissDetail()
    }
}

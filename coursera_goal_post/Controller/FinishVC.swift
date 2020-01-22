//
//  FinishVC.swift
//  coursera_goal_post
//
//  Created by Muhammad Hashim on 1/22/20.
//  Copyright © 2020 Muhammad Hashim. All rights reserved.
//

import UIKit

class FinishVC: UIViewController {

    
    @IBOutlet weak var progressText: UITextField!
    @IBOutlet weak var createBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        createBtn.bindToKeyboard()
    }
    
    func initData(description: String, type: GoalType){
        
    }
    
    @IBAction func createClicked(_ sender: Any) {
        
        //Todo
    }
    

}

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
    
    private var goalDescription: String!
    private var goalType: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createBtn.bindToKeyboard()
    }
    
    func initData(description: String, type: GoalType){
        goalDescription = description
        goalType = type.rawValue
    }
    
    func save(completion: (_ finished: Bool) -> Void){
        guard let managedContext = appDelegate?.persistentContainer.viewContext else {return}
        
        let goal = Goal(context: managedContext) <-< {
            $0.goal_description = goalDescription
            $0.progress = Int32(0)
            $0.target = Int32(progressText.text!)!
            $0.type = goalType
        }
        
        do {
            try managedContext.save()
            debugPrint("Saved successfully.")
            completion(true)
        } catch {
            debugPrint("Error saving; \(error.localizedDescription)")
            completion(false)
        }
        
    }
    
    @IBAction func createClicked(_ sender: Any) {
        if !(progressText.text?.isEmpty ?? true){
            save{ success in
                if success{ dismissDetail() }
            }
        }
    }
    
    @IBAction func backClicked(_ sender: Any) {
        dismissDetail()
    }
}

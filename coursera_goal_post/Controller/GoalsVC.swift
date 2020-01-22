//
//  GoalsVC.swift
//  coursera_goal_post
//
//  Created by Muhammad Hashim on 1/21/20.
//  Copyright © 2020 Muhammad Hashim. All rights reserved.
//

import UIKit

class GoalsVC: UIViewController {
    @IBOutlet weak var goalsTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        goalsTable.delegate = self
        goalsTable.dataSource = self
        goalsTable.isHidden = false

    }
    
    @IBAction func addGoalPressed(_ sender: Any) {
        guard let createGoalVC = storyboard?.instantiateViewController(identifier: "CreateGoalVC") else {
            return
        }
        presentDetail(detailVC: createGoalVC)
    }
    
}

extension GoalsVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = goalsTable.dequeueReusableCell(withIdentifier: "GoalCell") as? GoalCell else {
            return UITableViewCell()
        }
        cell.initData(description: "Finish this bloody course", type: .ShortTerm, progress: "5")
        //Todo
        return cell
    }
    
    
}

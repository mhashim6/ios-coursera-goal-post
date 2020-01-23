//
//  GoalsVC.swift
//  coursera_goal_post
//
//  Created by Muhammad Hashim on 1/21/20.
//  Copyright © 2020 Muhammad Hashim. All rights reserved.
//

import UIKit
import CoreData

class GoalsVC: UIViewController {
    @IBOutlet weak var goalsTable: UITableView!
    
    private var goals = [Goal]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        goalsTable.delegate = self
        goalsTable.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateData()
        goalsTable.reloadData()
    }
    
    private func updateData() {
        fetch { success in
            if success && goals.count >= 1{
                print(goals.map{$0.goal_description!})
                goalsTable.isHidden = false
            } else {
                goalsTable.isHidden = true }
        }
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
        return goals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = goalsTable.dequeueReusableCell(withIdentifier: "GoalCell") as? GoalCell else {
            return UITableViewCell()
        }
        let goal = goals[indexPath.row]
        cell.initData(goal: goal)
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .none
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let delete = UITableViewRowAction(style: .destructive, title: "DETLETE", handler: {(_, indexPath) in
            self.removeGoal(atIndexPath: indexPath)
            self.updateData()
            self.goalsTable.deleteRows(at: [indexPath], with: .automatic)
        })
        delete.backgroundColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
        return [delete]
    }
    
    
}

extension GoalsVC{
    func fetch(completion: (_ finished: Bool) -> Void){
        guard let moc = appDelegate?.persistentContainer.viewContext else { return }
        let fetchRequest = NSFetchRequest<Goal>(entityName: "Goal")
        do {
            goals = try moc.fetch(fetchRequest)
            completion(true)
        } catch {
            debugPrint("Error fetching; \(error.localizedDescription)")
        }
    }
    
    func removeGoal(atIndexPath indexPath: IndexPath){
        guard let moc = appDelegate?.persistentContainer.viewContext else { return }
        do {
            moc.delete(goals[indexPath.row])
            try moc.save()
        } catch {
            debugPrint("Error deleting; \(error.localizedDescription)")
        }
        
    }
}


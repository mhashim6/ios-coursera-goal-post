//
//  UIViewControllerExt.swift
//  coursera_goal_post
//
//  Created by Muhammad Hashim on 1/22/20.
//  Copyright © 2020 Muhammad Hashim. All rights reserved.
//

import UIKit

extension UIViewController{
    
    func presentDetail(detailVC: UIViewController) {
        let transition  = CATransition() <-< {
            $0.duration = 0.3
            $0.type = CATransitionType.push
            $0.subtype = CATransitionSubtype.fromRight
        }
        view.window?.layer.add(transition, forKey: kCATransition)
        present(detailVC, animated: false, completion: nil)
    }
    
    func dismissDetail(){
        let transition  = CATransition() <-< {
            $0.duration = 0.3
            $0.type = CATransitionType.push
            $0.subtype = CATransitionSubtype.fromLeft
        }
        view.window?.layer.add(transition, forKey: kCATransition)
        dismiss(animated: false, completion: nil)
    }
}

infix operator <-< : AssignmentPrecedence
func <-<<T:AnyObject>(left:T, right:(T)->()) -> T {
    right(left)
    return left
}

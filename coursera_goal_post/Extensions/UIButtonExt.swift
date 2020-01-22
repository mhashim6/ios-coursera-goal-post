//
//  UIButtonExt.swift
//  coursera_goal_post
//
//  Created by Muhammad Hashim on 1/22/20.
//  Copyright © 2020 Muhammad Hashim. All rights reserved.
//

import UIKit

extension UIButton{
    func setSelected(state isSelected: Bool){
        backgroundColor =  #colorLiteral(red: 0.4352941176, green: 0.764947474, blue: 0.365362823, alpha: 1) 
        alpha = isSelected ? 1 : 0.75
    }
}

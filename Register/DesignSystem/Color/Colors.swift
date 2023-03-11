//
//  Colors.swift
//  DesignSystem
//
//  Created by Mahmoud Sherbeny on 11/03/2023.
//

import Foundation
import UIKit

extension DesignSystem {
    enum Colors: String {
        case primary = "Primary"
        case white = "White"
        
        var color: UIColor {
            return UIColor(named: self.rawValue) ?? .white
        }
    }
}


//
//  String+Ex.swift
//  Souq
//
//  Created by Mahmoud Sherbeny on 11/03/2023.
//

import Foundation

extension String {
    var localized: String {
        Language.shared.currentBundle.localizedString(forKey: self, value: nil, table: nil)
    }
}

//
//  UICollectionViewEx.swift
//  Hop-Hop
//
//  Created by Mahmoud Sherbeny on 17/10/2021.
//

import UIKit.UICollectionView

extension UICollectionView {
    func registerCell<Cell: UICollectionViewCell>(cell: Cell.Type) {
        let identifier = String(describing: Cell.self)
        let nib = UINib(nibName: String(describing: Cell.self), bundle: nil)
        self.register(nib, forCellWithReuseIdentifier: identifier)
    }
    
    func dequeueCell<Cell: UICollectionViewCell>(indexPath: IndexPath) -> Cell {
        let identifier = String(describing: Cell.self)
        guard let cell = self.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as? Cell else {
            fatalError("Error in Cell Dequeue")
        }
        return cell
    }
}

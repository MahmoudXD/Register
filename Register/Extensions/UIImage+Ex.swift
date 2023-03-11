//
//  UIImage+Ex.swift
//  Souq
//
//  Created by Mahmoud Sherbeny on 03/12/2022.
//

import UIKit

extension UIImage {
    var flipImage: UIImage? {
        UIGraphicsBeginImageContextWithOptions(self.size, false, self.scale)
        guard let context = UIGraphicsGetCurrentContext() else { return nil }
        
        context.translateBy(x: self.size.width/2, y: self.size.height/2)
        context.scaleBy(x: -1.0, y: 1.0)
        context.translateBy(x: -self.size.width/2, y: -self.size.height/2)
        
        self.draw(in: CGRect(x: 0, y: 0, width: self.size.width, height: self.size.height))
        
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage
    }
    
    var image: UIImage {
        return "lang".localized == "ar" ? self.flipImage ?? UIImage() : self
    }
}

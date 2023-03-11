//
//  TypoGraphy.swift
//  DesignSystem
//
//  Created by Mahmoud Sherbeny on 11/03/2023.
//

import Foundation
import UIKit

extension DesignSystem {
    enum TypoGraphy {
        case title //18.0 , GEMedium
        case subTitle //14.0 , GEMedium
        
        private var fontDescriptor: CustomFontDescriptor {
            switch self {
            case .title:
                return CustomFontDescriptor(font: .geMedium, size: 18.0, style: .title1)
            case .subTitle:
                return CustomFontDescriptor(font: .geMedium, size: 10.0, style: .body)
            }
        }
        
        var font: UIFont {
            guard let font = UIFont(name: fontDescriptor.font.name, size: fontDescriptor.size) else {
                return UIFont.preferredFont(forTextStyle: fontDescriptor.style)
            }
            let fontMertix = UIFontMetrics(forTextStyle: fontDescriptor.style)
            return fontMertix.scaledFont(for: font)
        }
    }
}

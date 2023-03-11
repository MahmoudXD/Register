//
//  UILabelEx.swift
//  Hop-Hop
//
//  Created by Mahmoud Sherbeny on 14/11/2021.
//

import UIKit

extension UILabel {
    func setActivePart(orignalText: String,
                       hyberText: [String],
                       hyberTextColor: [UIColor?],
                       hyberTextFont: [UIFont?],
                       isUnderline: Bool = false) {
        let text = orignalText
        self.text = text
        let underlineAttriString = NSMutableAttributedString(string: text)
        
        for idx in 0 ..< hyberText.count {
            let range = (text as NSString).range(of: hyberText[idx])
            if isUnderline {
                underlineAttriString.addAttribute(NSAttributedString.Key.underlineStyle,
                                                  value: NSUnderlineStyle.single.rawValue,
                                                  range: range)
            }
            if let font = hyberTextFont[idx] {
                underlineAttriString.addAttribute(NSAttributedString.Key.font,
                                                  value: font,
                                                  range: range)
            }
            
            if let color = hyberTextColor[idx] {
                underlineAttriString.addAttribute(NSAttributedString.Key.foregroundColor,
                                                  value: color,
                                                  range: range)
            }
        }
        
        self.attributedText = underlineAttriString
        self.isUserInteractionEnabled = true
    }
    
    func strikeThrough(_ isStrikeThrough:Bool) {
        if isStrikeThrough {
            if let lblText = self.text {
                let attributeString =  NSMutableAttributedString(string: lblText)
                attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: NSUnderlineStyle.single.rawValue, range: NSMakeRange(0,attributeString.length))
                self.attributedText = attributeString
            }
        } else {
            if let attributedStringText = self.attributedText {
                let txt = attributedStringText.string
                self.attributedText = nil
                self.text = txt
                return
            }
        }
    }
}


class Language {
    static let shared = Language()
    static let overrideKey = "override.language.code"
    var currentBundle: Bundle!

    init() {
        loadCurrentBundle()
    }

    func loadCurrentBundle() {
        let path = Bundle.main.path(forResource: current.rawValue, ofType: "lproj")!
        currentBundle = Bundle(path: path)!
        
        
    }

    enum SupportedLanguageCode: String, Equatable, CaseIterable {
        case en
        case ar
    }
    
    func set(language: Language.SupportedLanguageCode) {
        UserDefaults.standard.set(language.rawValue, forKey: type(of: self).overrideKey)
        loadCurrentBundle()
        
        if (language == .ar) {
            UIView.appearance().semanticContentAttribute = .forceRightToLeft
            UITextField.appearance().textAlignment = .right
        } else {
            UIView.appearance().semanticContentAttribute = .forceLeftToRight
            UITextField.appearance().textAlignment = .left
        }
    }

    var current: Language.SupportedLanguageCode {
        let code = UserDefaults.standard.string(forKey: type(of: self).overrideKey) ?? Locale.current.languageCode!
        guard let language = Language.SupportedLanguageCode(rawValue: code) else {
            fatalError("failed to load language")
        }
        return language
    }
}

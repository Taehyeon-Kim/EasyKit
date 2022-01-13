//
//  File.swift
//  
//
//  Created by taehy.k on 2022/01/13.
//
// Thanks to YoonAh SunBae

import UIKit

extension UILabel {
    func addLabelSpacing(kernValue: Double = -0.6, lineSpacing: CGFloat = 4.0) {
        if let labelText = text, labelText.count > 0 {
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineSpacing = lineSpacing
            attributedText = NSAttributedString(string: labelText,
                                                attributes: [.kern: kernValue,
                                                             .paragraphStyle: paragraphStyle])
            lineBreakStrategy = .hangulWordPriority
        }
    }
    
    func applyColor(to targetString: String, with color: UIColor) {
        if let labelText = text, labelText.count > 0 {
            let attributedStr = NSMutableAttributedString(string: labelText)
            attributedStr.addAttribute(.foregroundColor, value: color, range: (labelText as NSString).range(of: targetString))
            attributedText = attributedStr
        }
    }
}

//
//  NSAttributedString+.swift
//  36-COLLABORATION-iOS-CAMPUSPICK
//
//  Created by OneTen on 5/11/25.
//

import UIKit

extension NSAttributedString {
    static func sopt(_ text: String, style: SoptFontStyle) -> NSAttributedString {
        let font = UIFont.soptFont(style)
        let letterSpacing = font.pointSize * -0.002 // -0.2%
        let attributes: [NSAttributedString.Key: Any] = [
            .font: font,
            .kern: letterSpacing
        ]
        return NSAttributedString(string: text, attributes: attributes)
    }
}

// 사용예시: label.attributedText = NSAttributedString.sopt("캠퍼스픽", style: .heading1)

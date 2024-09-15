//
//  String+Ext.swift
//  Planty
//
//  Created by Fedorova Maria on 11.09.2024.
//

import Foundation
import UIKit

extension String {
    func withBoldText(boldPartsOfString: Array<NSString>, font: UIFont, boldFont: UIFont) -> NSAttributedString {
        let nonBoldFontAttribute = [NSAttributedString.Key.font: font]
        let boldFontAttribute = [NSAttributedString.Key.font: boldFont]
        let boldString = NSMutableAttributedString(string: self, attributes: nonBoldFontAttribute)

        for i in 0 ..< boldPartsOfString.count {
            boldString.addAttributes(
                boldFontAttribute,
                range: (self as NSString).range(of: boldPartsOfString[i] as String)
            )
        }

        return boldString
    }
}

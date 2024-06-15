//
//  Extension.swift
//  sonmong
//
//  Created by 이은솔 on 6/15/24.
//

import Foundation
import UIKit

extension String {
    func formatPhoneNumber() -> String {
        // Remove any non-numeric characters
        let digits = self.filter { "0123456789".contains($0) }
        
        // Ensure there are exactly 11 digits
        guard digits.count == 11 else {
            return self
        }
        
        // Insert hyphens at the appropriate positions
        let startIndex = digits.startIndex
        let areaCode = digits[startIndex..<digits.index(startIndex, offsetBy: 3)]
        let midSection = digits[digits.index(startIndex, offsetBy: 3)..<digits.index(startIndex, offsetBy: 7)]
        let lastSection = digits[digits.index(startIndex, offsetBy: 7)..<digits.index(startIndex, offsetBy: 11)]
        
        return "\(areaCode)-\(midSection)-\(lastSection)"
    }
}

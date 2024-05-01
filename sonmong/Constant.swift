//
//  Constant.swift
//  sonmong
//
//  Created by 이은솔 on 3/23/24.
//

import Foundation
import UIKit

struct Constant { }

extension Constant {
    
    struct Color {
        static let g1 = UIColor(red: 0.82, green: 0.82, blue: 0.82, alpha: 1.00)
        static let g2 = UIColor(red: 0.67, green: 0.67, blue: 0.68, alpha: 1.00)
        static let g3 = UIColor(red: 0.58, green: 0.58, blue: 0.60, alpha: 1.00)
        static let g4 = UIColor(red: 0.43, green: 0.43, blue: 0.45, alpha: 1.00)
        static let g5 = UIColor(red: 0.21, green: 0.21, blue: 0.22, alpha: 1.00)
        static let g6 = UIColor(red: 0.07, green: 0.07, blue: 0.07, alpha: 1.00)
        static let g7 = UIColor(red: 0.10, green: 0.10, blue: 0.10, alpha: 1.00)
        
        static let b1 = UIColor(red: 0.00, green: 0.00, blue: 0.00, alpha: 1.00)
        
        static let l1 = UIColor(red: 0.96, green: 0.96, blue: 0.97, alpha: 1.00)
        static let l2 = UIColor(red: 0.90, green: 0.91, blue: 0.93, alpha: 1.00)
        static let l3 = UIColor(red: 0.86, green: 0.87, blue: 0.88, alpha: 1.00)
        
        static let m1 = UIColor(red: 0.91, green: 0.25, blue: 0.33, alpha: 1.00)
        static let m1_mate = UIColor(red: 0.91, green: 0.25, blue: 0.33, alpha: 0.34)
        static let m2 = UIColor(red: 0.96, green: 0.64, blue: 0.74, alpha: 1.00)
        static let m3 = UIColor(red: 0.98, green: 0.81, blue: 0.83, alpha: 1.00)
        static let m4 = UIColor(red: 1.00, green: 0.89, blue: 0.95, alpha: 1.00)
        static let m4_mate = UIColor(red: 1.00, green: 0.89, blue: 0.95, alpha: 0.34)
        static let m5 = UIColor(red: 0.21, green: 0.24, blue: 0.34, alpha: 1.00)
        static let m6 = UIColor(red: 0.28, green: 0.29, blue: 0.63, alpha: 1.00)
        static let m7 = UIColor(red: 0.42, green: 0.36, blue: 0.83, alpha: 1.00)
        static let m7_mate = UIColor(red: 0.42, green: 0.36, blue: 0.83, alpha: 0.10)
        static let m8 = UIColor(red: 0.59, green: 0.70, blue: 1.00, alpha: 1.00)
        
        static let f1 = UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 1.00)
        static let f2 = UIColor(red: 0.97, green: 0.98, blue: 0.98, alpha: 1.00)
    }
    
    struct APIURL {
        static let mongji = "http://mongji.site:8080"
        static let api = "http://175.106.96.107:8080"
        
        static let login = api + "/api/v1/auth/signin"
        static let aiCuration = "/api/v1/ai-consulting/curation"
    }
    
}

extension String {
    func toDate() -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy.MM.dd"
        dateFormatter.locale = Locale(identifier: "ko_KR")
        dateFormatter.timeZone = TimeZone(abbreviation: "KST")
        return dateFormatter.date(from: self)
    }
}

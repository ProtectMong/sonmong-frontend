//
//  Extension.swift
//  sonmong
//
//  Created by 이은솔 on 3/30/24.
//

import Foundation
import UIKit
import RxSwift

extension Encodable {
    var dictionary: [String: Any]? {
        guard let data = try? JSONEncoder().encode(self) else { return nil }
        return (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)).flatMap { $0 as? [String: Any] }
    }
}

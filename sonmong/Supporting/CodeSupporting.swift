//
//  CodeSupporting.swift
//  sonmong
//
//  Created by 이은솔 on 5/15/24.
//

import Foundation
import UIKit
import RxSwift

func toDictionary<T: Encodable>(_ instance: T) -> [String: Any]? {
    let encoder = JSONEncoder()
    encoder.dateEncodingStrategy = .iso8601 // Date 형식을 ISO8601로 설정
    encoder.outputFormatting = .prettyPrinted // 옵션: 보기 좋게 출력

    guard let data = try? encoder.encode(instance) else {
        return nil
    }

    guard let jsonObject = try? JSONSerialization.jsonObject(with: data, options: []),
          let dictionary = jsonObject as? [String: Any] else {
        return nil
    }

    // Bool 타입을 1과 0으로 변환하지 않도록 설정
    let processedDictionary = dictionary.mapValues { value -> Any in
        if let intValue = value as? Int {
            if intValue == 1 {
                return true
            } else if intValue == 0 {
                return false
            }
        }
        return value
    }

    print("dic = ", processedDictionary)
    return processedDictionary
}
protocol OptionalProtocol {
    var isNil: Bool { get }
    var unwrapped: Any { get }
}

extension Optional: OptionalProtocol {
    var isNil: Bool { return self == nil }
    var unwrapped: Any { return self! }
}

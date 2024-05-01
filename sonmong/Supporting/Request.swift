//
//  Request.swift
//  sonmong
//
//  Created by 이은솔 on 5/1/24.
//

import Foundation
import UIKit

struct Response: Codable {
    let success: Bool
    let result: String
    let message: String
}

class Request {
    /* Body가 없는 요청 */
    func requestGet(url: String, completionHandler: @escaping (Bool, Any) -> Void) {
        
    }

    /* Body가 있는 요청 */
    func requestPost(url: String, method: String, param: [String: Any], completionHandler: @escaping (Bool, Any) -> Void) {
        
    }

    /* 메소드별 동작 분리 */
    func request(_ url: String, _ method: String, _ param: [String: Any]? = nil, completionHandler: @escaping (Bool, Any) -> Void) {
        if method == "GET" {
            requestGet(url: url) { (success, data) in
                completionHandler(success, data)
            }
        }
        else {
            requestPost(url: url, method: method, param: param!) { (success, data) in
                completionHandler(success, data)
            }
        }
    }
}

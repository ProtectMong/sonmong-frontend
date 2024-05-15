//
//  APIResponse.swift
//  sonmong
//
//  Created by 이은솔 on 3/23/24.
//

import Foundation

//public struct APIResponse<T: Codable> : Codable {
//    public var resultData: T?
//    public var resultStatus: APIMessage?
//    public var total: Int?
//}

public struct APIResponse<T: Codable> : Codable {
    public var data: T?
    public var message: String?
    public var status: Int?
    public var httpStatus: String?
}

public struct APIMessage: Codable {
    public var messageCode: String?
    public var messageDescription: String?
    public var keyNamespace: String?
    public var messageText: String?
}

//
//  QurationList.swift
//  sonmong
//
//  Created by 이은솔 on 5/15/24.
//

import Foundation
struct QurationList: Codable {
    var curationList: [QurationListData]?
}

struct QurationListData: Codable {
    var sequence: Int?
    var levelOfPain: Int?
    var createdAt: Date?
}

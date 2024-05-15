//
//  QurationAnswer.swift
//  sonmong
//
//  Created by 이은솔 on 5/15/24.
//

import Foundation
struct QurationAnswer: Codable {
    var answerList: [QurationDetail]?
}

struct QurationDetail: Codable {
    var title: String?
    var content: String?
}

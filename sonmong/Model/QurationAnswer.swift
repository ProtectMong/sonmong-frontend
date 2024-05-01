//
//  QurationAnswer.swift
//  sonmong
//
//  Created by 이은솔 on 3/30/24.
//

import Foundation

struct QurationAnswer: Codable {
    var answerList: [QurationContents]?
}

struct QurationContents: Codable {
    var title: String?
    var content: String?
}

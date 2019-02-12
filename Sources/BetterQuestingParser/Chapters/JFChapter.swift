//
//  JFChapter.swift
//  BetterQuestingParser
//
//  Created by Jonas Frey on 09.02.19.
//

import Foundation

public struct JFChapter: Decodable {
    
    public let properties: JFChapterProperties
    public let quests: [JFQuestIcon]
    public let id: Int
    public let order: Int
    
    private enum CodingKeys: String, CodingKey {
        case properties
        case quests
        case id = "lineID"
        case order
    }
    
}

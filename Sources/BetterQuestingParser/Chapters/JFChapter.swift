//
//  JFChapter.swift
//  BetterQuestingParser
//
//  Created by Jonas Frey on 09.02.19.
//

import Foundation

/// Represents a chapter containing multiple JFQuests
public struct JFChapter: Decodable {
    
    /// The properties of this chapter
    public let properties: JFChapterProperties
    
    /// The list of quests in this chapter
    public let quests: [JFQuestIcon]
    
    /// The unique ID of this chapter
    public let id: Int
    
    /// The order of this chapter
    public let order: Int
    
    private enum CodingKeys: String, CodingKey {
        case properties
        case quests
        case id = "lineID"
        case order
    }
    
}

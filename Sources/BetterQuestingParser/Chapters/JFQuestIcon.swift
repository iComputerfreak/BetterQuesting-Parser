//
//  JFQuestIcon.swift
//  BetterQuestingParser
//
//  Created by Jonas Frey on 09.02.19.
//

import Foundation

/// The location and appearance of the quest in the chapter
public struct JFQuestIcon: Decodable {
    
    /// The size of the icon in pixels
    public let size: Int
    
    /// The x-coordinate of the quest icon
    public let x: Int
    
    /// The y-coordinate of the quest icon
    public let y: Int
    
    /// The ID of the quest
    public let questID: Int
    
    private enum CodingKeys: String, CodingKey {
        case size
        case x
        case y
        case questID = "id"
    }
    
}

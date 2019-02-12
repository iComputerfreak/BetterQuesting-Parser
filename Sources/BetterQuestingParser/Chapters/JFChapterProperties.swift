//
//  JFChapterProperties.swift
//  BetterQuestingParser
//
//  Created by Jonas Frey on 09.02.19.
//

import Foundation

/// Represents a set of chapter properties
public struct JFChapterProperties: Decodable {
    
    /// The name of the chapter
    public let name: String
    
    /// The background image
    public let backgroundImage: String
    
    /// The background size
    public let backgroundSize: Int
    
    /// The description of this chapter
    public let description: String
    
    public init(from decoder: Decoder) throws {
        let bqContainer = try decoder.container(keyedBy: BQCodingKeys.self)
        let container = try bqContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: BQCodingKeys.betterquesting)
        
        self.name = try container.decode(String.self, forKey: .name)
        self.backgroundImage = try container.decode(String.self, forKey: .backgroundImage)
        self.backgroundSize = try container.decode(Int.self, forKey: .backgroundSize)
        self.description = try container.decode(String.self, forKey: .description)
    }
    
    private enum BQCodingKeys: String, CodingKey {
        case betterquesting
    }
    
    private enum CodingKeys: String, CodingKey {
        case name
        case backgroundImage = "bg_image"
        case backgroundSize = "bg_size"
        case description = "desc"
    }
    
}

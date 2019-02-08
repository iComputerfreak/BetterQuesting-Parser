//
//  JFLocationTask.swift
//  BetterQuestingParser
//
//  Created by Jonas Frey on 06.02.19.
//

import Foundation

/// Represents task where the player has to travel to a specific location
public class JFLocationTask: JFTask {
    
    /// The name of the location
    public let name: String
    
    /// The x-coordinate of the location
    public let posX: Int
    
    /// The y-coordinate of the location
    public let posY: Int
    
    /// The z-coordinate of the location
    public let posZ: Int
    
    /// The dimension ID of the location
    public let dimension: Int
    
    /// How far the player can be away from the location
    public let range: Int
    
    /// Whether the location is visible
    public let visible: Bool
    
    
    public let hideInfo: Bool
    
    public override var description: String {
        return "Location task with name '\(name)' (id \(taskID))"
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        name = try container.decode(String.self, forKey: .name)
        posX = try container.decode(Int.self, forKey: .posX)
        posY = try container.decode(Int.self, forKey: .posY)
        posZ = try container.decode(Int.self, forKey: .posZ)
        dimension = try container.decode(Int.self, forKey: .dimension)
        range = try container.decode(Int.self, forKey: .range)
        visible = try container.decode(Bool.self, forKey: .visible)
        hideInfo = try container.decode(Bool.self, forKey: .hideInfo)
        
        try super.init(from: decoder)
    }
    
    private enum CodingKeys: String, CodingKey {
        case name
        case posX
        case posY
        case posZ
        case dimension
        case range
        case visible
        case hideInfo
    }
    
}

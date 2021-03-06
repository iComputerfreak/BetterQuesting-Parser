//
//  JFBlockBreakTask.swift
//  BetterQuestingParser
//
//  Created by Jonas Frey on 04.02.19.
//

import Foundation

/// Represents a task where the player has to break specific blocks
public class JFBlockBreakTask: JFTask {
    
    /// The list of blocks to break
    public let blocks: [JFBlock]
    
    public override var description: String {
        return "Block break task with \(blocks.count) blocks (id \(taskID))"
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        blocks = try container.decode([JFBlock].self, forKey: .blocks)
        
        try super.init(from: decoder)
    }
    
    private enum CodingKeys: String, CodingKey {
        case blocks
    }
    
}

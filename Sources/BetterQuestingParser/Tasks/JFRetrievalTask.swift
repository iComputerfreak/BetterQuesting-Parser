//
//  JFRetrievalTask.swift
//  BetterQuestingParser
//
//  Created by Jonas Frey on 04.02.19.
//

import Foundation

/// Represents a task where the player has to obtain or submit specific items
class JFRetrievalTask: JFTask {
    
    /// Whether the items only have to be a partial match
    let partialMatch: Bool
    
    /// Whether NBT tags should be ignored
    let ignoreNBT: Bool
    
    /// Whether the items need to be submitted instead of just obtained
    let consume: Bool
    
    /// Whether the items should only be detected all at once
    let groupDetect: Bool
    
    /// Whether the items should be automatically consumed (only if consume is `true`)
    let autoConsume: Bool
    
    /// The list of items required
    let requiredItems: [JFItem]
    
    override var description: String {
        return "Retrieval (\(consume ? "" : "non-")consuming) task with \(requiredItems.count) items (id \(taskID))"
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        partialMatch = try container.decode(Bool.self, forKey: .partialMatch)
        ignoreNBT = try container.decode(Bool.self, forKey: .ignoreNBT)
        consume = try container.decode(Bool.self, forKey: .consume)
        groupDetect = try container.decode(Bool.self, forKey: .groupDetect)
        autoConsume = try container.decode(Bool.self, forKey: .autoConsume)
        requiredItems = try container.decode([JFItem].self, forKey: .requiredItems)
        
        try super.init(from: decoder)
    }
    
    private enum CodingKeys: String, CodingKey {
        case partialMatch
        case ignoreNBT
        case consume
        case groupDetect
        case autoConsume
        case requiredItems
    }
    
}

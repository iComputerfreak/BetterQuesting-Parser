//
//  JFCraftingTask.swift
//  BetterQuestingParser
//
//  Created by Jonas Frey on 04.02.19.
//

import Foundation

/// Represents task where the player has to craft specific items
class JFCraftingTask: JFTask {
    
    /// Whether the items only have to be a partial match
    let partialMatch: Bool
    
    /// Whether NBT tags should be ignored
    let ignoreNBT: Bool
    
    /// The list of items required
    let requiredItems: [JFItem]
    
    override var description: String {
        return "Crafting task with \(requiredItems.count) items (id \(taskID))"
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        partialMatch = try container.decode(Bool.self, forKey: .partialMatch)
        ignoreNBT = try container.decode(Bool.self, forKey: .ignoreNBT)
        requiredItems = try container.decode([JFItem].self, forKey: .requiredItems)
        
        try super.init(from: decoder)
    }
    
    private enum CodingKeys: String, CodingKey {
        case partialMatch
        case ignoreNBT
        case requiredItems
    }
    
}

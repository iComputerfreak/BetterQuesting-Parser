//
//  JFChoiceReward.swift
//  BetterQuestingParser
//
//  Created by Jonas Frey on 06.02.19.
//

import Foundation

/// Represents a reward where the player can choose one of multiple items
class JFChoiceReward: JFReward {
    
    /// The list of items to choose from
    let items: [JFItem]
    
    override var description: String {
        return "Choice reward with \(items.count) choices (id \(rewardID))"
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        items = try container.decode([JFItem].self, forKey: .items)
        
        try super.init(from: decoder)
    }
    
    private enum CodingKeys: String, CodingKey {
        case items = "choices"
    }
    
}

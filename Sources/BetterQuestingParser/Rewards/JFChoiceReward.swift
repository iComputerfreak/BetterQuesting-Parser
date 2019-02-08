//
//  JFChoiceReward.swift
//  BetterQuestingParser
//
//  Created by Jonas Frey on 06.02.19.
//

import Foundation

/// Represents a reward where the player can choose one of multiple items
public class JFChoiceReward: JFReward {
    
    /// The list of items to choose from
    public let items: [JFItem]
    
    public override var description: String {
        return "Choice reward with \(items.count) choices (id \(rewardID))"
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        items = try container.decode([JFItem].self, forKey: .items)
        
        try super.init(from: decoder)
    }
    
    private enum CodingKeys: String, CodingKey {
        case items = "choices"
    }
    
}

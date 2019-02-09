//
//  JFItemReward.swift
//  BetterQuestingParser
//
//  Created by Jonas Frey on 06.02.19.
//

import Foundation

/// Represents an item reward
public class JFItemReward: JFReward {
    
    /// The list of items
    public let items: [JFItem]
    
    public override var description: String {
        return String(describing: items)
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        items = try container.decode([JFItem].self, forKey: .items)
        
        try super.init(from: decoder)
    }
    
    private enum CodingKeys: String, CodingKey {
        case items = "rewards"
    }
}

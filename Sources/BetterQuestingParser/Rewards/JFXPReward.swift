//
//  JFXPReward.swift
//  BetterQuestingParser
//
//  Created by Jonas Frey on 06.02.19.
//

import Foundation

/// Represents an experience reward
public class JFXPReward: JFReward {
    
    /// The amount of experience
    public let amount: Int
    
    /// Whether the amount is specified in levels
    public let isLevels: Bool
    
    public override var description: String {
        return "XP reward with \(amount)\(isLevels ? "L" : "") XP (id \(rewardID))"
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        amount = try container.decode(Int.self, forKey: .amount)
        isLevels = try container.decode(Bool.self, forKey: .isLevels)
        
        try super.init(from: decoder)
    }
    
    private enum CodingKeys: String, CodingKey {
        case amount
        case isLevels
    }
    
}

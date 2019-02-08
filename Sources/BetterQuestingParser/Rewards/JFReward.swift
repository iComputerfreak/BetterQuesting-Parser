//
//  JFReward.swift
//  BetterQuestingParser
//
//  Created by Jonas Frey on 01.02.19.
//

import Foundation

/// Represents a Reward
public class JFReward: Decodable, CustomStringConvertible {
    
    /// The ID of the reward inside the quest
    public let rewardID: Int
    
    /// The type of reward
    ///
    /// Supported types are:
    /// - bq_standard:item
    /// - bq_standard:xp
    /// - bq_standard:choice
    /// - bq_standard:command
    public let type: String
    
    public var description: String {
        return "Generic reward with type \(type) (id \(rewardID))"
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        rewardID = try container.decode(Int.self, forKey: .rewardID)
        type = try container.decode(String.self, forKey: .type)
    }
    
    private enum CodingKeys: String, CodingKey {
        case rewardID = "index"
        case type = "rewardID"
    }
}

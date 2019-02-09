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
    public let type: Types
    
    public var description: String {
        return "Reward with type \(type)"
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        rewardID = try container.decode(Int.self, forKey: .rewardID)
        type = try container.decode(Types.self, forKey: .type)
    }
    
    private enum CodingKeys: String, CodingKey {
        case rewardID = "index"
        case type = "rewardID"
    }
    
    /// Contains the different reward types
    ///
    /// - item: A fixed item reward
    /// - xp: An experience reward
    /// - choice: A choice reward, where the player can choose one from a list of items
    /// - command: A reward where a command gets executed
    public enum Types: String, Decodable {
        case item = "bq_standard:item"
        case xp = "bq_standard:xp"
        case choice = "bq_standard:choice"
        case command = "bq_standard:command"
    }
}

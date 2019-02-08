//
//  JFCommandReward.swift
//  BetterQuestingParser
//
//  Created by Jonas Frey on 06.02.19.
//

import Foundation

/// Represents a reward where a specific command gets executed
class JFCommandReward: JFReward {
    
    /// The command that will be executed (including the `/`)
    let command: String
    
    /// Whether the command should be hidden from the user
    let hideCommand: Bool
    
    /// Whether the command should be executed by the player (otherwise from the console)
    let viaPlayer: Bool
    
    override var description: String {
        return "Command reward with command '\(command)' (id \(rewardID))"
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        command = try container.decode(String.self, forKey: .command)
        hideCommand = try container.decode(Bool.self, forKey: .hideCommand)
        viaPlayer = try container.decode(Bool.self, forKey: .viaPlayer)
        
        try super.init(from: decoder)
    }
    
    private enum CodingKeys: String, CodingKey {
        case command
        case hideCommand
        case viaPlayer
    }
    
}

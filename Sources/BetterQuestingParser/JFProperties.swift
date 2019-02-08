//
//  JFProperties.swift
//  BetterQuestingParser
//
//  Created by Jonas Frey on 01.02.19.
//

import Foundation

/// Represents an container, containing only the BetterQuesting properties
public struct JFProperties: Decodable {
    
    /// The BetterQuesting properties
    public let betterQuestingProperties: JFBetterQuestingProperties
    
    private enum CodingKeys: String, CodingKey {
        case betterQuestingProperties = "betterquesting"
    }
}

/// Represents a set of properties for a specific quest
public struct JFBetterQuestingProperties: Decodable {
    
    
    /// The Sound name used when a quest is updated (e.g. `random.levelup`)
    public let updateSound: String
    
    /// The Sound name used when a quest is completed (e.g. `random.levelup`)
    public let completionSound: String
    
    /// The task logic (`AND`, `OR`, `NAND`, `NOR`, `XOR` or `XNOR`)
    public let taskLogic: String
    
    /// The quest logic (`AND`, `OR`, `NAND`, `NOR`, `XOR` or `XNOR`)
    public let questLogic: String
    
    /// Whether the reward should be given to only one party member
    public let partySingleReward: Bool
    
    /// Whether this quest is a main quest
    public let isMain: Bool
    
    
    public let simultaneous: Bool
    
    /// The cooldown for repeatable quests in ticks (or -1 if the quest should not be repeatable)
    public let repeatTime: Int
    
    
    public let globalShare: Bool
    
    
    public let lockedProgress: Bool
    
    
    public let isSilent: Bool
    
    /// Whether the quest should be automatically claimed when completed
    public let autoClaim: Bool
    
    /// The name of the quest
    public let name: String
    
    /// The description of the quest
    public let description: String
    
    /// The item used as icon for the quest
    public let icon: JFItem
    
    
    private enum CodingKeys: String, CodingKey {
        case updateSound = "snd_update"
        case completionSound = "snd_complete"
        case taskLogic
        case questLogic
        case partySingleReward
        case isMain
        case simultaneous
        case repeatTime
        case globalShare
        case lockedProgress
        case isSilent
        case autoClaim
        
        case name
        case description = "desc"
        case icon
    }
    
}

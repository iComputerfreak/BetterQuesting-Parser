//
//  JFProperties.swift
//  BetterQuestingParser
//
//  Created by Jonas Frey on 01.02.19.
//

import Foundation

/// Represents an container, containing only the BetterQuesting properties
struct JFProperties: Decodable {
    
    /// The BetterQuesting properties
    let betterQuestingProperties: JFBetterQuestingProperties
    
    private enum CodingKeys: String, CodingKey {
        case betterQuestingProperties = "betterquesting"
    }
}

/// Represents a set of properties for a specific quest
struct JFBetterQuestingProperties: Decodable {
    
    
    /// The Sound name used when a quest is updated (e.g. `random.levelup`)
    let updateSound: String
    
    /// The Sound name used when a quest is completed (e.g. `random.levelup`)
    let completionSound: String
    
    /// The task logic (`AND`, `OR`, `NAND`, `NOR`, `XOR` or `XNOR`)
    let taskLogic: String
    
    /// The quest logic (`AND`, `OR`, `NAND`, `NOR`, `XOR` or `XNOR`)
    let questLogic: String
    
    /// Whether the reward should be given to only one party member
    let partySingleReward: Bool
    
    /// Whether this quest is a main quest
    let isMain: Bool
    
    
    let simultaneous: Bool
    
    /// The cooldown for repeatable quests in ticks (or -1 if the quest should not be repeatable)
    let repeatTime: Int
    
    
    let globalShare: Bool
    
    
    let lockedProgress: Bool
    
    
    let isSilent: Bool
    
    /// Whether the quest should be automatically claimed when completed
    let autoClaim: Bool
    
    /// The name of the quest
    let name: String
    
    /// The description of the quest
    let description: String
    
    /// The item used as icon for the quest
    let icon: JFItem
    
    
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

//
//  JFHuntTask.swift
//  BetterQuestingParser
//
//  Created by Jonas Frey on 06.02.19.
//

import Foundation

/// Represents a task where the player has to kill a specific entity
class JFHuntTask: JFTask {
    
    /// The entity to kill
    let target: String
    
    /// The amount of entities to kill
    let amount: Int
    
    /// Whether subtypes should count too
    let subtypes: Bool
    
    /// Whether NBT tags should be ignored
    let ignoreNBT: Bool
    
    /// The NBT tags of the target
    let targetNBT: JFNBT
    
    override var description: String {
        return "Hunting task with entity type \(target) (id \(taskID))"
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        target = try container.decode(String.self, forKey: .target)
        amount = try container.decode(Int.self, forKey: .amount)
        subtypes = try container.decode(Bool.self, forKey: .subtypes)
        ignoreNBT = try container.decode(Bool.self, forKey: .ignoreNBT)
        targetNBT = try container.decode(JFNBT.self, forKey: .targetNBT)
        
        try super.init(from: decoder)
    }
    
    private enum CodingKeys: String, CodingKey {
        case target
        case amount = "required"
        case subtypes
        case ignoreNBT
        case targetNBT
    }
    
}

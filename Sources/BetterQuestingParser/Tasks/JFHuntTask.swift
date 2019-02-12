//
//  JFHuntTask.swift
//  BetterQuestingParser
//
//  Created by Jonas Frey on 06.02.19.
//

import Foundation

/// Represents a task where the player has to kill a specific entity
public class JFHuntTask: JFTask {
    
    /// The entity to kill
    public let target: String
    
    /// The amount of entities to kill
    public let amount: Int
    
    /// Whether subtypes should count too
    public let subtypes: Bool
    
    /// Whether NBT tags should be ignored
    public let ignoreNBT: Bool
    
    /// The NBT tags of the target
    public let targetNBT: JFNBT?
    
    public override var description: String {
        return "Hunting task with entity type \(target) (id \(taskID))"
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        target = try container.decode(String.self, forKey: .target)
        amount = try container.decode(Int.self, forKey: .amount)
        subtypes = try container.decode(Bool.self, forKey: .subtypes)
        ignoreNBT = try container.decode(Bool.self, forKey: .ignoreNBT)
        
        let nbt = try container.decode(JFNBT.self, forKey: .targetNBT)
        self.targetNBT = nbt.data.isEmpty ? nil : nbt
        
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

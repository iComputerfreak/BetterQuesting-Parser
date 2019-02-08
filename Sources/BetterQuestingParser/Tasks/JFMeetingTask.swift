//
//  JFMeetingTask.swift
//  BetterQuestingParser
//
//  Created by Jonas Frey on 04.02.19.
//

import Foundation

/// Represents a task where the player has to meet specific entities
public class JFMeetingTask: JFTask {
    
    /// The target entity (e.g. `Cow`)
    public let target: String
    
    /// How far the player can be away from the entity
    public let range: Int
    
    /// The number of entities the player must meet
    public let amount: Int
    
    /// Whether subtypes of entities count too
    public let subtypes: Bool
    
    /// Whether NBT tags should be ignored
    public let ignoreNBT: Bool
    
    /// The NBT tags of the target
    public let targetNBT: JFNBT
    
    public override var description: String {
        return "Meeting task with \(amount) entities of type \(target) (id \(taskID))"
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        target = try container.decode(String.self, forKey: .target)
        range = try container.decode(Int.self, forKey: .range)
        amount = try container.decode(Int.self, forKey: .amount)
        subtypes = try container.decode(Bool.self, forKey: .subtypes)
        ignoreNBT = try container.decode(Bool.self, forKey: .ignoreNBT)
        targetNBT = try container.decode(JFNBT.self, forKey: .targetNBT)
        
        try super.init(from: decoder)
    }
    
    private enum CodingKeys: String, CodingKey {
        case target
        case range
        case amount
        case subtypes
        case ignoreNBT
        case targetNBT
    }
    
}

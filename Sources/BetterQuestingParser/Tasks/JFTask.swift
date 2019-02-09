//
//  JFTask.swift
//  BetterQuestingParser
//
//  Created by Jonas Frey on 01.02.19.
//

import Foundation

/// Represents a generic task with an ID and a type
public class JFTask: Decodable, CustomStringConvertible {
    
    /// The ID of the task inside the quest
    public let taskID: Int
    
    /// The type of the task
    ///
    /// Supported types are:
    /// - bq_standard:retrieval
    /// - bq_standard:crafting
    /// - bq_standard:block_break
    /// - bq_standard:meeting
    /// - bq_standard:location
    /// - bq_standard:hunt
    /// - bq_standard:checkbox
    public let type: Types
    
    public var description: String {
        return "Generic task with type \(type) (id \(taskID))"
    }
    
    /// Creates a new instance by decoding from the given decoder.
    ///
    /// - Parameter decoder: The decoder to read from
    /// - Throws: if reading from the decoder fails, or if the data read is corrupted or otherwise invalid.
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        taskID = try container.decode(Int.self, forKey: .taskID)
        type = try container.decode(Types.self, forKey: .type)
    }
    
    private enum CodingKeys: String, CodingKey {
        case taskID = "index"
        case type = "taskID"
    }
    
    /// Contains the different task types
    ///
    /// - retrieval: A task where specified items have to be submitted or obtained
    /// - crafting: A task where the player has to craft one or more specific items
    /// - block_break: A task where the player has to break a specific block
    /// - meeting: A task where the player has to meet a specific entity
    /// - location: A task where the player has to travel to a specific location
    /// - hunt: A task where the player has to kill a specific entity
    /// - checkbox: A task where the player has to click a checkbox
    public enum Types: String, Decodable {
        case retrieval = "bq_standard:retrieval"
        case crafting = "bq_standard:crafting"
        case block_break = "bq_standard:block_break"
        case meeting = "bq_standard:meeting"
        case location = "bq_standard:location"
        case hunt = "bq_standard:hunt"
        case checkbox = "bq_standard:checkbox"
    }
}

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
    public let type: String
    
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
        type = try container.decode(String.self, forKey: .type)
    }
    
    private enum CodingKeys: String, CodingKey {
        case taskID = "index"
        case type = "taskID"
    }
}

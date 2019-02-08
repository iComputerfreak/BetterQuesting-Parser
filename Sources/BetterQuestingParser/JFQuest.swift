//
//  JFQuest.swift
//  BetterQuestingParser
//
//  Created by Jonas Frey on 01.02.19.
//

import Foundation

/// Represents a quest with an ID, prerequisites, tasks, rewards and properties
struct JFQuest: Decodable {
    
    /// The unique ID of the quest
    let questID: Int
    
    /// The IDs of the quests that are required to unlock this quest
    let preRequisites: [Int]
    
    /// The list of tasks that are required to complete this quest
    let tasks: JFTaskList
    
    /// The list of rewards, the player can claim after completing this quest
    let rewards: JFRewardList
    
    /// The properties of this quest
    let properties: JFProperties
    
    /// Creates a new instance by decoding from the given decoder.
    ///
    /// - Parameter decoder: The decoder to read from
    /// - Throws: if reading from the decoder fails, or if the data read is corrupted or otherwise invalid.
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        questID = try container.decode(Int.self, forKey: .questID)
        preRequisites = try container.decode([Int].self, forKey: .preRequisites)
        properties = try container.decode(JFProperties.self, forKey: .properties)
        tasks = try container.decode(JFTaskList.self, forKey: .tasks)
        rewards = try container.decode(JFRewardList.self, forKey: .rewards)
    }
    
    private enum CodingKeys: String, CodingKey {
        case questID
        case preRequisites
        case rewards
        case tasks
        case properties
    }
}

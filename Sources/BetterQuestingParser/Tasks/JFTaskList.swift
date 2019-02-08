//
//  JFTaskList.swift
//  BetterQuestingParser
//
//  Created by Jonas Frey on 06.02.19.
//

import Foundation

/// Represents a list of tasks
public class JFTaskList: Decodable, Sequence {
    
    public typealias Iterator = IndexingIterator<[JFTask]>
    
    /// The list of tasks
    public let tasks: [JFTask]
    
    /// Creates a new JFTaskList containing a list of JFTask subclasses read from the given decoder
    /// Decodes every task in the matching subclass
    ///
    /// - Parameter decoder: The decoder to read from
    /// - Throws: if reading from the decoder fails, or if the data read is corrupted or otherwise invalid.
    public required init(from decoder: Decoder) throws {
        // decoder contains the container with the array of tasks
        var tasksArrayForType = try decoder.unkeyedContainer()
        var tasks = [JFTask]()
        
        // copy the container
        var tasksArray = tasksArrayForType
        while(!tasksArrayForType.isAtEnd) {
            // get the next task as a nested container that is keyed by the TaskTypeKey enum (only the type key matters right now)
            let task = try tasksArrayForType.nestedContainer(keyedBy: TaskTypeKey.self)
            // get the type of the task
            let type = try task.decode(TaskTypes.self, forKey: TaskTypeKey.type)
            
            // decode the task again (in the init methods) now with all the keys
            switch type {
            case .retrieval:
                tasks.append(try tasksArray.decode(JFRetrievalTask.self))
            case .crafting:
                tasks.append(try tasksArray.decode(JFCraftingTask.self))
            case .block_break:
                tasks.append(try tasksArray.decode(JFBlockBreakTask.self))
            case .meeting:
                tasks.append(try tasksArray.decode(JFMeetingTask.self))
            case .location:
                tasks.append(try tasksArray.decode(JFLocationTask.self))
            case .hunt:
                tasks.append(try tasksArray.decode(JFHuntTask.self))
            case .checkbox:
                tasks.append(try tasksArray.decode(JFCheckboxTask.self))
            }
        }
        
        self.tasks = tasks
    }
    
    /// Contains the key for the type of a task
    ///
    /// - type: the key that is used for the type of a task
    private enum TaskTypeKey: String, CodingKey {
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
    private enum TaskTypes: String, Decodable {
        case retrieval = "bq_standard:retrieval"
        case crafting = "bq_standard:crafting"
        case block_break = "bq_standard:block_break"
        case meeting = "bq_standard:meeting"
        case location = "bq_standard:location"
        case hunt = "bq_standard:hunt"
        case checkbox = "bq_standard:checkbox"
    }
    
    public func makeIterator() -> JFTaskList.Iterator {
        return tasks.makeIterator()
    }
    
}

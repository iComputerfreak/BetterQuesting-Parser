//
//  JFCheckboxTask.swift
//  BetterQuestingParser
//
//  Created by Jonas Frey on 06.02.19.
//

import Foundation

/// Represents a task where the player has to click a checkbox
public class JFCheckboxTask: JFTask {
    public override var description: String {
        return "Checkbox task (id \(taskID))"
    }
}

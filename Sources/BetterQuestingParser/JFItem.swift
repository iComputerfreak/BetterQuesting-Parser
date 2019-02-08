//
//  JFItem.swift
//  BetterQuestingParser
//
//  Created by Jonas Frey on 01.02.19.
//

import Foundation

/// Represents an item stack
struct JFItem: Decodable {
    
    /// The ID of the item (e.g. `minecraft:stone`)
    let itemID: String
    
    /// The amount
    let count: Int
    
    /// The ore dictionary name of the item
    let oreDict: String
    
    /// The damage (or metadata)
    let damage: Int

    private enum CodingKeys: String, CodingKey {
        case itemID = "id"
        case count = "Count"
        case oreDict = "OreDict"
        case damage = "Damage"
    }
}

//
//  JFItem.swift
//  BetterQuestingParser
//
//  Created by Jonas Frey on 01.02.19.
//

import Foundation

/// Represents an item stack
public struct JFItem: Decodable, CustomStringConvertible {
    
    /// The ID of the item (e.g. `minecraft:stone`)
    public let itemID: String
    
    /// The amount
    public let amount: Int
    
    /// The ore dictionary name of the item
    public let oreDict: String
    
    /// The damage (or metadata)
    public let damage: Int
    
    /// The NBT data
    public let nbt: JFNBT?
    
    public var description: String {
        return "\(itemID)\(damage == 0 ? "" : ":\(damage)")"
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.itemID = try container.decode(String.self, forKey: .itemID)
        self.amount = try container.decode(Int.self, forKey: .amount)
        self.oreDict = try container.decode(String.self, forKey: .oreDict)
        self.damage = try container.decode(Int.self, forKey: .damage)
        let nbt = try container.decodeIfPresent(JFNBT.self, forKey: .nbt)
        
        if nbt?.data.isEmpty ?? false {
            // Empty NBT tags are useless
            self.nbt = nil
        } else {
            self.nbt = nbt
        }
    }

    private enum CodingKeys: String, CodingKey {
        case itemID = "id"
        case amount = "Count"
        case oreDict = "OreDict"
        case damage = "Damage"
        case nbt = "tag"
    }
}

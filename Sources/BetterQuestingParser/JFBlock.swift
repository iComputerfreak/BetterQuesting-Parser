//
//  JFBlock.swift
//  BetterQuestingParser
//
//  Created by Jonas Frey on 01.02.19.
//

import Foundation

/// Represents one or more physical block in the world
public struct JFBlock: Decodable {
    
    /// The ID of the block (e.g. `minecraft:stone`)
    public let blockID: String
    
    /// The metadata
    public let meta: Int
    
    /// The NBT data of the block
    public let nbt: JFNBT?
    
    /// The amount of blocks
    public let amount: Int
    
    /// The ore dictionary name
    public let oreDict: String
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.blockID = try container.decode(String.self, forKey: .blockID)
        self.meta = try container.decode(Int.self, forKey: .meta)
        self.amount = try container.decode(Int.self, forKey: .amount)
        self.oreDict = try container.decode(String.self, forKey: .oreDict)
        let nbt = try container.decodeIfPresent(JFNBT.self, forKey: .nbt)
        
        if nbt?.data.isEmpty ?? false {
            // Empty NBT tags are useless
            self.nbt = nil
        } else {
            self.nbt = nbt
        }
    }
    
    private enum CodingKeys: String, CodingKey {
        case blockID
        case meta
        case nbt
        case amount
        case oreDict
    }
}

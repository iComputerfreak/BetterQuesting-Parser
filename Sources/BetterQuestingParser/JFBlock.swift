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
    public let nbt: JFNBT
    
    /// The amount of blocks
    public let amount: Int
    
    /// The ore dictionary name
    public let oreDict: String
    
    private enum CodingKeys: String, CodingKey {
        case blockID
        case meta
        case nbt
        case amount
        case oreDict
    }
}

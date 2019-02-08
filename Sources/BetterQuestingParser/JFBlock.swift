//
//  JFBlock.swift
//  BetterQuestingParser
//
//  Created by Jonas Frey on 01.02.19.
//

import Foundation

/// Represents one or more physical block in the world
struct JFBlock: Decodable {
    
    /// The ID of the block (e.g. `minecraft:stone`)
    let blockID: String
    
    /// The metadata
    let meta: Int
    
    /// The NBT data of the block
    let nbt: JFNBT
    
    /// The amount of blocks
    let amount: Int
    
    /// The ore dictionary name
    let oreDict: String
    
    private enum CodingKeys: String, CodingKey {
        case blockID
        case meta
        case nbt
        case amount
        case oreDict
    }
}

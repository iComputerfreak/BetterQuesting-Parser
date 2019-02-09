//
//  JFNBT.swift
//  BetterQuestingParser
//
//  Created by Jonas Frey on 01.02.19.
//

import Foundation

/// Represents a set of NBT tags
public class JFNBT: Codable, CustomStringConvertible {
    
    public var description: String {
        return "NBT Tag"
    }
    
    public required init(from decoder: Decoder) throws {
        
    }
}

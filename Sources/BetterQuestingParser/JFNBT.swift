//
//  JFNBT.swift
//  BetterQuestingParser
//
//  Created by Jonas Frey on 01.02.19.
//

import Foundation

/// Represents a set of NBT tags
public struct JFNBT: Decodable, CustomStringConvertible {
    
    // To support NBT data from blockbreak tasks, override the init to check for "nbt" keys as well
    
    let data: [String: JFNestedDictionary]?
    
    public var description: String {
        return data?.description ?? ""
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        self.data = try container.decode([String: JFNestedDictionary].self)
        print("Created a NBT tag with data: \(data?.description ?? "None")")
    }
    
    private enum CodingKeys: CodingKey {}
    
}

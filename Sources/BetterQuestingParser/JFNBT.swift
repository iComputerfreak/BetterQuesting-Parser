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
    
    let data: [String: JFNestedDictionary]
    
    public var description: String {
        return description(dictionary: data)
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        self.data = try container.decode([String: JFNestedDictionary].self)
    }
    
    private enum CodingKeys: CodingKey {}
    
    private func description(dictionary: [String: JFNestedDictionary], level: Int = 0) -> String {
        
        let spacing = Array(repeating: " ", count: level * 4).joined(separator: "")
        var desc = ""
        for tuple in dictionary {
            let key = tuple.key.replacingOccurrences(of: ":[0-9]+", with: "", options: .regularExpression)
            desc += spacing + key + ": "
            if let dict = tuple.value.dictionary {
                desc += "{\n"
                desc += description(dictionary: dict, level: level + 1)
                desc += "\n" + spacing + "}"
            } else {
                desc += tuple.value.rawValue!.description
            }
            desc += ",\n"
        }
        
        if desc.count >= 2 {
            desc.removeLast(2)
        }
        
        return desc
    }
    
}

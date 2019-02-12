//
//  JFNBT.swift
//  BetterQuestingParser
//
//  Created by Jonas Frey on 01.02.19.
//

import Foundation

/// Represents a set of NBT tags
public struct JFNBT: Decodable, CustomStringConvertible {
    
    /// The dictionary containing the nbt data
    public let data: [String: JFNestedDictionary]
    
    public var description: String {
        return description()
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        self.data = try container.decode([String: JFNestedDictionary].self)
    }
    
    private enum CodingKeys: CodingKey {}
    
    
    /// Recursive function that creates an description for this nbt tag
    ///
    /// - Parameters:
    ///   - level: The level of recursion, used to determine the spacing
    /// - Returns: The description of this NBT tag
    private func description(level: Int = 0) -> String {
        let spacing = Array(repeating: " ", count: level * 4).joined(separator: "")
        var desc = ""
        for tuple in data {
            let key = tuple.key.replacingOccurrences(of: ":[0-9]+", with: "", options: .regularExpression)
            desc += spacing + key + ": "
            if tuple.value.dictionary != nil {
                desc += "{\n"
                desc += description(level: level + 1)
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

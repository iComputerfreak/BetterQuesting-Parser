//
//  JFNestedDictionary.swift
//  BetterQuestingParser
//
//  Created by Jonas Frey on 11.02.19.
//

import Foundation

/// Represents a dictionary with variable depths. Each value is either a String or another JFNestedDictionary
public class JFNestedDictionary: Decodable, CustomStringConvertible {
    
    public let dictionary: [String: JFNestedDictionary]?
    public let rawValue: CustomStringConvertible?
    
    public var description: String {
        return rawValue?.description ?? dictionary!.description
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        
        // This class gets a dictionary or a string
        self.dictionary = try? container.decode([String: JFNestedDictionary].self)
        
        // Decode the raw value
        if let string = try? container.decode(String.self) {
            rawValue = string
        } else if let int = try? container.decode(Int.self) {
            rawValue = int
        } else if let float = try? container.decode(Float.self) {
            rawValue = float
        } else if let bool = try? container.decode(Bool.self) {
            rawValue = bool
        } else {
            rawValue = nil
        }
        
        if dictionary == nil && rawValue == nil {
            throw DecodingError.dataCorruptedError(in: container, debugDescription: "JFNestedDictionary found neither a dictionary nor a raw value")
        }
    }
    
    private enum CodingKeys: CodingKey {}
    
}

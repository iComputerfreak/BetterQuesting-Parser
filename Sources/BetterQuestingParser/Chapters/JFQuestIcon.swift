//
//  JFQuestIcon.swift
//  BetterQuestingParser
//
//  Created by Jonas Frey on 09.02.19.
//

import Foundation

public struct JFQuestIcon: Decodable {
    
    public let size: Int
    public let x: Int
    public let y: Int
    public let questID: Int
    
    private enum CodingKeys: String, CodingKey {
        case size
        case x
        case y
        case questID = "id"
    }
    
}

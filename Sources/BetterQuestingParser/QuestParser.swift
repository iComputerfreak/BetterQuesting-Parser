//
//  QuestParser.swift
//  BetterQuestingParser
//
//  Created by Jonas Frey on 08.02.19.
//

import Foundation

/// Represents a parser for parsing a BetterQuesting JSON file
public struct QuestParser {
    
    /// Parses the BetterQuesting 'DefaultQuests.json'
    ///
    /// - Parameter file: The path to the location of 'DefaultQuests.json'
    /// - Returns: The data parsed as an array of JFQuest items
    public static func getQuests(file: String) -> [JFQuest]? {
        
        do {
            // Read the file as Data (using utf8)
            guard let fileData = try String(contentsOfFile: file).data(using: .utf8) else {
                // data is nil
                throw NSError(domain: "Could not create data from file contents", code: 2, userInfo: nil)
            }
            
            // Get the JSON Data as a dictionary
            guard let json = try JSONSerialization.jsonObject(with: fileData, options: []) as? [String: Any] else {
                // json could not be cast as [String: Any]
                throw NSError(domain: "JSON Data is invalid", code: 3, userInfo: nil)
            }
            
            // The array of quests (under the 'questDatabase' key)
            guard let database = json["questDatabase"] else {
                // questDatabase key not found
                throw NSError(domain: "JSON Data is not a valid BetterQuesting database", code: 4, userInfo: nil)
            }
            // Transform the JSON Data back to normal data for the JSONDecoder
            let databaseData = try JSONSerialization.data(withJSONObject: database, options: [])
            
            // The array of quests (under the 'questDatabase' key)
            guard let questLines = json["questLines"] else {
                // questDatabase key not found
                throw NSError(domain: "JSON Data is not a valid BetterQuesting database", code: 5, userInfo: nil)
            }
            // Transform the JSON Data back to normal data for the JSONDecoder
            let questLinesData = try JSONSerialization.data(withJSONObject: questLines, options: [])
            
            print("Decoding Quests...")
            let quests: [JFQuest] = try JSONDecoder().decode([JFQuest].self, from: databaseData)
            print("Decoded \(quests.count) quests")
            
            print("Decoding Chapters...")
            let chapters: [JFChapter] = try JSONDecoder().decode([JFChapter].self, from: questLinesData)
            print("Decoded \(chapters.count) chapters")
            
            // Assign chapters to quests
            for chapter in chapters {
                for quest in chapter.quests {
                    let i = quests.firstIndex { (q: JFQuest) -> Bool in
                        return q.questID == quest.questID
                    }
                    if let _ = i {
                        quests[i!].chapter = chapter
                    }
                }
            }
            
            return quests
            
        } catch let e as NSError {
            // A NSError has been thrown
            print(e.localizedDescription)
        } catch let e {
            // file could not be read
            // json could not be serialized
            // creating data with from json object not successful
            // decoding the quests failed
            print(e.localizedDescription)
        }
        
        return nil
    }
    
}

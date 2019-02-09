
import Foundation
import BetterQuestingParser

if let quests = QuestParser.getQuests(file: "/Users/jonasfrey/Desktop/DefaultQuests.json") {
    // Process the parsed quests
    print("Exporting Quests to HTML...")
    // TODO: Start export...
    let builder = HTMLBuilder(quests: quests)
    let html = builder.createRewardsSummary()
    do {
        try html.write(toFile: "/Users/jonasfrey/Desktop/quests.html", atomically: false, encoding: .utf8)
    } catch let e {
        print(e.localizedDescription)
        exit(1)
    }
    print("Quests exported")
}

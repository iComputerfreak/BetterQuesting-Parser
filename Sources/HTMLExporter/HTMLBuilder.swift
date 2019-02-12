//
//  HTMLBuilder.swift
//  BetterQuestingParser
//
//  Created by Jonas Frey on 08.02.19.
//

import Foundation
import BetterQuestingParser

public struct HTMLBuilder {
    
    // TODO: Fix encoding errors
    
    let quests: [JFQuest]
    
    public init(quests: [JFQuest]) {
        self.quests = quests
    }
    
    public func createRewardsSummary() -> String {
        
        let html = JFHTML(head: ["<link rel=\"stylesheet\" type=\"text/css\" href=\"style.css\">"])
        
        // html.append("<input type=\"text\" id=\"filterInput\" onkeyup=\"filterTable()\" placeholder=\"Filter..\">")
        
        // Filter function deactivated, because it was sooooo slow
        /*html.append(
            """
            <script>
            function filterTable() {
              // Declare variables
              var input, filter, table, tr, td, i, txtValue;
              input = document.getElementById("filterInput");
              filter = input.value.toUpperCase();
              table = document.getElementById("rewards");
              tr = table.getElementsByTagName("tr");
            
              // Loop through all table rows, and hide those who don't match the search query
              for (i = 0; i < tr.length; i++) {
                var matching = false;
                for (j = 0; j < tr[i].getElementsByTagName("td").length; j++) {
                  td = tr[i].getElementsByTagName("td")[j];
                  if (td) {
                    txtValue = td.textContent || td.innerText;
                    if (txtValue.toUpperCase().indexOf(filter) > -1) {
                      matching = true;
                      break;
                    }
                  }
                }
                if (matching) {
                  tr[i].style.display = "";
                } else {
                  tr[i].style.display = "none";
                }
              }
            }
            </script>
            """)*/
        
        html.openTable(["Amount", "Reward", "Quest Name", "Chapter", "NBT", "Type"], id: "rewards")
        
        var table = [[String]]()
        let nbtPlaceholder = "&#9432;"
        
        for quest in quests {
            for reward in quest.rewards {
                if let itemReward = reward as? JFItemReward {
                    for item in itemReward.items {
                        let nbt = "\(nbtPlaceholder)\n<code class=\"nbtdata\">\(item.nbt?.description ?? "")</code>"
                        table.append([item.amount.description,
                                          item.description,
                                          quest.properties.name,
                                          quest.chapter?.properties.name ?? "-",
                                          item.nbt != nil ? nbt : "",
                                          "Item"])
                    }
                } else if let choiceReward = reward as? JFChoiceReward {
                    for item in choiceReward.items {
                        let nbt = "\(nbtPlaceholder)\n<code class=\"nbtdata\">\(item.nbt?.description ?? "")</code>"
                        table.append([item.amount.description,
                                          item.description,
                                          quest.properties.name,
                                          quest.chapter?.properties.name ?? "-",
                                          item.nbt != nil ? nbt : "",
                                          "Choice"])
                    }
                } else {
                    // Set human readable type
                    var type = ""
                    if reward.type == .xp {
                        type = "XP"
                    } else if reward.type == .command {
                        type = "Command"
                    } else {
                        // This only gets executed when a new reward type has been added
                        assert(false, "A new reward type has been added without checking it in the HTMLBuilder")
                        // In case this happens in execution, the assertion will be skipped and the type will be set to the raw value
                        type = reward.type.rawValue
                    }
                    
                    table.append(["",
                                  reward.description,
                                  quest.properties.name,
                                  quest.chapter?.properties.name ?? "-",
                                  "",
                                  type])
                }
            }
        }
        
        // Sort after reward name
        table.sort { (line1: [String], line2: [String]) -> Bool in
            return line1[1].compare(line2[1]) == .orderedAscending
        }
        
        for line in table {
            html.addTableRow(line, classes: ["amount", "item", "name", "chapter", "nbt", "type"])
        }
        
        html.closeTable()
        
        html.finalize()
        return html.description
    }
    
}

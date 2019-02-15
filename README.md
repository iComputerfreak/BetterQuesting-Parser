# BetterQuestingParser

This tool takes the `DefaultQuests.json` file from [BetterQuesting](https://minecraft.curseforge.com/projects/better-questing) and parses it into a set of classes.

The idea behind this was to make the quest data easily processable using Swift.
You can then for example export the data using another format, put it into a MySQL database or create an HTML website out of it.

Contains a module that creates an HTML table out from the quest rewards.
[Demo for the Awakening Modpack](https://jonasfrey.de/awakening/rewards.html)
[Stylesheet used for the Demo](https://gist.github.com/iComputerfreak/b056e5486b91b218e0350904c5849f82)

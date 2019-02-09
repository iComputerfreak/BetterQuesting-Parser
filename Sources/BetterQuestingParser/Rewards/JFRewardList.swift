//
//  JFRewardList.swift
//  BetterQuestingParser
//
//  Created by Jonas Frey on 08.02.19.
//

import Foundation

/// Represents a list of rewards
public class JFRewardList: Decodable, Sequence {
    
    public typealias Iterator = IndexingIterator<[JFReward]>
    
    /// The list of rewards
    public let rewards: [JFReward]
    
    /// Creates a new JFRewardList containing a list of JFReward subclasses read from the given decoder
    /// Decodes every task in the matching subclass
    ///
    /// - Parameter decoder: The decoder to read from
    /// - Throws: if reading from the decoder fails, or if the data read is corrupted or otherwise invalid.
    public required init(from decoder: Decoder) throws {
        // decoder contains the container with the array of tasks (used only for getting the type)
        var rewardsArrayForType = try decoder.unkeyedContainer()
        var rewards = [JFReward]()
        
        // copy the container for the real decoding
        var rewardsArray = rewardsArrayForType
        while(!rewardsArrayForType.isAtEnd) {
            // get the next task as a nested container that is keyed by the TaskTypeKey enum (only the type key matters right now)
            let reward = try rewardsArrayForType.nestedContainer(keyedBy: RewardTypeKey.self)
            // get the type of the task
            let type = try reward.decode(JFReward.Types.self, forKey: RewardTypeKey.type)
            
            // decode the task again (in the init methods) now with all the keys
            switch type {
            case .item:
                rewards.append(try rewardsArray.decode(JFItemReward.self))
            case .xp:
                rewards.append(try rewardsArray.decode(JFXPReward.self))
            case .choice:
                rewards.append(try rewardsArray.decode(JFChoiceReward.self))
            case .command:
                rewards.append(try rewardsArray.decode(JFCommandReward.self))
            }
        }
        
        self.rewards = rewards
    }
    
    /// Contains the key for the type of a reward
    ///
    /// - type: the key that is used for the type of a reward
    private enum RewardTypeKey: String, CodingKey {
        case type = "rewardID"
    }
    
    public func makeIterator() -> JFRewardList.Iterator {
        return rewards.makeIterator()
    }
    
}

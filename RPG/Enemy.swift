//
//  Enemy.swift
//  RPG
//
//  Created by AADITYA NARVEKAR on 5/25/16.
//  Copyright © 2016 Aaditya Narvekar. All rights reserved.
//

import Foundation

class Enemy: Character {
    var loot: [String] {
        get {
            return ["Rusty Dagger", "Cracked Buckler"]
        }
    }
    
    var enemyType: String {
        return "Grunt"
    }
    
    func dropLoot() -> String? {
        if !isAlive {
            let rand = Int(arc4random_uniform(UInt32(self.loot.count)))
            return self.loot[rand]
        }
        
        return nil
    }
    
}
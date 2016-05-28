//
//  Kimara.swift
//  RPG
//
//  Created by AADITYA NARVEKAR on 5/25/16.
//  Copyright © 2016 Aaditya Narvekar. All rights reserved.
//

import Foundation

class Kimara: Enemy {
    let IMMUNE_MAX = 15
    
    override var loot: [String] {
        return ["Blood Diamond", "Rare Trident"]
    }
    
    override var  enemyType: String {
        get {
            return "Kimara"
        }
    }
    
    override func attemptAttack(attackPower: Int) -> Bool {
        if attackPower < IMMUNE_MAX {
            super.incrementHealingPower()
            return false
        } else {
            return super.attemptAttack(attackPower)
        }
    }
    
}
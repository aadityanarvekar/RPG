//
//  Player.swift
//  RPG
//
//  Created by AADITYA NARVEKAR on 5/25/16.
//  Copyright © 2016 Aaditya Narvekar. All rights reserved.
//

import Foundation

class Player: Character {
    private var _immunity: Int = 0
    var immunity: Int {
        get {
            return self._immunity
        }
        set {
            if newValue > 0 && newValue >= self._immunity {
                self._immunity = newValue
            }
        }
    }
      
    private var _name: String = "Player 1"
    var name: String {
        get {
            return self._name
        }
    }
    
    private var _inventory: [String] = [String]()
    var inventory: [String] {
        get {
            return self._inventory
        }
    }
    
    convenience init(name: String, hp: Int, attackPower: Int) {
        self.init(hp: hp, attackPower: attackPower)
        self._name = name
    }
    
    convenience init(name: String, immunity: Int, hp: Int, attackPower: Int) {
        self.init(hp: hp, attackPower: attackPower)
        self._name = name
        self._immunity = immunity
    }
    
    func collectLoot(loot: String) {
        self._inventory.append(loot)
    }
}
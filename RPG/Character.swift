//
//  Character.swift
//  RPG
//
//  Created by AADITYA NARVEKAR on 5/25/16.
//  Copyright © 2016 Aaditya Narvekar. All rights reserved.
//

import Foundation

class Character {
    private var _hp: Int = 100
    private var _attackPower: Int = 10
    
    
    var attackPower: Int {
        get {
            return self._attackPower
        }
    }
    
    var hp: Int {
        get {
            return self._hp
        }
        set {
            if newValue > 0 && newValue >= self._hp {
                self._hp = newValue
            }
        }
    }
    
    var isAlive: Bool {
        get {
            if self._hp <= 0 {
                return false
            } else {
                return true
            }
        }
    }
    
    init(hp: Int, attackPower: Int) {
        self._hp = hp
        self._attackPower = attackPower
    }
    
    func attemptAttack(attackPower: Int) -> Bool {
//        if self._hp >= 0 {
//            self._hp = self._hp - attackPower
//            return true
//        } else {
//            return false
//        }
        self._hp = self._hp - attackPower
        return true
    }
    
    func incrementHealingPower() {
        self.hp += 1
    }
    
}
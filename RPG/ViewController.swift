//
//  ViewController.swift
//  RPG
//
//  Created by AADITYA NARVEKAR on 5/25/16.
//  Copyright © 2016 Aaditya Narvekar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let DEVIL_WIZARD = "Devil Wizard"
    
    @IBOutlet weak var printLabel: UILabel!
    @IBOutlet weak var playerHpLbl: UILabel!
    @IBOutlet weak var enemyHpLbl: UILabel!
    @IBOutlet weak var enemyImg: UIImageView!
    @IBOutlet weak var chestBtn: UIButton!
    @IBOutlet weak var attackButton: UIButton!
    
    var player = Player!(nil)
    var enemy = Enemy!(nil)
    var droppedLoot: String?
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        initializeGame()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func generateRandomEnemy() -> Enemy {
        let rand = arc4random_uniform(2)
        if rand == 0 {
            return Kimara(hp: 75, attackPower: 10)
        } else {
            return DevilWizard(hp: 150, attackPower: 20)
        }
    }


    @IBAction func onChestTapped(sender: AnyObject) {
        
    }
    
    @IBAction func attackTapped(sender: AnyObject) {
        printLabel.text = "\(enemy.enemyType) attacked!"
        let successfulAttack = enemy.attemptAttack(player.attackPower)
        if !successfulAttack {
            printLabel.text = "Attack unsucessful!"
        }
        
        enemyHpLbl.text = "\(enemy.hp) HP"
        
        if let _ = enemy.dropLoot() {
            droppedLoot = enemy.dropLoot()
            enemyImg.hidden = true
            chestBtn.hidden = false
            enemyHpLbl.text = ""
            attackButton.enabled = false
            printLabel.text = "\(enemy.enemyType) dead!"
        }
    }
    
    @IBAction func chestBtnTapped(sender: AnyObject) {
        if let _ = droppedLoot {
            player.collectLoot(droppedLoot!)
            printLabel.text = "\(droppedLoot!) collected!"
            chestBtn.hidden = true
        }
        NSTimer.scheduledTimerWithTimeInterval(2.0, target: self, selector: #selector(ViewController.initializeGame), userInfo: nil, repeats: false)
    }
    
    func initializeGame() {
        player = Player(name: "Aadi War Lord", hp: 300, attackPower: 20)
        playerHpLbl.text = "\(player.hp) HP"
        
        enemy = generateRandomEnemy()
        if enemy.enemyType == DEVIL_WIZARD {
            enemyImg.image = UIImage(named: "enem2")
        } else {
            enemyImg.image = UIImage(named: "enem1")
        }
        enemyImg.hidden = false
        enemyHpLbl.text = "\(enemy.hp) HP"
        
        chestBtn.hidden = true
        attackButton.enabled = true
        printLabel.text = "\(enemy.enemyType) appears!"
    }
    
}


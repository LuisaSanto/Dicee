//
//  ViewController.swift
//  Dicee
//
//  Created by Luisa Santo on 2/20/19.
//  Copyright © 2019 Luisa Santo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    private var baseSourceName: String = "dice"
    private var randomDiceIndex1: Int = 0
    private var randomDiceIndex2: Int = 0

    @IBOutlet weak var diceImageView1: UIImageView!
    @IBOutlet weak var diceImageView2: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateDiceImages()
    }
 
    @IBAction func rollButtonPressed(_ sender: UIButton) {
        updateDiceImages()
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        updateDiceImages()
    }
    
    private func updateDiceImages() {
        randomDiceIndex1 = Int.random(in: 1 ... 6)
        randomDiceIndex2 = Int.random(in: 1 ... 6)
        diceImageView1.image = UIImage.init(named: "\(baseSourceName)\(randomDiceIndex1)")
        diceImageView2.image = UIImage.init(named: "\(baseSourceName)\(randomDiceIndex2)")
    }
    
}

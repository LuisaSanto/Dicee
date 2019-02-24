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
    @IBOutlet weak var diceLogo: UIImageView!
    @IBOutlet weak var rollButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        diceLogo.layer.cornerRadius = 8.0 // take this off
        diceLogo.clipsToBounds = true // take this off
        rollButton.layer.cornerRadius = 20.0 // take this off
        rollButton.clipsToBounds = true // take this off
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
        rotateImage(image: diceImageView1, degrees: CGFloat.pi*2)
        diceImageView1.image = UIImage.init(named: "\(baseSourceName)\(randomDiceIndex1)")
        rotateImage(image: diceImageView2, degrees: CGFloat.pi*2)
        diceImageView2.image = UIImage.init(named: "\(baseSourceName)\(randomDiceIndex2)")
    }
    
    private func rotateImage(image: UIView, degrees: CGFloat){
        let rotationAnimation = CABasicAnimation(keyPath: "transform.rotation")
        rotationAnimation.fromValue = 0.0
        rotationAnimation.toValue = degrees
        rotationAnimation.duration = 0.5
//        rotationAnimation.repeatCount = 2
        image.layer.add(rotationAnimation, forKey: "rotationAnimation")
    }
    
}

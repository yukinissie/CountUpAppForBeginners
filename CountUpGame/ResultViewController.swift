//
//  ResultViewController.swift
//  CountUpAppForBeginners
//
//  Created by 西勇樹 on 2020/08/13.
//  Copyright © 2020 TanakaHirokazu. All rights reserved.
//

import UIKit

var highScore = 0

class ResultViewController: UIViewController {
    
    var passdata = 0

    @IBOutlet weak var resultScoreLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        resultScoreLabel.text = String(passdata)
        updateHighScore()
    }
    
    @IBOutlet weak var highScoreLabel: UILabel!
    func updateHighScore() {
        if passdata > highScore {
            highScore = passdata
        }
        highScoreLabel.text = String(highScore)
    }
}

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
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func retry(_ sender: Any) {
        performSegue(withIdentifier: "retry", sender: nil)
    }
}

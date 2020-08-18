//
//  ViewController.swift
//  CountUpAppForBeginners
//
//  Created by TanakaHirokazu on 2020/08/04.
//  Copyright © 2020 TanakaHirokazu. All rights reserved.
//

import UIKit
import GameplayKit

class ViewController: UIViewController {
    // 乱数使う
    var randomCount = GKRandomDistribution(lowestValue: -20, highestValue: 20)
    // Timer使う
    var timer: Timer?
    // 制限時間（秒）
    var timeLimitOfSeconds = 30
    // カウント初期化
    var count = 0
    var question = 0
    var score = 0

    // Outlet
    //UIパーツのラベル
    @IBOutlet var playView: UIView!
    
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.timer = Timer.scheduledTimer(timeInterval: 1.0,
                         target: self,
                         selector: #selector(ViewController.timerUpdate),
                         userInfo: nil,
                         repeats: true)
        
        randomQuestion()
        changeQuestionTextColor()

        countLabel.text = String(self.count)
        countLabel.textColor = UIColor.blue
    }
    
    // Action
    @IBAction func countUpButton(_ sender: Any) {
        //+ボタンを押すとラベルの文字をカウントアップ
        self.count += 1
        countLabel.text = String(self.count)
        
        //カウントにあわせて文字の色を変更
        changeCountTextColor()
        
        checkNumber()
    }
    @IBAction func countDounButton(_ sender: Any) {
         //-ボタンを押すとラベルの文字をカウントダウン
        self.count -= 1
        countLabel.text = String(self.count)
        
       //カウントにあわせて文字の色を変更
        changeCountTextColor()
        
        checkNumber()
    }
    
    // Timer.scheduledTimer()によって毎秒呼ばれる。
    @objc func timerUpdate() {
        self.timeLimitOfSeconds -= 1
        self.timerLabel.text = String(self.timeLimitOfSeconds)
        //self.count値をコンソールへ出力
        print(self.timeLimitOfSeconds)
        if self.timeLimitOfSeconds == 0 {
            self.goResultView()
            self.timer?.invalidate()
        }
    }

    //カウントにあわせて文字の色を変更するメソッドを定義
    func changeCountTextColor() {
        if count >= 10 {
            countLabel.textColor = UIColor.green
        } else if count < 0 {
            countLabel.textColor = UIColor.red
        } else {
            countLabel.textColor = UIColor.blue
        }
    }
    //カウントにあわせて文字の色を変更するメソッドを定義
    func changeQuestionTextColor() {
        if question >= 10 {
            questionLabel.textColor = UIColor.green
        } else if question < 0 {
            questionLabel.textColor = UIColor.red
        } else {
            questionLabel.textColor = UIColor.blue
        }
    }
    

    
    func goResultView() {
        performSegue(withIdentifier: "goResultView", sender: nil)
    }
    
    func randomQuestion() {
        question = randomCount.nextInt()
        questionLabel.text = String(question)
    }
    
    func checkNumber() {
        if self.count == question {
            self.score += 1
            scoreLabel.text = String(self.score)
            randomQuestion()
            changeQuestionTextColor()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     //引数segueの中に画面遷移に関する情報が含まれている。
        if segue.identifier == "goResultView" {
           let nextVC = segue.destination as! ResultViewController
            nextVC.passdata = self.score
        }
    }
}


//
//  PlayViewController.swift
//  CountUpAppForBeginners
//
//  Created by TanakaHirokazu on 2020/08/04.
//  Copyright © 2020 TanakaHirokazu. All rights reserved.
//

import UIKit
import GameplayKit

class PlayViewController: UIViewController {
    // 乱数使う
    var randomCount = GKRandomDistribution(lowestValue: -20, highestValue: 20)
    // Timer使う
    var timer = Timer()
    
    //processing count
    var timeLimitOfSeconds = 10
    //数字を格納する場所
    var count = 0
    var question = 0
    var point = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        randomQuestion()

        countLabel.text = String(self.count)
        countLabel.textColor = UIColor.blue
        
        
        //timer処理
        gameTimer()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     //引数segueの中に画面遷移に関する情報が含まれている。
        if segue.identifier == "goResultView" {
           let nextVC = segue.destination as! ResultViewController
            nextVC.passdata = self.point
        }
    }
    
    // Outlet
    //UIパーツのラベル
    @IBOutlet var playView: UIView!
    
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var pointLabel: UILabel!
    
    // Action
    @IBAction func countUpButton(_ sender: Any) {
        //+ボタンを押すとラベルの文字をカウントアップ
        self.count += 1
        countLabel.text = String(self.count)
        
        //カウントにあわせて文字の色を変更
        changeTextColor()
        
        checkNumber(number: self.count)
    }
    @IBAction func countDounButton(_ sender: Any) {
         //-ボタンを押すとラベルの文字をカウントダウン
        self.count -= 1
        countLabel.text = String(self.count)
        
       //カウントにあわせて文字の色を変更
        changeTextColor()
        
        checkNumber(number: self.count)
    }

    //カウントにあわせて文字の色を変更するメソッドを定義
    func changeTextColor() {
        if count >= 10 {
            countLabel.textColor = UIColor.green
        } else if count < 0 {
            countLabel.textColor = UIColor.red
        } else {
            countLabel.textColor = UIColor.blue
        }
    }
    
    func goResultView() {
        performSegue(withIdentifier: "goResultView", sender: nil)
    }
    
    func gameTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 1.0,
                                     repeats: true,
                                     block: { (timer) in
            self.timerLabel.text = String(self.timeLimitOfSeconds)
            self.timeLimitOfSeconds -= 1
            //self.count値をコンソールへ出力
            print(self.timeLimitOfSeconds)
            if self.timeLimitOfSeconds == -1 {
                self.goResultView()
            }
        })
    }
    
    func randomQuestion() {
        question = randomCount.nextInt()
        questionLabel.text = String(question)
    }
    
    func checkNumber(number: Int) {
        if number == question {
            point += 1
            pointLabel.text = String(point)
            randomQuestion()
        }
    }
}


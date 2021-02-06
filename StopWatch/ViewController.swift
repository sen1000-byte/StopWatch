//
//  ViewController.swift
//  StopWatch
//
//  Created by Chihiro Nishiwaki on 2021/02/06.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var label: UILabel!
    @IBOutlet var judgeLabel: UILabel!
    var count: Float! = 0.0
    var timer: Timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = "0.00"
        judgeLabel.text = "Count 10 sec"

        // Do any additional setup after loading the view.
    }

    @IBAction func start() {
        //タイマーが動いていない時に動かす
        if !timer.isValid {
            timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(self.up), userInfo: nil, repeats: true)
        }
        
    }
    
    @IBAction func stop() {
        if timer.isValid {
            timer.invalidate()
            judge()
        }
    }

    @objc func up() {
        count = count + 0.01
        label.text = String(format: "%0.2f", count)
    }
    
    @IBAction func reset() {
        if timer.isValid {
            timer.invalidate()
        }
        count = 0.00
        label.text = String(format: "%.2f", count)
        judgeLabel.text = "Count 10 sec"
    }
    
    func judge (){
        if count >= 9.8 && count <= 10.20{
            judgeLabel.text = "PERFECT"
        }else if count >= 9.7 && count <= 10.30{
            judgeLabel.text = "GREAT"
        }else if count >= 9.6 && count <= 10.40{
            judgeLabel.text = "GOOD"
        }else{
            judgeLabel.text = "BAD"
        }
    }
}


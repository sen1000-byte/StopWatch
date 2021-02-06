//
//  ViewController.swift
//  StopWatch
//
//  Created by Chihiro Nishiwaki on 2021/02/06.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var label: UILabel!
    var count: Float! = 0.0
    var timer: Timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = "0.00"
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

        }
    }

    @objc func up() {
        count = count + 0.01
        label.text = String(format: "%0.2f", count)
    }
    
    @IBAction func reset() {
        count = 0.00
        label.text = String(format: "%.2f", count)
    }
}


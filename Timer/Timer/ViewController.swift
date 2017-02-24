//
//  ViewController.swift
//  Timer
//
//  Created by ZhangJianglai on 2/16/17.
//  Copyright © 2017 ZhangJianglai. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var timer = Timer()
    @IBOutlet weak var display: UILabel!
    var startTime = TimeInterval()
    
    func updateTime() {
        var currentTime = Date.timeIntervalSinceReferenceDate
        var elapsedTime: TimeInterval = currentTime - startTime
        let minute = elapsedTime / 60.0
        let second = elapsedTime
        elapsedTime -= TimeInterval(second)
        let fract = elapsedTime * 100
        
        let double1 = String(format: "%02d", minute)
        let double2 = String(format: "%02d", second)
        let double3 = String(format: "%02d", fract)
        
        display.text = "\(double1):\(double2):\(double3)"
        
    }
    
//    func increment(_timer: Timer) {
//        let timeString = String(format: "%02d:%02d.%d", double1, double2, double3)
//        Stopwatch.text = String(time)
//    }
    
    // UIButton with label start. Initiates the timer, update the startTime.
    @IBAction func Start(_ sender: UIButton) {
        let aSelector : Selector = #selector(ViewController.updateTime)
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self,
                             selector: aSelector,
                             userInfo: nil, repeats: true)
        startTime = Date.timeIntervalSinceReferenceDate
    }
    
    // UIButton with label stop. Invalidates the timer.
    @IBAction func Stop(_ sender: UIButton) {
        timer.invalidate()
    }

}


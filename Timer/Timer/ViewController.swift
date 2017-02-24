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
    var startTime:Date?
    func start() {
        startTime = Date()
    }
    
    func updateTime() {
        var currentTime = -1 * (startTime?.timeIntervalSinceNow)!
        
//        var elapsedTime: TimeInterval = currentTime - startTime
        let minute = Int(floor(currentTime / 60.0))
        print(minute)
        let second = Int(round(currentTime).truncatingRemainder(dividingBy: 60))
//        currentTime -= TimeInterval(second)
        print(second)
        let fract = Int((currentTime.truncatingRemainder(dividingBy: 1)) * 100)
        
//        let double1 = String(format: "%02d", minute)
//        let double2 = String(format: "%02d", second)
//        let double3 = String(format: "%d", fract)
        print(fract)
        let timeString = String(format: "%02d:%02d.%d", minute, second, fract)
        display.text = timeString
        print(timeString)
        print(display.text)
        
    }
    
    // UIButton with label start. Initiates the timer, update the startTime.
    @IBAction func Start(_ sender: UIButton) {
        let aSelector : Selector = #selector(ViewController.updateTime)
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self,
                                     selector: aSelector,
                                     userInfo: nil, repeats: true)
        start()
    }
    
    // UIButton with label stop. Invalidates the timer.
    @IBAction func Stop(_ sender: UIButton) {
        timer.invalidate()
    }

}


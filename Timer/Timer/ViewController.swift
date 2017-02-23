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
    
    func increment(_timer: Timer) {
        let timeString = String(format: "%02d:%02d.%d", double1, double2, double3)
//        Stopwatch.text = String(time)
    }
    
    @IBAction func Start(_ sender: UIButton) {
        Timer.scheduledTimer(timeInterval: 0.1, target: self,
                             selector: #selector(ViewController.increment(_:)),
                             userInfo: nil, repeats: true)
        Stopwatch.initiate(timer)
    }
    
    @IBAction func Stop(_ sender: UIButton) {
        timer.invalidate()
    }

}


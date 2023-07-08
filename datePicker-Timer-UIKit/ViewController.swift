//
//  ViewController.swift
//  datePicker-Timer-UIKit
//
//  Created by DA MAC M1 157 on 2023/07/08.
//

import UIKit

class ViewController: UIViewController {

    //ui objects
    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var timerPicker: UIDatePicker!
    
    var after = Int()
    var remind = Int()
    var  counterInterval = TimeInterval()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        counterInterval = timerPicker.countDownDuration
        remind = Int(counterInterval)
        after = Int(counterInterval) - remind / 60
        Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    
    @objc func updateTimer() {
        
        //called every 1 sec to update timer
        after -=  1
        
        // calculating hours, mins, secs
        let hours = after / (60 * 60)
        let mins = (after/60) - (hours*60)
        let secs = (after - (60 * mins) - (60 * hours * 60))
        
        let timerString = String.init(format: "%2u : %2u : %2u  ", hours, mins, secs)
        
        myLabel.text = timerString
        
    }

}


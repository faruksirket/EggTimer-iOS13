//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let eggTimes = ["Soft": 5, "Medium": 7,"Hard": 12]
    var seconds = 0
    var timer = Timer()
    override func viewDidLoad() {
        super.viewDidLoad()
       

    }


    @IBAction func keyPressed(_ sender: UIButton) {
        timer.invalidate()
        let hardness = sender.currentTitle!
        seconds = self.eggTimes[hardness]! * 60
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (Timer) in
            if self.seconds > 0 {
                print ("\(self.seconds) seconds")
                self.seconds -= 1
                } else {
                    Timer.invalidate()
                }
            }
        
    }
    
    
}

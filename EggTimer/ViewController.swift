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
    override func viewDidLoad() {
        super.viewDidLoad()
       

    }


    @IBAction func keyPressed(_ sender: UIButton) {
        let hardness = sender.currentTitle!
        print(eggTimes[hardness] ?? "Soft")
        var seconds = self.eggTimes[hardness]! * 60
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (Timer) in
                if seconds > 0 {
                    print ("\(seconds) seconds")
                   seconds -= 1
                } else {
                    Timer.invalidate()
                }
            }
        
    }
    
}

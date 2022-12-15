//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    @IBOutlet var progressBar: UIProgressView!
    @IBOutlet var eggTimerLabel: UILabel!
    @IBOutlet var timerProgressLabel: UILabel!
    let eggTimes = ["Soft": 5, "Medium": 7,"Hard": 12]
    var totalTime = 0
    var secondsPassed = 0
    var timer = Timer()
    var player: AVAudioPlayer?
    override func viewDidLoad() {
        super.viewDidLoad()
       

    }


    @IBAction func keyPressed(_ sender: UIButton) {
        timer.invalidate()
        let hardness = sender.currentTitle!
        totalTime = eggTimes[hardness]!
        progressBar.progress = 0.0
        secondsPassed = 0
        eggTimerLabel.text = hardness
        timerProgressLabel.text = "Time to complete"
        progressTimer()
        
    }
    func progressTimer(){
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (Timer) in
            if self.secondsPassed <= self.totalTime {
                let percentageProgress = Float(self.secondsPassed) / Float(self.totalTime)
                self.progressBar.progress = percentageProgress
                self.secondsPassed += 1
                self.timerProgressLabel.text = "\(self.secondsPassed) seconds"
                } else {
                    self.eggTimerLabel.text = "Done!"
                    self.timerProgressLabel.text = "Completed!"
                    self.playSound()
                    Timer.invalidate()
                }
            }
    }
    func playSound() {
        guard let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3") else { return }

        do {
           
            /* The following line is required for the player to work on iOS 11. Change the file type accordingly*/
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)

           
            guard let player = player else { return }

            player.play()

        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    
}

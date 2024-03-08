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
    
    let eggTimes = ["Soft": 3,"Medium": 4,"Hard": 4]
    var timer = Timer()
    var totalTime = 0
    var secondsPassed = 0
    var player : AVAudioPlayer!
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        secondsPassed = 0
        progressBar.progress = 0.0
        timer.invalidate()
        let hardness = sender.currentTitle
        totalTime = eggTimes[hardness!]!
        updateUI.text = hardness
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
        

    }
    
    @objc func updateCounter() {
        //example functionality
        if totalTime > secondsPassed{
            var percentage = Float(Float(secondsPassed)/Float(totalTime))
            progressBar.progress = (percentage)
            print(percentage)
            secondsPassed += 1
        } else {
            updateUI.text = "Completed"
            timer.invalidate()
            var percentage = Float(Float(secondsPassed)/Float(totalTime))
            progressBar.progress = (percentage)
            
            let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
            player = try! AVAudioPlayer(contentsOf: url!)
            player.play()
        }
    }
    
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var updateUI: UILabel!
}

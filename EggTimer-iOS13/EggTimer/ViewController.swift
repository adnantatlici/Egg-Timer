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
    
    @IBOutlet weak var timerView: UIProgressView!
    
    let eggTimes = ["Soft": 5 , "Medium": 7 , "Hard": 12]
    
    
    @IBOutlet weak var timerLabel: UILabel!
   
    
    var timer = Timer()
    var totalTime = 0
    var secondsPassed = 0
    var player: AVAudioPlayer?
        
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        timer.invalidate()
        let hardness = sender.currentTitle!
        totalTime = eggTimes[hardness]!
    
         timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        
        timerView.progress = 0.0
        secondsPassed = 0
        timerLabel.text = hardness
        }
    
    
    @objc func updateTimer() {
        
        if secondsPassed < totalTime{
            
            secondsPassed += 1
            timerView.progress = Float(secondsPassed) / Float(totalTime)

        } else {
               timer.invalidate()
               timerLabel.text = "Finish!"
               
            
            let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
                        player = try! AVAudioPlayer(contentsOf: url!)
                        player?.play()

           }
        
        

        
    }
    

    
        }

    

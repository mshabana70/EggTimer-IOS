//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Modified by Mahmoud Shabana on 06/04/20.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    /* Rather than use 3 constants that hold one piece of data
    let softTime = 5
    let mediumTime = 8
    let hardTime = 12
    */
    
    // We can create a dictionary to hold the three values for our egg timer
    let eggTimes = ["Soft": 3, "Medium": 4, "Hard": 7]
    
    var secondsRemaining = 60
    var timer = Timer()
    var totalTime = 0
    var secondsPassed = 0
    
    var player: AVAudioPlayer!
    
    @IBOutlet weak var eggLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        // The output of eggTimes[hardness] is an optional (Int?), must unwrap in print statement
        //print(eggTimes[hardness]!)
        
        /* Checking values with IF/ELSE
        if hardness == "Soft" {
            print(softTime)
        } else if hardness == "Medium" {
            print(mediumTime)
        } else if hardness == "Hard" {
            print(hardTime)
        } else {
            print("Error in If statement")
        }*/
        
        /*Checking values with Switch Case
        switch hardness {
        case "Soft":
            print(softTime)
        case "Medium":
            print(mediumTime)
        case "Hard":
            print(hardTime)
        default:
            print("Error in If statement")
        }*/
        
        //If a new button is pressed, then the timer is reset to the value that secondsRemaining has changed to
        //without speeding up the countdown.
        timer.invalidate()
        
        
        let hardness = sender.currentTitle! // Soft, Medium, Hard
        
        // setting the starting time to the seconds that is paired with key "hardness" returns
        totalTime = eggTimes[hardness]!
        progressBar.progress = 0.0
        secondsPassed = 0
        eggLabel.text = hardness
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
        }
    
        @objc func updateCounter() {
            if secondsPassed < totalTime {
                print("\(secondsPassed) seconds.")
                
                secondsPassed += 1
                progressBar.progress = Float(secondsPassed) / Float(totalTime)
                //print(Float(secondsPassed) / Float(totalTime))
                //print(Float(secondsPassed / totalTime))
            } else {
                timer.invalidate()
                self.eggLabel.text = "DONE!"
                let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
                player = try! AVAudioPlayer(contentsOf: url!)
                player.play()
            }
        }
    
        
    }
    



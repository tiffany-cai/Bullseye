
//
//  ViewController.swift
//  Bull's Eye
//
//  Created by Tiffany Cai on 2/3/20.
//  Copyright © 2020 Tiffany Cai. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var currentValue: Int = 50
    var targetValue = 0
    var score = 0
    var round = 0
    //so first step when connecting labels, is to create a var. you do not have to incude name of data type. the add an outlet and connect it.
    
    @IBOutlet weak var slider: UISlider!
    //this connects the slider. control click the slider, then click the circle on referencing outlets an drag it to view controller.  this connects the slider object and the view controller slider.
    //it no matters what u choose for the initial value of the slider in the interface builder. whe nthe app starts the current value will always correspond to that setting
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    //so for outlets, you type this first. name it what you want. then connect it from the storyboard to the view controller
    @IBOutlet weak var roundLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startNewGame()
        // Do any additional setup after loading the view.
        
        //editing the slider, not reflected in storyboard
        let thumbImageNormal = UIImage(named: "SliderThumb-Normal")!
        slider.setThumbImage(thumbImageNormal, for: .normal)
        let thumbImageHighlighted = UIImage(named: "SliderThumb-Highlighted")!
        slider.setThumbImage(thumbImageHighlighted, for: .highlighted)
        let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
        let trackLeftImage = UIImage(named: "SliderTrackLeft")!
        let trackLeftResizable = trackLeftImage.resizableImage(withCapInsets: insets)
        slider.setMinimumTrackImage(trackLeftResizable, for: .normal)
        let trackRightImage = UIImage(named: "SliderTrackRight")!
        let trackRightResizable = trackRightImage.resizableImage(withCapInsets: insets)
        slider.setMaximumTrackImage(trackRightResizable, for: .normal)
    }

    @IBAction func showAlert() {
        
        //let alert = UIAlertController(title: "Hi, Bissss", message: "This is my first app!", preferredStyle: .alert)
        //let action = UIAlertAction(title: "Awesome", style: .default, handler: nil)
        //alert.addAction(action)
        
        let difference = abs(targetValue - currentValue)
        let points = 100 - difference
        //var points = 100 - difference //so we can do bonus points
        //score += points //bc we are changing point value below, this line gets moved down
        var bonus = 0
        
        //change title of alert based on how player did
        let title: String //declared explicitly as string constant
        //var title = "" //this works too, but do you really need a varible? constants are preferable
        if difference == 0 {
            title = "PERFECT! WOOHOO!"
            //points += 100
            bonus = 100
        } else if difference < 5 {
            title = "Wow, you almost had it."
            //points += 50
            bonus = 50
        } else if difference < 10 {
            title = "Pretty good!"
        } else if difference < 15 {
            title = "Not bad..you can do better."
        } else {
            title = "Not even close..."
        }
        score += points + bonus
        
        let message = "You scored \(points) points & \(bonus) bonus points."
        //let message = "The value of the slider is: \(currentValue)" + "\nThe target value is: \(targetValue)"
        //let alert = UIAlertController(title: "Hello, World!", message: message, preferredStyle: .alert) //changed
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert) //changed
        let action = UIAlertAction(title: "OK", style: .default, handler: {_ in self.startNewRound() })
        //we had handler = nil, which means that nothing happens, same thing as no value. we changed it so that it starts a new round after clicking ok and dismissing the alert
        alert.addAction(action)
        present(alert, animated:true, completion: nil)
        
        //startNewRound() //removed bc we have it in let action
    }
    
    //slider value based on slider
    @IBAction func sliderMoved(_ slider: UISlider) {
        currentValue = lroundf(slider.value)
        //print("The Value of the slider is now: \(slider.value)")
    }
    
    //calls start new game function.
    @IBAction func startOver() {
        startNewGame()
    }
    
    //updates the labels on the screen
    func updateLabels() {
        targetLabel.text = "\(targetValue)"
        scoreLabel.text = "\(score)"
        //could also say String(score) or String(targetValue)
        roundLabel.text = "\(round)"
    }
    
    //starts new round
    func startNewRound() {
        round += 1;
        targetValue = Int.random(in:1...100)
        currentValue = 50
        slider.value = Float(currentValue)
        updateLabels()
    }
    
    //starts a new game, score and round goes to 0
    func startNewGame() {
        score = 0
        round = 0
        startNewRound()
    }
}


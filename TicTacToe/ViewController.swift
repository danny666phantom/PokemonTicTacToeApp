//
//  ViewController.swift
//  TicTacToe
//
//  Created by [ r∆ven ] on 3/27/16.
//  Copyright © 2016 Salt Lake Community College. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // 1 = player X : 2 = player 0
    var activePlayer = 1    // Keeps track of current player
    var xScore = 0
    var oScore = 0
    var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]  // Each occurance is a square on the board.
    var squareValue = [1, 2, 4, 8, 16, 32, 64, 128, 256]
    
    var winsArray = [7, 56, 448, 73, 146, 292, 273, 84]
        
    var counter = 1
    var counterX = 1
    var timer = NSTimer()   // Empty timer - used for STOP MOTION animation.
    var timerX = NSTimer()  // Empty timer - used for STOP MOTION animation.
    var isAnimating = true
    var isAnimatingX = true
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var oPokemon: UIImageView!
    @IBOutlet weak var xPokemon: UIImageView!
    
    @IBOutlet weak var xPlayer: UITextField!
    @IBOutlet weak var oPlayer: UITextField!
    @IBOutlet weak var winner: UITextField!

    @IBAction func buttonPressed(sender: AnyObject) {
        
        var image = UIImage()
        
        // Sender.tag is 0-8 depending on button pressed.
        // Only allow each button to be pressed once!
        if gameState[sender.tag] == 0
        {
            if activePlayer == 1 {
        
                image = UIImage(named: "x1.png")!
                xScore = xScore + squareValue[sender.tag]
                xPlayer.text = "\(xScore)"
                activePlayer = 2
            
            } else {
        
                image = UIImage(named: "o1.png")!
                oScore = oScore + squareValue[sender.tag]
                oPlayer.text = "\(oScore)"
                activePlayer = 1
            
            }
            
            gameState[sender.tag] = 1
            sender.setImage(image, forState: .Normal)
        }
        
    // Check for a winner.
        for (var i = 0; i < winsArray.count; i++){
            
            // Compare the wins Array occurance bitwise to the current score.
            if ((winsArray[i] & xScore) == winsArray[i]){
            
                winner.text = "X Wins. Go Charzard!"
            }
            if ((winsArray[i] & oScore) == winsArray[i]){
                
                winner.text = "O Wins. Go Miu!"
            }
            
        }

    }
    
    @IBAction func animateImageX(sender: AnyObject) {
        
        if isAnimatingX == true {
            
            timerX.invalidate()
            
            isAnimatingX = false
            
        } else {
            
            timerX = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: Selector("doAnimationX"), userInfo: nil, repeats: true)
            
            isAnimatingX = true
            
        }
    }
    
    @IBAction func animageImage(sender: AnyObject) {
        
        if isAnimating == true {
            
            timer.invalidate()
            
            isAnimating = false
            
        } else {
            
            timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: Selector("doAnimation"), userInfo: nil, repeats: true)
            
            isAnimating = true
            
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func doAnimation() {
        
        if counter == 5{
            counter = 1
        } else {
            counter++
        }
        oPokemon.image = UIImage(named: "o\(counter).png") // Custom image animation for Trainer O.
        
    }

    func doAnimationX() {
    
        if counterX == 5{
            counterX = 1
        } else {
            counterX++
        }
        xPokemon.image = UIImage(named: "x\(counter).png") // Custom image animation for Trainer O.
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

            
}


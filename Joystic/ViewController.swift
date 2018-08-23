//
//  ViewController.swift
//  Joystic
//
//  Created by Sergey Nikolaev on 22/08/2018.
//  Copyright © 2018 Sergey Nikolaev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var indicateJoyPosition: UITextView!
    
    @IBOutlet weak var joyView: UIView!
    @IBOutlet weak var joy: UIImageView!
    
    @IBOutlet weak var shuttle: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let joyMargins:CGFloat = 20
        
        indicateJoyPosition.frame = CGRect(x: 0, y: 30, width: view.bounds.width, height: 100)
        
        joyView.frame = CGRect(x: view.frame.origin.x + joyMargins, y: view.bounds.height - joyView.bounds.height - joyMargins, width: 100, height: 100)
        joy.frame = CGRect(x: joyView.bounds.width/2 - joy.bounds.width/2, y: joyView.bounds.height/2 - joy.bounds.height/2, width: 30, height: 30)
        
        shuttle.frame = CGRect(x: view.bounds.width/2 - shuttle.bounds.width/2, y: view.bounds.height/2 - shuttle.bounds.height/2, width: 40, height: 40)
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if let touch = touches.first {
            
            let touchJoy = touch.location(in: joyView)
            joy.center = touchJoy
            
            ofcetJoyPosition()
            
        }
        
        
        super.touchesBegan(touches, with: event)
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        joy.frame.origin = CGPoint(x: joyView.bounds.width/2 - joy.bounds.width/2, y: joyView.bounds.height/2 - joy.bounds.height/2)
        
        changePosition(position: "CENTR")
        
        super.touchesBegan(touches, with: event)
        
    }
    
    
    func ofcetJoyPosition() {
        
        print("Joy view bounds - \(joyView.bounds)")
        print("Joy origins - \(joy.frame.origin)")
        
        let joyOfset = joy.bounds.width/2
        
        if (joy.frame.origin.x > joyView.bounds.width - joyOfset) {
            
            joy.frame.origin.x = joyView.bounds.width - joyOfset
            
            changePosition(position: "RIGHT")
            
            
        }
        
        if (joy.frame.origin.x < 0 - joyOfset) {
            
            joy.frame.origin.x = 0 - joyOfset
            
            changePosition(position: "LEFT")
            
        }
        
        
        if (joy.frame.origin.y > joyView.bounds.height - joyOfset) {
            
            joy.frame.origin.y = joyView.bounds.height - joyOfset
            
            if (joy.frame.origin.y + joy.bounds.height > joyView.bounds.height - joyOfset && joy.frame.origin.x + joyView.bounds.width == joyView.bounds.height - joyOfset) {
                
                changePosition(position: "LDCORNER")
                
            } else {
                
                
                if (joy.frame.origin.x + joy.bounds.width > joyView.bounds.width - joyOfset && joy.frame.origin.y + joy.bounds.height > joyView.bounds.height - joyOfset) {
                    
                    changePosition(position: "RDCORNER")
                    
                } else {
                    
                    changePosition(position: "DOWN")
                    
                }
                
            }
            
        }
        
        
        
        if (joy.frame.origin.y < 0 - joyOfset) {
            
            joy.frame.origin.y = 0 - joyOfset
            
            if (joy.frame.origin.x == 0 - joyOfset && joy.frame.origin.y == 0 - joyOfset) {
                
                changePosition(position: "LUPCORNER")
                
            } else {
                
                if (joy.frame.origin.x + joy.bounds.width > joyView.bounds.width - joyOfset && joy.frame.origin.y < joyView.frame.origin.y - joyOfset) {
                    
                    changePosition(position: "RUPCORNER")
                    
                    
                } else {
                    
                    changePosition(position: "UP")
                    
                }
                
            }
            
        }
        
    }
    
    
    func changePosition(position:String) {
        
        switch (position) {
        case "UP":indicateJoyPosition.text = "UP"
        case "DOWN":indicateJoyPosition.text = "DOWN"
        case "RIGHT":indicateJoyPosition.text = "RIGHT"
        case "LEFT":indicateJoyPosition.text = "LEFT"
        case "LUPCORNER":indicateJoyPosition.text = "LEFT UP CORNER"
        case "RUPCORNER":indicateJoyPosition.text = "RIGHT UP CORNER"
        case "LDCORNER":indicateJoyPosition.text = "LEFT DOWN CORNER"
        case "RDCORNER":indicateJoyPosition.text = "RIGHT DOWN CORNER"
        default:indicateJoyPosition.text = "CENTR"
       
        }
        
    }
    
    
    
}


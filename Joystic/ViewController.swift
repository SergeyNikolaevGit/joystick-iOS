//
//  ViewController.swift
//  Joystic
//
//  Created by Sergey Nikolaev on 22/08/2018.
//  Copyright © 2018 Sergey Nikolaev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var joyView: UIView!
    @IBOutlet weak var joy: UIImageView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        joyView.frame = CGRect(x: 40, y: 180, width: 100, height: 100)
        joy.frame = CGRect(x: joyView.bounds.width/2 - joy.bounds.width/2, y: joyView.bounds.height/2 - joy.bounds.height/2, width: 30, height: 30)
        
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
        
        super.touchesBegan(touches, with: event)
        
    }
    
    
    func ofcetJoyPosition() {
        
        print("Joy view bounds - \(joyView.bounds)")
        print("Joy origins - \(joy.frame.origin)")
        
        let joyOfset = joy.bounds.width/2
        
        if (joy.frame.origin.x > joyView.bounds.width - joyOfset) {
            
            joy.frame.origin.x = joyView.bounds.width - joyOfset
            
        }
        
        if (joy.frame.origin.x < 0 - joyOfset) {
            
            
            joy.frame.origin.x = 0 - joyOfset
            
        }
        
        
        if (joy.frame.origin.y > joyView.bounds.height - joyOfset) {
            
            joy.frame.origin.y = joyView.bounds.height - joyOfset
            
        }
        
        if (joy.frame.origin.y < 0 - joyOfset) {
            
            
            joy.frame.origin.y = 0 - joyOfset
            
        }
        
        
    }
    
    
}


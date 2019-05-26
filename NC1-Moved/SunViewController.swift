//
//  SunViewController.swift
//  NC1-Moved
//
//  Created by Khairani Ummah on 25/05/19.
//  Copyright © 2019 Khairani Ummah. All rights reserved.
//

import UIKit

class SunViewController: UIViewController {

    @IBOutlet weak var SunView: UIView!
    
    var brightnessAccomplished: Bool = false
    override func viewDidLoad() {
        super.viewDidLoad()
        self.createSun(currentBright: self.getCurrentBrightness())
        // The "appMovedToForeground" will be called when the app is become active again
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(appMovedToForeground), name: UIApplication.didBecomeActiveNotification, object: nil)
        
        
//        iniApa()
        
        
       
    }
    func iniApa(){
        SunView.layer.cornerRadius = (SunView.frame.width/2)
        SunView.layer.borderColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
        SunView.layer.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        SunView.layer.borderWidth = 3.0
        print("idih")
    }
    
    func iniLoh(){
        SunView.layer.cornerRadius = (SunView.frame.width/2)
        SunView.layer.backgroundColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
        print("WOHOWWW")
    }
    
    func getCurrentBrightness() -> CGFloat {
        let currentBrightness = UIScreen.main.brightness
        return currentBrightness
    }
    
    // Function that will be called after user move the apps to background and open it again
    // User expected to change the brightness, from control center or from settings
    @objc func appMovedToForeground() {
        let currentBrightness = getCurrentBrightness()
        print(currentBrightness)
        
        if currentBrightness == 1.0 {
            print("YOU MADE IT")
            brightnessAccomplished = true
//            iniLoh()
        }
        else {
            print("silahkan coba lagi")
            brightnessAccomplished = false
//            iniApa()
        }
        
        
//        print(brightnessAccomplished)
    }
    
    
    func createSun(currentBright: CGFloat) {
        let c = view.center     // Get the center point. Position views around this point.
        let r: CGFloat = 60    // Radius for the circle.
        
        //        let start = CGPoint(x: view.center.x, y: view.center.y)
        let sun = CGRect(x: 0, y: 0, width: 50, height: 50)
        let sunView = UIView(frame: sun)
        sunView.center.x = c.x
        sunView.center.y = c.y
        sunView.layer.cornerRadius = sunView.frame.width/2
        sunView.layer.borderWidth = 10
        sunView.layer.borderColor = #colorLiteral(red: 1, green: 0.6763771176, blue: 0, alpha: 1)
        view.addSubview(sunView)
        UIView.animate(withDuration: 0.8) {
            sunView.frame.size.width = 70
            sunView.frame.size.height = 70
            sunView.layer.cornerRadius = sunView.frame.width/2
            sunView.center.x = c.x
            sunView.center.y = c.y
        }
        
        
        // Use a loop to create 8 objects
        for i in 0 ..< 8 {
            // Define a rectangle 40 by 40 points. Ignnore the position for now.
            let rect = CGRect(x: 0, y: 0, width: 8, height: 8)
            let v = UIView(frame: rect)         // Create a view
            v.backgroundColor = #colorLiteral(red: 1, green: 0.6763771176, blue: 0, alpha: 1)
            v.layer.cornerRadius = v.frame.width/2
            
            
            // Do some math. t is the angle in radians.
            let t = CGFloat(Double.pi * 2) / 8 * CGFloat(i) // Divide the circle in 8 parts.
            let x = sin(t) * r + c.x    // Get the x and y using sin(t) and cos(t) using the angle t
            let y = cos(t) * r + c.y    // multiply the value by the raidus r.
            //            v.center = c
            v.center.x = x // Set the center x and y
            v.center.y = y
            
            
            let delay = 0.1 * TimeInterval(i)
            UIView.animateKeyframes(withDuration: 0.5, delay: delay, options: [], animations: {
                v.alpha = 1
                v.center = CGPoint(x: x, y: y) // Animate to the outer circle.
                //                v.frame.size.width = 8
                v.frame.size.height = v.frame.size.height * CGFloat((1 + currentBright))
                if i == 1 || i == 5 {
                    v.transform = CGAffineTransform(rotationAngle: 2.356)
                } else if i == 3 || i == 7 {
                    v.transform = CGAffineTransform(rotationAngle: 0.785)
                } else {
                    v.transform = CGAffineTransform(rotationAngle: t)
                }
                
            }, completion: nil)
            
            print(i, t)
            self.view.addSubview(v) // Add a view
        }
        
    }
    
    
    
}



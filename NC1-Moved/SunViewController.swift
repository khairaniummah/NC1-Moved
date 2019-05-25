//
//  SunViewController.swift
//  NC1-Moved
//
//  Created by Khairani Ummah on 25/05/19.
//  Copyright © 2019 Khairani Ummah. All rights reserved.
//

import UIKit

class SunViewController: UIViewController {

    @IBOutlet weak var sun1: UIView!
    @IBOutlet weak var sun2: UIView!
    @IBOutlet weak var sun3: UIView!
    @IBOutlet weak var sun4: UIView!
    @IBOutlet weak var sun5: UIView!
    @IBOutlet weak var sun6: UIView!
    @IBOutlet weak var sun7: UIView!
    @IBOutlet weak var sun8: UIView!
    @IBOutlet weak var SunView: UIView!
    
    var brightnessAccomplished: Bool = false
    override func viewDidLoad() {
        super.viewDidLoad()
      
        // The "appMovedToForeground" will be called when the app is become active again
        
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(appMovedToForeground), name: UIApplication.didBecomeActiveNotification, object: nil)
        
        iniApa()
        
        
       
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
    
    // Function that will be called after user move the apps to background and open it again
    // User expected to change the brightness, from control center or from settings
    @objc func appMovedToForeground() {
        let currentBrightness = UIScreen.main.brightness
        print(currentBrightness)
        
        if currentBrightness == 1.0 {
            print("YOU MADE IT")
            brightnessAccomplished = true
            iniLoh()
        }
        else {
            print("silahkan coba lagi")
            brightnessAccomplished = false
            iniApa()
        }
        
//        print(brightnessAccomplished)
    }
    
    
    
}



//
//  testViewController.swift
//  NC1-Moved
//
//  Created by Khairani Ummah on 26/05/19.
//  Copyright © 2019 Khairani Ummah. All rights reserved.
//

import UIKit

class testViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        let c = view.center     // Get the center point. Position views around this point.
        let r: CGFloat = 60    // Radius for the circle.
        
//        let start = CGPoint(x: view.center.x, y: view.center.y)
        let sun = CGRect(x: 0, y: 0, width: 70, height: 70)
        let sunView = UIView(frame: sun)
        sunView.center.x = c.x
        sunView.center.y = c.y
        
        sunView.layer.cornerRadius = sunView.frame.width/2
        sunView.layer.borderWidth = 10
        sunView.layer.borderColor = #colorLiteral(red: 1, green: 0.6763771176, blue: 0, alpha: 1)
        view.addSubview(sunView)
        // Use a loop to create 8 objects
        for i in 0 ..< 8 {
            // Define a rectangle 40 by 40 points. Ignnore the position for now.
            let rect = CGRect(x: 0, y: 0, width: 8, height: 15)
            let v = UIView(frame: rect)         // Create a view
            v.backgroundColor = #colorLiteral(red: 1, green: 0.6763771176, blue: 0, alpha: 1)
            v.layer.cornerRadius = v.frame.width/2
           
            // Set the color to orange
            
            // Do some math. t is the angle in radians.
            let t = CGFloat(Double.pi * 2) / 8 * CGFloat(i) // Divide the circle in 8 parts.
            let x = sin(t) * r + c.x    // Get the x and y using sin(t) and cos(t) using the angle t
            let y = cos(t) * r + c.y    // multiply the value by the raidus r.
//            let rad =
            v.center.x = x // Set the center x and y
            v.center.y = y
            if i == 1 || i == 5 {
                v.transform = CGAffineTransform(rotationAngle: 2.356)
            } else if i == 3 || i == 7 {
                v.transform = CGAffineTransform(rotationAngle: 0.785)
            } else {
               
                    v.transform = CGAffineTransform(rotationAngle: t)
                
            }
            
        
            print(i, t)
            
            view.addSubview(v) // Add a view
    }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

//
//  ViewController.swift
//  NC1-Moved
//
//  Created by Khairani Ummah on 20/05/19.
//  Copyright © 2019 Khairani Ummah. All rights reserved.
//

import UIKit
import CoreMotion
import Dispatch

class ViewController: UIViewController {

    @IBOutlet weak var walk: UIImageView!
    
    var walkImages: [UIImage] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        walkImages = createImageArray(total: 18, imagePrefix: "walk-")
        animate(imageView: walk, images: walkImages)
        // Do any additional setup after loading the view.
        
        
    }
    
    func createImageArray(total: Int, imagePrefix: String) -> [UIImage] {
        var imageArray: [UIImage] = []
        
        for imageCount in 1..<total {
            let imageName = "\(imagePrefix)\(imageCount).png"
            let image = UIImage(named: imageName)!
            imageArray.append(image)
        }
        
        return imageArray
    }
    
    func animate(imageView: UIImageView, images: [UIImage]) {
        imageView.animationImages = images
        imageView.animationDuration = 1.5
        imageView.startAnimating()
    }
    
    func stopWalking(){
        
    }
    
    func isWalking() -> Bool {
        // if
        return true
    }
    
    
    

}


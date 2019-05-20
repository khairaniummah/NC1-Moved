//
//  ViewController.swift
//  NC1-Moved
//
//  Created by Khairani Ummah on 20/05/19.
//  Copyright © 2019 Khairani Ummah. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var bloob: UIImageView!
    
    var bloobImages: [UIImage] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bloobImages = createImageArray(total: 17, imagePrefix: "a")
        animate(imageView: bloob, images: bloobImages)
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
        imageView.animationDuration = 2.0
        imageView.animationRepeatCount = 10
        imageView.startAnimating()
    }

}


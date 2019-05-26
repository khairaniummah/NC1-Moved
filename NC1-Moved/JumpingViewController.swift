//
//  JumpingViewController.swift
//  NC1-Moved
//
//  Created by Khairani Ummah on 26/05/19.
//  Copyright © 2019 Khairani Ummah. All rights reserved.
//

import UIKit

class JumpingViewController: UIViewController {

    @IBOutlet weak var jumpView: UIImageView!
    var jumpImages: [UIImage] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        jumpImages = createImageArray(total: 17, imagePrefix: "a")
        animate(imageView: jumpView, images: jumpImages)
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
    
    
}

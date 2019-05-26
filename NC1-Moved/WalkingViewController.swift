//
//  WalkingViewController.swift
//  NC1-Moved
//
//  Created by Khairani Ummah on 26/05/19.
//  Copyright © 2019 Khairani Ummah. All rights reserved.
//

import UIKit
import CoreMotion
import Dispatch

class WalkingViewController: UIViewController {

    
    @IBOutlet weak var stepsCountLabel: UILabel!
    @IBOutlet weak var walkingView: UIImageView!
    // list of var for walking
    var walkImages: [UIImage] = []
    var shouldStopWalking: Bool = false
    
    // list of var about pedometer
    private let activityManager = CMMotionActivityManager()
    private let pedometer = CMPedometer()
    private var shouldStartUpdating: Bool = false
    private var startDate: Date? = nil
    private var isAchieve: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        walkImages = createImageArray(total: 18, imagePrefix: "walk-")
        animate(imageView: walkingView, images: walkImages)
        
    }
    
    // Creating Array of Images
    func createImageArray(total: Int, imagePrefix: String) -> [UIImage] {
        var imageArray: [UIImage] = []
        for imageCount in 1..<total {
            let imageName = "\(imagePrefix)\(imageCount).png"
            let image = UIImage(named: imageName)!
            imageArray.append(image)
        }
        return imageArray
    }
    
    // Animate the array of images
    // Stop when pedometer already get data more than 10 stepscounts
    func animate(imageView: UIImageView, images: [UIImage]) {
        imageView.animationImages = images
        imageView.animationDuration = 1.5
        imageView.startAnimating()
        
        if shouldStopWalking == true {
            imageView.stopAnimating()
        }
    }
    
    //MARK: Pedometers Function
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        onStart()
        guard let startDate = startDate else { return }
        updateStepsCountLabelUsing(startDate: startDate)
    }
}

extension WalkingViewController {
    private func onStart() {
        startDate = Date()
        checkAuthorizationStatus()
        startUpdating()
    }
    
    private func onStop() {
        startDate = nil
        stopUpdating()
    }
    
    private func startUpdating() {
        if CMPedometer.isStepCountingAvailable() {
            startCountingSteps()
        }
    }
    
    private func checkAuthorizationStatus() {
        switch CMMotionActivityManager.authorizationStatus() {
        case CMAuthorizationStatus.denied:
            onStop()
            stepsCountLabel.text = "Not available"
        default:break
        }
    }
    
    private func stopUpdating() {
        activityManager.stopActivityUpdates()
        pedometer.stopUpdates()
        pedometer.stopEventUpdates()
    }
    
    private func on(error: Error) {
        //handle error
    }
    
    private func updateStepsCountLabelUsing(startDate: Date) {
        print("0.1")
        pedometer.queryPedometerData(from: startDate, to: Date()) {
            [weak self] pedometerData, error in
            if let error = error {
                self?.on(error: error)
            } else if let pedometerData = pedometerData {
                DispatchQueue.main.async {
                    self?.stepsCountLabel.text = String(describing: pedometerData.numberOfSteps)
                    print("1")
                }
            }
        }
    }

    
    private func startCountingSteps() {
        print("0.2")
        pedometer.startUpdates(from: Date()) {
            [weak self] pedometerData, error in
            guard let pedometerData = pedometerData, error == nil else { return }
            
            DispatchQueue.main.async {
                self?.stepsCountLabel.text = pedometerData.numberOfSteps.stringValue
                print("2")
                if pedometerData.numberOfSteps.intValue > 1 {
                    print("3")
                    self?.onStop()
                    self?.stepsCountLabel.text = "SUDIN"
                    self?.shouldStopWalking = true
                    self?.moveToJumpPage()
                }
            }
        }
    }
    
    private func moveToJumpPage() {
//        let vc:UIViewController = WalkingViewController()
//        self.navigationController?.pushViewController(vc!, animated: true)
    
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let secondViewController = storyboard.instantiateViewController(withIdentifier: "JumpingViewController") as UIViewController
        present(secondViewController, animated: true, completion: nil)
    }
}

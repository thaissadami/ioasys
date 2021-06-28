//
//  CustomProgress.swift
//  teste-ioasys
//
//  Created by Thais Sadami on 23/06/21.
//

import Foundation
import UIKit

class ActivityIndicatorCustom: UIView {
    
    //Create the first status image and the indicator view
    let statusImage = UIImage(named: "status1.png")
    let activityImageView: UIImageView!
    //Add more images which will be used for the animation
    let arrayImages = [UIImage(named: "status1.png")!,
                       UIImage(named: "status2.png")!,
                       UIImage(named: "status3.png")!,
                       UIImage(named: "status4.png")!,
                       UIImage(named: "status5.png")!]
    
    let viewController: UIViewController
    let bg: UIView
    
    init(viewController: UIViewController) {
        self.viewController = viewController
        
        bg = UIView(frame: self.viewController.view.frame)
        bg.backgroundColor = .black
        bg.alpha = 0.4
        bg.tag = -1
        
        activityImageView = UIImageView(image: statusImage)
        activityImageView.animationImages = arrayImages
        activityImageView.animationDuration = 0.5;
        activityImageView.tag = -1
        
        let centerWidth = statusImage!.size.width/2
        let centerHeight = statusImage!.size.height/2
        activityImageView.frame = CGRect(x: self.viewController.view.frame.size.width/2-centerWidth, y: self.viewController.view.frame.size.height/2-centerHeight, width: statusImage!.size.width, height: statusImage!.size.height)
        
        super.init(frame: self.viewController.view.frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func show(){
        self.viewController.view.addSubview(bg)
        self.viewController.view.addSubview(activityImageView)
        activityImageView.startAnimating()
    }
    
    func dismiss(){
        
        activityImageView.stopAnimating()
        
        for view in self.viewController.view.subviews {
            if view.tag == -1 {
                view.removeFromSuperview()
            }
        }
    }
}

//
//  ViewController.swift
//  Animation_like_fb
//
//  Created by Jagdeep on 13/07/18.
//  Copyright © 2018 Self. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    var imageView:UIImageView = {
        let image = UIImage(named: "Img_fb")
        let imgaeView = UIImageView(image: image)
        
        return imgaeView
    }()
    
    var iconContainerView:UIView = {
        let containerView = UIView()
        containerView.backgroundColor = .yellow
        containerView.frame = CGRect(x: 0, y: 0, width: 200, height: 100)
        return containerView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        view.addSubview(imageView)
        imageView.frame = view.frame
        
        
        longTapGesture()
    }
    
    fileprivate func longTapGesture() {
        view.addGestureRecognizer(UILongPressGestureRecognizer(target: self, action: #selector(handlelongPress)))
        
    }
    @objc func handlelongPress(gesture: UILongPressGestureRecognizer) {
        
        if gesture.state == .began {
            let location = gesture.location(in: self.view)
            view.addSubview(iconContainerView)
            print(location)
            
            
            self.iconContainerView.transform = CGAffineTransform(translationX: (self.view.frame.size.width - iconContainerView.frame.width)/2, y: location.y)
            self.iconContainerView.alpha = 0
            
            
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                self.iconContainerView.alpha = 1
                
                self.iconContainerView.transform = CGAffineTransform(translationX: (self.view.frame.size.width - self.iconContainerView.frame.width)/2, y: location.y - self.iconContainerView.frame.height)
                
            }, completion: nil)
            
            
        } else if gesture.state == .ended {
            iconContainerView.removeFromSuperview()
        }
    }
    
}


//
//  ViewController.swift
//  UiGestureDemo
//
//  Created by mac admin on 18/07/20.
//  Copyright © 2020 Kunal. All rights reserved.
//

import UIKit

//square.and.arrow.up.fill

class ViewController: UIViewController {

    @IBOutlet weak var folderImage: UIImageView!
    @IBOutlet weak var trashImage: UIImageView!
    
    
    var folderViewOrigin:CGPoint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addPanGesture(view: folderImage)
        folderViewOrigin = folderImage.frame.origin
        view.bringSubviewToFront(folderImage)
    }
    
    func addPanGesture(view: UIView) {
        let pan = UIPanGestureRecognizer(target: self, action: #selector(ViewController.handlePan(sender:)))
        view.addGestureRecognizer(pan)
    }
    
    @objc func handlePan(sender: UIPanGestureRecognizer) {
        let folderView = sender.view!
        let translation = sender.translation(in: view)
        
        
        switch sender.state {
        case .began, .changed:
            
            folderView.center = CGPoint(x: folderView.center.x + translation.x, y: folderView.center.y + translation.y)
            sender.setTranslation(CGPoint.zero, in: view)
            
        case .ended :
            
            if folderView.frame.intersects(trashImage.frame) {
                UIView.animate(withDuration: 0.3, animations: {
                    self.folderImage.alpha = 0.0
                })
            } else{
                UIView.animate(withDuration: 0.3, animations: {
                    self.folderImage.frame.origin = self.folderViewOrigin
                })
            }
            
        default:
            break
        }
    }


}


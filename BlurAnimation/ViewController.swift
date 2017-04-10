//
//  ViewController.swift
//  BlurAnimation
//
//  Created by Kuliza-336 on 02/03/17.
//  Copyright © 2017 Kuliza-336. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var upperView: UIView!
    
    @IBOutlet weak var visualEffect: UIVisualEffectView!
    
    var saveEffect:UIVisualEffect!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        saveEffect = visualEffect.effect!
        visualEffect.effect = nil
        
        upperView.layer.cornerRadius = 5
    }
    
    func animateIn()
    {
        self.view.addSubview(upperView)
        upperView.center = self.view.center
        
        upperView.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        upperView.alpha = 0
        
        UIView.animate(withDuration: 0.4, animations: {
            self.visualEffect.effect = self.saveEffect
            self.upperView.alpha = 1
            self.upperView.transform = CGAffineTransform.identity
        })
    }
    
    func animateOut()
    {
        UIView.animate(withDuration: 0.3, animations: {
            self.upperView.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
            self.upperView.alpha = 0
            
            self.visualEffect.effect = nil
            
        }, completion: { (success: Bool) in
            self.upperView.removeFromSuperview()
        })
    }
    @IBAction func AddItem(_ sender: Any) {
        animateIn()
    }
 
    @IBAction func doneButton(_ sender: Any) {
        animateOut()
    }


}


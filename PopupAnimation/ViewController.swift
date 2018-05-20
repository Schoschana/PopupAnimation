//
//  ViewController.swift
//  PopupAnimation
//
//  Created by LILI on 20.05.2018.
//  Copyright © 2018 LILI. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var addTocartBtn: UIButton!
    
    @IBOutlet weak var sureBtn: UIButton!
    
    @IBOutlet var finalView: UIView!
    
    @IBOutlet weak var visualEffect: UIVisualEffectView!
    
    var screenEfeect: UIVisualEffect?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let effect = visualEffect.effect {
           screenEfeect =  effect
        } else{
            screenEfeect = UIVisualEffect()
        }
        visualEffect.effect = nil
        
        addTocartBtn.layer.cornerRadius =  addTocartBtn.frame.height / 2.0
        sureBtn.layer.cornerRadius = sureBtn.frame.height/2.0
        finalView.layer.cornerRadius = sureBtn.layer.cornerRadius
    }

    
    @IBAction func addTwocartPressed(_ sender: UIButton) {
        self.view.addSubview(finalView)
        self.finalView.center.x = self.view.center.x
        self.finalView.center.y = self.view.center.y - (self.view.frame.height / 4.0)
        
        finalView.alpha = 0
        finalView.transform = CGAffineTransform (translationX: 0.2, y: 0.2)
        
        UIView.animate(withDuration: 0.4) {
            self.addTocartBtn.alpha = 0
            self.finalView.alpha = 1
            self.visualEffect.effect = self.screenEfeect
            self.finalView.transform = CGAffineTransform.identity
        }
    }
    
    @IBAction func surePressed(_ sender: UIButton) {
        UIView.animate(withDuration: 0.4, animations:{
            self.finalView.alpha = 1
            self.finalView.alpha = 0
            self.visualEffect.effect = nil
        }) {(status) in
            self.finalView.removeFromSuperview()
    
   }
}

}

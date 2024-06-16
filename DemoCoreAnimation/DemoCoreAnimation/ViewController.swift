//
//  ViewController.swift
//  DemoCoreAnimation
//
//  Created by Jinali Chavda on 03/05/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mainView:UIView!
    @IBOutlet weak var viewSecond: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        mainView.layer.cornerRadius = 30
    }

    @IBAction func btnAddLayer(_ sender: UIButton) {
        mainView.isHidden = false
        viewSecond.isHidden = true
        let newlayer = CALayer()
        newlayer.frame = CGRect(x: mainView.bounds.origin.x + 20 , y: mainView.bounds.origin.y + 10, width: mainView.bounds.width - 40, height: mainView.bounds.height - 20 )
        newlayer.backgroundColor = UIColor.lightGray.cgColor
        newlayer.cornerRadius = 30
        mainView.layer.addSublayer(newlayer)
    }
    
    @IBAction func btnAddShadow(_ sender: UIButton) {
        mainView.isHidden = false
        viewSecond.isHidden = true
        mainView.layer.shadowOpacity = 0.3
        mainView.layer.shadowRadius = 0.5
        mainView.layer.shadowOffset = CGSize(width: 5, height: 5)
        mainView.layer.shadowColor = UIColor.red.cgColor
    }
    
    @IBAction func btnAnimateImplicitly(_ sender: UIButton) {
        mainView.isHidden = false
        viewSecond.isHidden = true
        //normal
//        UIView.animate(withDuration: 1) {
//            self.mainView.layer.opacity = 0
//        }
        let fadeAnimation = CABasicAnimation(keyPath: "opacity")
        fadeAnimation.fromValue = 1.0
        fadeAnimation.toValue = 0.0
        fadeAnimation.duration = 1.0
        fadeAnimation.repeatCount = 5
        fadeAnimation.autoreverses = true
        mainView.layer.add(fadeAnimation, forKey: "fadeAnimation")
        mainView.layer.opacity = 0.0
    }
    
    @IBAction func btnAnimateExplicitly(_ sender: UIButton) {
        mainView.isHidden = false
        viewSecond.isHidden = true
        let fadeAnimation = CABasicAnimation(keyPath: "opacity")
        fadeAnimation.fromValue = 1.0
        fadeAnimation.toValue = 0.0
        fadeAnimation.duration = 1.0
        fadeAnimation.repeatCount = 5
        fadeAnimation.autoreverses = true
        mainView.layer.add(fadeAnimation, forKey: "fadeAnimation")
        mainView.layer.opacity = 1.0
       

    }
    
    @IBAction func btnBounceBall(_ sender: Any) {
        mainView.isHidden = false
        viewSecond.isHidden = false
        let thePath = CGMutablePath()
        thePath.move(to: CGPoint(x: 20, y: 200))
        thePath.addCurve(to: CGPoint(x: 100, y: 200),
                         control1: CGPoint(x: 20, y: 40),
                         control2: CGPoint(x: 100, y: 200))
        thePath.addCurve(to: CGPoint(x: 200, y: 300),
                         control1: CGPoint(x: 100, y: 20),
                         control2: CGPoint(x: 200, y: 20))

        let theAnimaton = CAKeyframeAnimation(keyPath: "position")
        theAnimaton.path = thePath
        theAnimaton.duration = 5
        theAnimaton.repeatCount = 5
        theAnimaton.autoreverses = true
        self.viewSecond.layer.add(theAnimaton, forKey: "position")
    }
    
    @IBAction func btnKeyFrameAnimation(_ sender: UIButton) {
        mainView.isHidden = false
        viewSecond.isHidden = false
        let theAnimation = CAKeyframeAnimation(keyPath: "position")
        theAnimation.duration = 5;
        theAnimation.values = [
            NSValue(cgRect: CGRect(x: 50, y: 100, width: 50, height: 50)),
            NSValue(cgRect: CGRect(x: 200, y: 100, width: 50, height: 50)),
            NSValue(cgRect: CGRect(x: 220, y: 150, width: 50, height: 50))
        ]
        theAnimation.keyTimes = [0, 0.2, 1]
        theAnimation.timingFunctions = [
            CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeIn),
            CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)
        ]
        theAnimation.repeatCount = 5
        theAnimation.autoreverses = true
        self.viewSecond.layer.add(theAnimation, forKey: "position")
    }
    
    @IBAction func btnRotate3D(_ sender: UIButton) {
        mainView.isHidden = false
        viewSecond.isHidden = true
        let eyePosition: CGFloat = 250.0
        UIView.animate(withDuration: 5) {
            var rotate = CATransform3DMakeRotation(180 * CGFloat.pi / 180, 0.0, 1.0, 0.0)
            rotate.m34 = -1.0 / eyePosition
            self.mainView.layer.transform = rotate
        }
    }
    
    @IBAction func btntransitionAnimation(_ sender: UIButton) {
       
        let tranisition = CATransition()
        tranisition.startProgress = 0.0
        tranisition.endProgress = 1.0
        tranisition.type = .push
        tranisition.subtype = .fromTop
        tranisition.duration = 1.0
        
        mainView.layer.add(tranisition, forKey: "transition")
        viewSecond.layer.add(tranisition, forKey: "transition")
        
        mainView.isHidden = true
        viewSecond.isHidden = false
    }
    
    @IBAction func btnSpringAnimation(_ sender: UIButton) {
        viewSecond.isHidden = false
        let jump = CASpringAnimation(keyPath: "transform.scale")
        jump.damping = 10
        jump.mass = 1
        jump.initialVelocity = 100
        jump.stiffness = 1500.0
        
        jump.fromValue = 1.0
        jump.toValue = 2.0
        jump.duration = jump.settlingDuration
        viewSecond.layer.add(jump, forKey: nil)
    }
    
    @IBAction func btnPullToRefresh(_ sender: UIButton) {
        
    }
    
    
    
}


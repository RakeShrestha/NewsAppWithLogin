//
//  DesignableButton.swift
//  NewsDemoApp
//
//  Created by RakeSanzzy Shrestha on 3/29/20.
//  Copyright © 2020 SelfProject. All rights reserved.
//

import UIKit

@IBDesignable

class DesignableButton: UIButton {
    
   
    
    @IBInspectable var cornerRadius: CGFloat = 0{
        
        didSet{
            self.layer.cornerRadius = cornerRadius
        }
        
    }
    
    @IBInspectable var borderWidth: CGFloat = 0{
        
        didSet{
            self.layer.borderWidth = borderWidth
        }
        
    }
    
    @IBInspectable var borderColor: UIColor = UIColor.clear{
        
        didSet{
            self.layer.borderColor = borderColor.cgColor
        }
        
    }
    
    
    @IBInspectable var shadowColor: UIColor = UIColor.black{
        
        didSet{
            self.layer.shadowColor = shadowColor.cgColor
        }
    }
    
    @IBInspectable var shadowOffset: CGSize = CGSize(width: 0, height: 0){
        
        didSet{
            self.layer.shadowOffset = shadowOffset
        }
    }
    
    @IBInspectable var shadowRadius: CGFloat = 0{
        
        didSet{
            self.layer.shadowRadius = shadowRadius
        }
    }
    
    @IBInspectable var shadowOpacity: Float = 0{
        
        didSet{
            self.layer.shadowOpacity = shadowOpacity
        }
    }
    
    
    
    @IBInspectable var horizontalGradient: Bool = false {
    didSet{
    updateView()
    }
    }
    
    @IBInspectable var firstColor: UIColor = UIColor.white {
    didSet{
    updateView()
    }
    }
    
    @IBInspectable var secondColor: UIColor = UIColor.white {
    didSet{
    updateView()
    }
    }
    
    override class var layerClass: AnyClass{
    get{
    return CAGradientLayer.self
    }
    }
    
    func updateView(){
    
    let layer = self.layer as! CAGradientLayer
    layer.colors = [firstColor.cgColor, secondColor.cgColor]
    
    if (horizontalGradient) {
    layer.startPoint = CGPoint(x: 0.5, y: 0.0)
    layer.endPoint = CGPoint(x: 1.0, y: 0.5)
    }
    
    else{
    layer.startPoint = CGPoint(x: 0, y: 0.0)
    layer.endPoint = CGPoint(x: 0, y: 1)
    }
    }
    
    
    
    
}

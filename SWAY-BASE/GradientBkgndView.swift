//
//  GradientBkgndView.swift
//  SWAY
//
//  Created by Joshua Paulsen on 10/15/18.
//  Copyright © 2018 Phill Farrugia. All rights reserved.
//

import UIKit

@IBDesignable
public class GradientBkgndView: UIView {
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    override public func draw(_ rect: CGRect) {
        let gradient: CAGradientLayer = CAGradientLayer()
        let topLeftColor = UIColor.red
        let bottomRightColor = UIColor.red
        gradient.colors = [topLeftColor, bottomRightColor]
        gradient.locations = [0.0, 1.0]
        gradient.startPoint = CGPoint(x: 1.0, y: 0.0)
        gradient.endPoint = CGPoint(x: 0.0, y: 1.0)
        gradient.frame = rect
        layer.insertSublayer(gradient, at: 0)
    }
    
}


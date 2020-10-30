//
//  Extensions.swift
//  TestProject
//
//  Created by Baudunov Rapkat on 10/29/20.
//

import UIKit

extension UIButton{
    func roundedButton(){
        let maskPath1 = UIBezierPath(roundedRect: bounds,
                                     byRoundingCorners: [.topLeft , .bottomRight],
                                     cornerRadii: CGSize(width: 13, height: 13))
        let maskLayer1 = CAShapeLayer()
        maskLayer1.frame = bounds
        maskLayer1.path = maskPath1.cgPath
        
        layer.mask = maskLayer1
    }
}

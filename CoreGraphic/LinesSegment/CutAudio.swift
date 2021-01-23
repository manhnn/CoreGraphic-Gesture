//
//  CutAudio.swift
//  CoreGraphicAndGesture
//
//  Created by Manh Nguyen Ngoc on 23/01/2021.
//

import UIKit

class CutAudio: UIView {
    override func draw(_ rect: CGRect) {
        
        let context = UIGraphicsGetCurrentContext()!
        context.setStrokeColor(UIColor.black.cgColor)
        context.setLineWidth(1)
        
        var topPoint = CGPoint(x: -rect.height, y: 0)
        var downPoint = CGPoint(x: 0, y: rect.height)
        let distance = CGPoint(x: 10, y: 0)
        
        while topPoint.x <= rect.width {
            context.move(to: topPoint)
            context.addLine(to: downPoint)
            
            topPoint.x += distance.x
            topPoint.y += distance.y
            downPoint.x += distance.x
            downPoint.y += distance.y
        }
        context.strokePath()
    }
}

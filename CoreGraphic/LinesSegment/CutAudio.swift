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
        
        var topPointStart = CGPoint(x: -rect.height, y: 0)
        var downPointStart = CGPoint(x: 0, y: rect.height)
        let distance = CGPoint(x: 10, y: 0)
        
        while topPointStart.x <= rect.width {
            context.move(to: topPointStart)
            context.addLine(to: downPointStart)
            
            topPointStart.x += distance.x
            topPointStart.y += distance.y
            downPointStart.x += distance.x
            downPointStart.y += distance.y
        }
        context.strokePath()
    }
}

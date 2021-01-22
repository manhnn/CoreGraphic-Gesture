//
//  BirdViewController.swift
//  CoreGraphicAndGesture
//
//  Created by Manh Nguyen Ngoc on 22/01/2021.
//

import UIKit

class BirdViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let coreGraphic = CoreGraphic(frame: view.frame)
        //self.view.addSubview(coreGraphic)
        self.view = coreGraphic
    }
}

class CoreGraphic: UIView {
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0, y: 0))
        path.addQuadCurve(to: <#T##CGPoint#>, controlPoint: <#T##CGPoint#>)
        UIColor.green.setStroke()
        path.lineWidth = 10
        path.stroke()
    }


}

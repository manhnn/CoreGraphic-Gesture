//
//  DownloadViewController.swift
//  CoreGraphicAndGesture
//
//  Created by Manh Nguyen Ngoc on 22/01/2021.
//

import UIKit

class DownloadViewController: UIViewController {
    
    @IBOutlet weak var coreGraphicView: CoreGraphic!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //coreGraphicView.drawCircle()
    }
    @IBAction func downloadButton(_ sender: Any) {
        self.coreGraphicView.drawCircle()
    }
}

class CoreGraphic: UIView {
    @IBOutlet weak var lblPercent: UILabel!
    var percent = 0
    
    fileprivate func drawArcCirclePink(_ context: CGContext) {
        context.setLineWidth(10.0)
        context.setStrokeColor(UIColor.systemPink.cgColor)
        var startAngle: CGFloat = .pi * (-1/2)
        context.addArc(center: CGPoint(x: self.frame.width / 2, y: self.frame.height / 2), radius: 100, startAngle: startAngle, endAngle: CGFloat(percent) * .pi / 50 + .pi * (-1/2), clockwise: false)
        startAngle = CGFloat(percent) * .pi / 50 + .pi * (-1/2)
        
        context.strokePath()
    }
    
    fileprivate func drawArcCircleGray(_ context: CGContext) {
        context.setStrokeColor(UIColor.systemGray2.cgColor)
        context.addArc(center: CGPoint(x: self.frame.width / 2, y: self.frame.height / 2), radius: 100, startAngle: 0, endAngle: 2 * .pi, clockwise: true)
        context.strokePath()
    }
    
    override func draw(_ rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()!
        drawArcCircleGray(context)
        drawArcCirclePink(context)
    }
    
    func drawCircle() {
        print("dsdfds")
        DispatchQueue.init(label: "test thread").async {
            for percent in 1...100 {
                sleep(1)
                DispatchQueue.main.async {
                    self.percent = percent
                    self.setNeedsDisplay()
                    self.lblPercent.text = "\(percent)%"
                }
            }
        }
    }
}

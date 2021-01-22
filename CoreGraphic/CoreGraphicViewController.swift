//
//  CoreGraphicViewController.swift
//  CoreGraphicAndGesture
//
//  Created by Manh Nguyen Ngoc on 22/01/2021.
//

import UIKit

class CoreGraphicViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func nextPage(_ sender: Any) {
        let birdViewController = BirdViewController()
        self.navigationController?.pushViewController(birdViewController, animated: true)
    }
    
}


class CustomView: UIView {
    let numberofAxis = 6
    let maxLength: CGFloat = 100
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        drawLineSegment()
        drawPath()
        drawArc()
        
        drawAxis()
        drawStandardCircle()
        drawValuePolygon()
    }
    
    // MARK: - UIGraphicsGetCurrentContext()
    func drawLineSegment() {
        guard let context = UIGraphicsGetCurrentContext() else { return }
        context.setStrokeColor(UIColor.red.cgColor) //mau duong ke
        context.setLineWidth(5.0) //do rong duong ke
        
        context.move(to: CGPoint(x: 0, y: 0))
        context.addLine(to: CGPoint(x: 0, y: 100))
        context.addLine(to: CGPoint(x: 100, y: 100))
        context.addLine(to: CGPoint(x: 100, y: 200))
        context.addLine(to: CGPoint(x: 200, y: 200))
        
        context.strokePath()
    }
    
    private func drawPath() {
        guard let context = UIGraphicsGetCurrentContext() else { return }
        context.setStrokeColor(UIColor.blue.cgColor)
        context.setLineWidth(10.0)
        
        let path = CGMutablePath()
        path.move(to: CGPoint(x: 100, y: 100))
        path.addRect(CGRect(x: 200, y: 100, width: 50, height: 50))
        path.addEllipse(in: CGRect(x: 200, y: 300, width: 50, height: 50))
        
        context.addPath(path)
        context.strokePath()
    }
    
    private func drawArc() {
           guard let context = UIGraphicsGetCurrentContext() else { return }
           context.setStrokeColor(UIColor.gray.cgColor)
           context.setLineWidth(10.0)
           
        context.addArc(center: CGPoint(x: 100, y: 300), radius: 10, startAngle: 0, endAngle: (-3/2) * .pi, clockwise: true)
           
           context.strokePath()
       }
 
    
    
    // MARK: - UIBezierPath()
    func drawAxis() {
        let width = frame.width/2
        let height = frame.height/2
        
        let centerPoint = CGPoint(x: frame.width/2, y: frame.height/2)
        for i in 0...numberofAxis {
            let ratio = CGFloat(i) / CGFloat(numberofAxis)
            let axisPath = UIBezierPath()
            axisPath.move(to: centerPoint)
            let currentArg: CGFloat = (2 * .pi) * ratio + 3 * .pi / 2
            let maxPoint = CGPoint(x: width + maxLength * cos(currentArg),
                                   y: height + maxLength * sin(currentArg))
            axisPath.addLine(to: maxPoint)
            axisPath.lineWidth = 1
            UIColor.black.setStroke()
            axisPath.stroke()
        }
    }
    
    func drawStandardCircle() {
        let centerPoint = CGPoint(x: frame.width/2, y: frame.height/2)

        for i in 5...10 {
            let circlePath = UIBezierPath()
            circlePath.addArc(withCenter: centerPoint,
                              radius: CGFloat(i) * maxLength / 10 ,
                              startAngle: 0,
                              endAngle: 2 * .pi,
                              clockwise: true)
            UIColor.gray.setStroke()
            circlePath.stroke()
        }
    }
    
    func drawValuePolygon() {
        let width = frame.width/2
        let height = frame.height/2
        
        let polygonPath = UIBezierPath()
        for i in 0...numberofAxis {
            let ratio = CGFloat(i) / CGFloat(numberofAxis)
            
            let currentArg: CGFloat = (2 * .pi) * ratio + 3 * .pi / 2
            let valuePoint = CGPoint(
                x: (width + (maxLength * cos(currentArg)) * 0.7),
                                     y: (height + (maxLength * sin(currentArg)) * 0.7)
            )
            
            if i == 0 {
                polygonPath.move(to: valuePoint)
            } else {
                polygonPath.addLine(to: valuePoint)
            }
            
            polygonPath.lineWidth = 1
            UIColor.blue.setStroke()
            polygonPath.stroke()
            UIColor.purple.withAlphaComponent(0.2).setFill()
            polygonPath.fill()
        }
    }
}

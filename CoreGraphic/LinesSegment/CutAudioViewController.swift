//
//  LineSegmentViewController.swift
//  CoreGraphicAndGesture
//
//  Created by Manh Nguyen Ngoc on 23/01/2021.
//

import UIKit

class CutAudioViewController: UIViewController {
    
    let controlLeft = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        
        // MARK: - Add sub view CutAudioView
        let cutAudioView = CutAudioView(frame: CGRect(x: 100, y: 500, width: 300, height: 42), nameImage: "image 20")
        cutAudioView.translatesAutoresizingMaskIntoConstraints = false
        self.view.backgroundColor = .white
        self.view.addSubview(cutAudioView)

        cutAudioView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 40).isActive = true
        cutAudioView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -40).isActive = true
        cutAudioView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -80).isActive = true
        cutAudioView.heightAnchor.constraint(equalToConstant: 42).isActive = true
        
        
        
        // MARK: - Add sub View Gesture
        
        controlLeft.backgroundColor = .cyan
        controlLeft.translatesAutoresizingMaskIntoConstraints = false
        cutAudioView.addSubview(controlLeft)
        
        controlLeft.widthAnchor.constraint(equalToConstant: 5).isActive = true
        controlLeft.leadingAnchor.constraint(equalTo: cutAudioView.leadingAnchor, constant: -5).isActive = true
        controlLeft.topAnchor.constraint(equalTo: cutAudioView.topAnchor, constant: -10).isActive = true
        controlLeft.bottomAnchor.constraint(equalTo: cutAudioView.bottomAnchor, constant: -10).isActive = true
        
        let panGuestureToView = UIPanGestureRecognizer(target: self, action: #selector(self.panInToView(gesture: )))
        cutAudioView.isUserInteractionEnabled = true
        cutAudioView.addGestureRecognizer(panGuestureToView)
        
    }
    
    @objc func panInToView(gesture: UIPanGestureRecognizer) {
        if gesture.state == .began {
            print("began")
        }
        else if gesture.state == .changed {
            let translation = gesture.translation(in: self.view)
            controlLeft.transform = CGAffineTransform(translationX: translation.x, y: 0)
            print(translation)
        }
        else if gesture.state == .ended {
            print("ended")
        }
    }

}

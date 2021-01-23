//
//  LineSegmentViewController.swift
//  CoreGraphicAndGesture
//
//  Created by Manh Nguyen Ngoc on 23/01/2021.
//

import UIKit

class CutAudioViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let cutAudioView = CutAudioView(frame: CGRect(x: 100, y: 500, width: 300, height: 42), nameImage: "image 20")
        self.navigationController?.isNavigationBarHidden = true
        self.view.translatesAutoresizingMaskIntoConstraints = false
        self.view.backgroundColor = .white
        self.view.addSubview(cutAudioView)

        cutAudioView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 40).isActive = true
        cutAudioView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -40).isActive = true
        cutAudioView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -80).isActive = true
        cutAudioView.heightAnchor.constraint(equalToConstant: 42).isActive = true
    }

}

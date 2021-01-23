//
//  LineSegment.swift
//  CoreGraphicAndGesture
//
//  Created by Manh Nguyen Ngoc on 23/01/2021.
//

import UIKit

class CutAudioView: UIView {
    var leftConstraint: NSLayoutConstraint?
    var rightConstraint: NSLayoutConstraint?
    var topConstraint: NSLayoutConstraint?
    var bottomConstraint: NSLayoutConstraint?
    var nameImage: String?
    
    init(frame: CGRect, nameImage: String) {
        self.nameImage = nameImage
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        if nameImage != nil {
            let imageView = UIImageView(frame: self.frame)
            imageView.image = UIImage(named: self.nameImage!)
            imageView.contentMode = .scaleToFill
            imageView.translatesAutoresizingMaskIntoConstraints = false
            self.addSubview(imageView)
            
            imageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
            imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
            imageView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
            imageView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        }
        
        let cutAudio = CutAudio(frame: self.frame)
        cutAudio.backgroundColor = .clear
        cutAudio.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(cutAudio)
        
        leftConstraint = cutAudio.leftAnchor.constraint(equalTo: self.leftAnchor)
        rightConstraint = cutAudio.rightAnchor.constraint(equalTo: self.rightAnchor)
        topConstraint = cutAudio.topAnchor.constraint(equalTo: self.topAnchor)
        bottomConstraint = cutAudio.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        
        leftConstraint?.isActive = true
        rightConstraint?.isActive = true
        topConstraint?.isActive = true
        bottomConstraint?.isActive = true
    }
}



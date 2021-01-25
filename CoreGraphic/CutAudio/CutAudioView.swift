//
//  LineSegment.swift
//  CoreGraphicAndGesture
//
//  Created by Manh Nguyen Ngoc on 23/01/2021.
//

import UIKit

class CutAudioView: UIView {
    private var leftConstraint: NSLayoutConstraint?
    private var rightConstraint: NSLayoutConstraint?
    private var bottomConstraint: NSLayoutConstraint?
    private var topConstraint: NSLayoutConstraint?
    private var nameImage: String?
    private var leftView: UIView!
    private var rightView: UIView!
    private var cutAudio: CutAudio!
    
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
            
            imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
            imageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
            imageView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
            imageView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        }
        
        cutAudio = CutAudio(frame: self.frame)
        cutAudio.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(cutAudio)
        
        leftConstraint = cutAudio.leftAnchor.constraint(equalTo: self.leftAnchor)
        rightConstraint = self.rightAnchor.constraint(equalTo: cutAudio.rightAnchor)
        bottomConstraint = self.bottomAnchor.constraint(equalTo: cutAudio.bottomAnchor)
        topConstraint = cutAudio.topAnchor.constraint(equalTo: self.topAnchor)

        leftConstraint?.isActive = true
        rightConstraint?.isActive = true
        bottomConstraint?.isActive = true
        topConstraint?.isActive = true
        
        configCropLimiUI()
    }
    
    func configCropLimiUI() {
        leftView = UIView(frame: self.frame)
        rightView = UIView(frame: self.frame)
        leftView.backgroundColor = .cyan
        rightView.backgroundColor = .cyan
        leftView.translatesAutoresizingMaskIntoConstraints = false
        rightView.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(leftView)
        self.addSubview(rightView)
        
        leftView.leftAnchor.constraint(equalTo: cutAudio.leftAnchor).isActive = true
        leftView.heightAnchor.constraint(equalToConstant: self.frame.height).isActive = true
        leftView.widthAnchor.constraint(equalToConstant: 5).isActive = true
        leftView.centerYAnchor.constraint(equalTo: cutAudio.centerYAnchor).isActive = true
        
        rightView.rightAnchor.constraint(equalTo: cutAudio.rightAnchor).isActive = true
        rightView.heightAnchor.constraint(equalToConstant: self.frame.height).isActive = true
        rightView.widthAnchor.constraint(equalToConstant: 5).isActive = true
        rightView.centerYAnchor.constraint(equalTo: cutAudio.centerYAnchor).isActive = true
        
        let leftPan = UIPanGestureRecognizer(target: self, action: #selector(self.leftPanGesture(_: )))
        leftView.addGestureRecognizer(leftPan)
        let rightPan = UIPanGestureRecognizer(target: self, action: #selector(self.rightPanGesture(_: )))
        rightView.addGestureRecognizer(rightPan)
        
        let leftTap = UITapGestureRecognizer(target: self, action: #selector(self.leftTapGesture(_: )))
        cutAudio.addGestureRecognizer(leftTap)
        let rightTap = UITapGestureRecognizer(target: self, action: #selector(self.rightTapGesture(_: )))
        cutAudio.addGestureRecognizer(rightTap)
    }
    
    @objc func leftPanGesture(_ sender: Any?) {
        let panGesture = sender as! UIPanGestureRecognizer
        let point = panGesture.location(in: self)
        let distance = point.x
        leftConstraint?.constant = (distance >= 0) ? distance : cutAudio.frame.minX
    }
    @objc func rightPanGesture(_ sender: Any?) {
        let panGesture = sender as! UIPanGestureRecognizer
        let point = panGesture.location(in: self)
        let distance = self.frame.width - point.x
        rightConstraint?.constant = (distance >= 0) ? distance : 0
    }
    
    @objc func leftTapGesture(_ sender: Any?) {
        let tapGesture = sender as! UITapGestureRecognizer
        tapGesture.numberOfTapsRequired = 1
        let point = tapGesture.location(in: self)
        let distance = point.x
        leftConstraint?.constant = distance
    }

    @objc func rightTapGesture(_ sender: Any?) {
        let tapGesture = sender as! UITapGestureRecognizer
        tapGesture.numberOfTapsRequired = 2
        let point = tapGesture.location(in: self)
        let distance = self.frame.width - point.x
        rightConstraint?.constant = distance
    }
}

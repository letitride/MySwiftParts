//
//  ViewController.swift
//  MySwiftParts
//
//  Created by 市川文也 on 2019/12/09.
//  Copyright © 2019 Fumiya Ichikawa. All rights reserved.
//

import UIKit

protocol MViewDelegate{
    func move(_ touches: Set<UITouch>, with event: UIEvent?)
}

class MView: UIView {
    
    var delegate:MViewDelegate?
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.layer.borderColor = UIColor.red.cgColor
        self.layer.borderWidth = 5
        self.layer.backgroundColor = UIColor.white.cgColor
        self.layer.cornerRadius = 50
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.delegate?.move( touches, with: event)
    }
}

class ViewController: UIViewController {

    let view1 = MView(frame: CGRect(x: 50, y: 50, width: 100, height: 100))
    let view2 = MView(frame: CGRect(x: 200, y: 200, width: 100, height: 100))
    
    let line1 = UIBezierPath()
    let shapeLayer = CAShapeLayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view1.delegate = self
        view2.delegate = self

        self.strokeLine()
        view.layer.addSublayer(shapeLayer)
        
        self.view.addSubview(view1)
        self.view.addSubview(view2)

    }
    
    private func strokeLine(){
        self.line1.move(to: view1.center)
        self.line1.addLine(to: view2.center)
        self.line1.stroke()
        self.shapeLayer.strokeColor = UIColor.blue.cgColor
        self.shapeLayer.path = self.line1.cgPath
    }
    
}

extension ViewController:MViewDelegate{
    
    func move(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first, let view = touch.view else { return }
        let location = touch.location(in: self.view)
        view.center = location
        
        self.line1.removeAllPoints()
        self.strokeLine()

    }
}


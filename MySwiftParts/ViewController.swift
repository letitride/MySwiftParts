//
//  ViewController.swift
//  MySwiftParts
//
//  Created by 市川文也 on 2019/12/09.
//  Copyright © 2019 Fumiya Ichikawa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let view1 = MView(frame: CGRect(x: 50, y: 50, width: 100, height: 100))
    let view2 = MView(frame: CGRect(x: 200, y: 200, width: 100, height: 100))

    
    class MView: UIView {
        
        var parent:UIView = UIView()
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

        func addView(parent:UIView){
            self.parent = parent
            parent.addSubview(self)
        }
        
        override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
            guard let touch = touches.first, let view = touch.view else { return }
            let location = touch.location(in: parent)
            view.center = location
        }

    }
    
    let line1 = UIBezierPath()


    override func viewDidLoad() {
        super.viewDidLoad()

        let shapeLayer = CAShapeLayer()
        line1.move(to: view1.center)
        line1.addLine(to: view2.center)
        line1.close()
        line1.stroke()
        shapeLayer.strokeColor = UIColor.blue.cgColor
        shapeLayer.path = line1.cgPath
        view.layer.addSublayer(shapeLayer)
        
        line1.move(to: CGPoint(x: 200, y: 300))
        line1.addLine(to: CGPoint(x: 300, y: 400))
        line1.stroke()
        shapeLayer.path = line1.cgPath

        view1.addView(parent: self.view)
        view2.addView(parent: self.view)
    }
    
}


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
    let view2 = MView(frame: CGRect(x: 100, y: 100, width: 100, height: 100))

    
    class MView: UIView {
        
        var parent:UIView = UIView()
        override init(frame: CGRect) {
            super.init(frame: frame)
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view1.layer.borderColor = UIColor.red.cgColor
        view1.layer.borderWidth = 10
        view2.layer.borderColor = UIColor.red.cgColor
        view2.layer.borderWidth = 10
        view1.addView(parent: self.view)
        view2.addView(parent: self.view)
    }
    
}


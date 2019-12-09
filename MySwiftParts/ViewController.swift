//
//  ViewController.swift
//  MySwiftParts
//
//  Created by 市川文也 on 2019/12/09.
//  Copyright © 2019 Fumiya Ichikawa. All rights reserved.
//

import UIKit
import TTTAttributedLabel

class ViewController: UIViewController {

    var myLabel:TTTAttributedLabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myLabel = TTTAttributedLabel(frame: CGRect(x: 0, y: 200, width: 500, height: 30))
        myLabel.center.x = self.view.frame.width - 15 - 15
        myLabel.center.y = 250 + 100

        view.addSubview(myLabel)
        
        //myLabel.font = UIFont.systemFont(ofSize: 20)
        //myLabel.textColor = UIColor.black
        myLabel.backgroundColor = UIColor.red

        //myLabel.numberOfLines = 0
        myLabel.verticalAlignment = .top

        let angle = CGFloat.pi/2
        myLabel.transform = CGAffineTransform(rotationAngle: CGFloat(angle))

        let text = "株式会社かぶ〜さん"

        myLabel.setText(text) { (mutableAttributedString) -> NSMutableAttributedString? in
            mutableAttributedString!.addAttribute(NSAttributedString.Key.init(rawValue: kCTVerticalFormsAttributeName as String), value: true, range: NSMakeRange(0, mutableAttributedString!.length))
            return mutableAttributedString
        }
        
        myLabelEditable()
    }
    
    let textField = UITextField()
    private func myLabelEditable(){
        myLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(changeLabel)))
        textField.isHidden = true
        textField.addTarget(self, action: #selector(textFieldEditingChanged(_:)), for: .editingChanged)
        view.addSubview(textField)
    }
    
    @objc func changeLabel(){
        textField.becomeFirstResponder()
    }
    
    @objc func textFieldEditingChanged(_ textField: UITextField){
        myLabel.setText(textField.text!) { (mutableAttributedString) -> NSMutableAttributedString? in
            mutableAttributedString!.addAttribute(NSAttributedString.Key.init(rawValue: kCTVerticalFormsAttributeName as String), value: true, range: NSMakeRange(0, mutableAttributedString!.length))
            return mutableAttributedString
        }
    }
}


//
//  ViewController.swift
//  MySwiftParts
//
//  Created by 市川文也 on 2019/12/09.
//  Copyright © 2019 Fumiya Ichikawa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let qrCImage = makeQRCode( str: "Sample" )
        guard let qr = qrCImage else{
            return
        }
        let imageView = UIImageView(image: UIImage(ciImage: qrCImage!))
        imageView.frame.size.width = 200
        imageView.frame.size.height = 200

        imageView.center.x = self.view.frame.width / 2
        imageView.center.y = self.view.frame.height / 2

        self.view.addSubview(imageView)
    }

    private func makeQRCode( str:String )->CIImage?{
        let data = str.data(using: .utf8)
        let qr = CIFilter(name: "CIQRCodeGenerator", parameters: ["inputMessage": data, "inputCorrectionLevel": "M"])
        let sizeTransform = CGAffineTransform(scaleX: 10, y: 10)
        if let qr = qr {
            return qr.outputImage!.transformed(by: sizeTransform)
        }
        return nil
    }
}


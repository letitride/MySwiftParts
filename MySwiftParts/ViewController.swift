//
//  ViewController.swift
//  MySwiftParts
//
//  Created by 市川文也 on 2019/12/09.
//  Copyright © 2019 Fumiya Ichikawa. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    var htmlBody = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let webView = WKWebView()
        webView.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        let url = URL(string: "https://example.jp")
        let urlRequest = URLRequest(url: url!)
        webView.load(urlRequest)
        webView.navigationDelegate = self
        view.addSubview(webView)
        
    }
}

extension ViewController:WKNavigationDelegate{

    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        let js = """
            var boxs = document.getElementsByClassName('classname')
            var minPrice = 0
            for( i=0;i<boxs.length;i++ ){
                var strPrice = boxs[i].getElementsByClassName('price')[0].innerText;
                var price = parseInt( strPrice.replace(/[,|¥]/g, '') );
                if( minPrice == 0 || minPrice < price ){
                    minPrice = price
                }
            }
            minPrice;
        """
        
        webView.evaluateJavaScript(js, completionHandler: { (html, error) -> Void in
            print(html)
            //self.htmlBody = html as! String
        })
    }
}

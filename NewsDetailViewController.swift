//
//  NewsDetailViewController.swift
//  Module-2
//
//  Created by Reinder de Vries on 31-03-15.
//  Copyright (c) 2015 LearnAppMaking. All rights reserved.
//

import UIKit
import Alamofire

class NewsDetailViewController: UIViewController, UIWebViewDelegate
{
    @IBOutlet var imageView:UIImageView?;
    @IBOutlet var titleLabel:UILabel?;
    @IBOutlet var authorLabel:UILabel?;
    @IBOutlet var webView:UIWebView?;
    
    var article:Article?
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        if article == nil
        {
            return
        }
        
        titleLabel?.text = article?.title
        imageView?.image = nil
        authorLabel?.text = article!.author
        
        webView?.delegate = self
        webView?.loadHTMLString("<html><head><style>body { font-family: Helvetica; }</style></head><body>\(article!.content)</body></html>", baseURL: nil)
        webView?.scrollView.isScrollEnabled = false
        
        if let thumbnailURL:URL = URL(string:article!.thumbnailURL)
        {
            Alamofire.request(thumbnailURL).responseData {
                response in
                
                if let data = response.result.value {
                    self.imageView?.image = UIImage(data: data)
                }
            }
        }
    
    
    func webViewDidFinishLoad(_ webView: UIWebView)
    {
        if let scrollHeight:String = webView.stringByEvaluatingJavaScript(from: "document.body.scrollHeight"),
            let n = NumberFormatter().number(from: scrollHeight)
        {
            let heightConstraint:NSLayoutConstraint = NSLayoutConstraint(item: webView, attribute:NSLayoutAttribute.height, relatedBy:NSLayoutRelation.equal, toItem:nil, attribute:NSLayoutAttribute.notAnAttribute, multiplier: 1.0, constant:CGFloat(n))
            webView.addConstraint(heightConstraint)
        }
        
    }
    
}
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

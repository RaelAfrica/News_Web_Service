//
//  NewsDetailViewController.swift
//  Module-2
//
//  Created by Reinder de Vries on 31-03-15.
//  Copyright (c) 2015 LearnAppMaking. All rights reserved.
//

import UIKit

class NewsDetailViewController: UIViewController
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
        authorLabel?.text = article!.author
        
        webView?.loadHTMLString(article!.content, baseURL: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

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
    
    var author:String?;

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        webView?.loadRequest(URLRequest(url: URL(string:"https://members.learnappmaking.com/module_2_lorem.html")!));
        
        titleLabel?.text = self.title;
        
        if(author != nil)
        {
            authorLabel?.text = "Author: \(author!)";
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

//
//  NewsTableViewController.swift
//  Module-2
//
//  Created by Reinder de Vries on 30-03-15.
//  Copyright (c) 2015 LearnAppMaking. All rights reserved.
//

import UIKit
import RealmSwift

class NewsTableViewController: UITableViewController
{
    
    var articles: Results<Article>
        {
        get {
            let realm = try! Realm()
            
            return realm.objects(Article.self)
        }
    }
    
    /// Property with news item titles
    var titles:[String] = [
        "New York Lakers Score Again!",
        "Apple Presents New iWatch",
        "Deeplink.me Wants To Break Open App Discovery",
        "Silly Cat Attempts Jump And Hits Air",
        "New MacBook Air So Thin People Can't See It",
        "Higgs-Boson Finally Discovered In Scientists Coat"
    ];
    
    /// Property with news item authors
    var authors:[String] = [
        "Bob",
        "Alice",
        "Reinder",
        "[Your name]",
        "Ford",
        "Zaphod"
    ];

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        let build = GAIDictionaryBuilder.createAppView().set("News Overview", forKey: kGAIScreenName).build() as NSDictionary
        GAI.sharedInstance().defaultTracker.send(build as [NSObject : AnyObject])
        
        NotificationCenter.default.addObserver(self, selector: #selector(onArticlesReceived(notification:)), name: API.articlesReceivedNotification, object: nil)
        
        API.sharedInstance.requestArticles()
    }

    func onArticlesReceived(notification:Notification)
    {
        self.tableView.reloadData()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int
    {
        // How many sections does the table view have?
        
        return 1;
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        // How many rows are there in the 1 section?
        
        return articles.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        // Dequeue a table view cell
        var cell:UITableViewCell? = tableView.dequeueReusableCell(withIdentifier: "cellIdentifier");
        
        // If there's no cell, create one
        if(cell == nil)
        {
            cell = UITableViewCell(style:UITableViewCellStyle.subtitle, reuseIdentifier:"cellIdentifier");
        }
        
        if let article:Article = articles[indexPath.row]
        {
            cell!.textLabel?.text = article.title
            cell!.detailTextLabel?.text = article.excerpt
        }
        
        return cell!;
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        // Create a new detail view controller
        var detailVC:NewsDetailViewController = NewsDetailViewController(nibName: "NewsDetailViewController", bundle:nil);
        
        if let article:Article = articles[indexPath.row]
        {
            detailVC.article = article
        }
        
        // Push the the detail view controller on the view controller stack
        navigationController?.pushViewController(detailVC, animated:true);
    }
    
    
}

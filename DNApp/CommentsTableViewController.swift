//
//  CommentsTableViewController.swift
//  DNApp
//
//  Created by Meng To on 2015-03-08.
//  Copyright (c) 2015 Meng To. All rights reserved.
//

import UIKit

class CommentsTableViewController: UITableViewController {

    var story: JSON!
    var comments: JSON!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.estimatedRowHeight = 140
        tableView.rowHeight = UITableViewAutomaticDimension
        
        comments = story["comments"]
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return comments.count + 1
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let identifer = indexPath.row == 0 ? "StoryCell" : "CommentCell"
        
        let cell = tableView.dequeueReusableCellWithIdentifier(identifer) as UITableViewCell!
        
        if let storyCell = cell as? StoryTableViewCell {
            storyCell.configureWithStory(story)
        }
        
        if let commentCell = cell as? CommentTableViewCell {
            let comment = comments[indexPath.row - 1]
            commentCell.configureWithComment(comment)
        }
        
        return cell
    }
}

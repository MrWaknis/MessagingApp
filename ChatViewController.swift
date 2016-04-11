//
//  ViewController.swift
//  WhaleTalk
//
//  Created by Mihir Waknis on 1/15/16.
//  Copyright © 2016 mihirwaknis. All rights reserved.
//

import UIKit

class ChatViewController: UIViewController {
    
    private let tableView = UITableView()
    
    private var  messages = [Message]()
    private let cellIdentifier = "Cell"

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        var localIncoming = true
        
        
        for i in 0...10 {
            let m = Message()
            m.text = String(i)
            m.incoming = localIncoming
            localIncoming = !localIncoming
            messages.append(m)
            
        }
        
        
        
        for eachMessage in messages{
            print(eachMessage, ":", eachMessage.text)
        }
        
        tableView.registerClass(ChatCell.self, forCellReuseIdentifier: cellIdentifier)
        tableView.dataSource = self
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        
        let tableViewConstraints: [NSLayoutConstraint] = [
        
            tableView.topAnchor.constraintEqualToAnchor(topLayoutGuide.bottomAnchor),
            tableView.leadingAnchor.constraintEqualToAnchor(view.leadingAnchor),
            tableView.trailingAnchor.constraintEqualToAnchor(view.trailingAnchor),
            tableView.bottomAnchor.constraintEqualToAnchor(view.bottomAnchor)
            
        ]
        NSLayoutConstraint.activateConstraints(tableViewConstraints)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ChatViewController: UITableViewDataSource {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath:indexPath) as! ChatCell
        let message  = messages[indexPath.row]
        cell.messageLabel.text = message.text
        cell.incoming(message.incoming)
        return cell
    }
}








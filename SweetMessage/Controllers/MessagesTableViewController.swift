//
//  MessagesTableViewController.swift
//  SweetMessage
//
//  Created by Fabio Quintanilha on 1/5/18.
//  Copyright © 2018 Fabio Quintanilha. All rights reserved.
//

import UIKit
import FirebaseFirestore

class MessagesTableViewController: UITableViewController {
    
   var messages = [Message]()
   
    
    struct Properties {
        static var cellIdentifier = "MessageCell"
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 120
        
    }

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
       
        FirestoreService.shared.loadData(from: .messages) { (messages) in
            self.messages = messages
            self.tableView.reloadData()
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        FirestoreService.shared.stopObserverQuery()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return messages.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MessageCell", for: indexPath) as! MessageCell
        
        let message = messages[indexPath.row]
        
        cell.messageLabel.text = message.content
        cell.titleLabel.text = message.subject
        
        let messageTime = message.timeStampCalc()
        cell.timeLabel.text = messageTime
        
        return cell
    }

}

//
//  Message.swift
//  SweetMessage
//
//  Created by Fabio Quintanilha on 1/5/18.
//  Copyright © 2018 Fabio Quintanilha. All rights reserved.
//

import Foundation
import FirebaseFirestore

struct Message{
    
    var messageID: String? = nil
    var sender: String!
    var subject: String!
    var content: String!
    var timeStamp: Date!
    
    
    init (sender: String, subject: String, content: String) {
        self.sender = sender
        self.subject = subject
        self.content = content
        self.timeStamp = Date()
    }
    
    init (sender: String, subject: String, content: String, timeStamp: Date) {
        self.sender = sender
        self.subject = subject
        self.content = content
        self.timeStamp = timeStamp
    }
    
     //Computed Property
    var dictionary : [String : Any] {
        return [ "sender" : sender,
                "subject" : subject,
                "content" : content,
                "timeStamp" : timeStamp] }
    
    
    func timeStampCalc() -> String {
        let interval = Int(abs(timeStamp.timeIntervalSinceNow) / 60)
        
        var intervalTime = ""
        
        if interval < 1 {
            intervalTime = "few seconds ago"
        }
        else if interval >= 1 && interval < 60 {
            if interval == 1 {
                intervalTime = "\(interval) minute ago"
            }
            else {
                intervalTime = "\(interval) minutes ago"
            }
        }
        else if interval >= 60 && interval < 1440{
            if interval < 120 {
                intervalTime = "\(interval / 60) hour ago"
            }
            else {
                intervalTime = "\(interval / 60) hours ago"
            }
        }
        else if interval >= 1440 && interval < 525600 {
            if interval < 2880 {
                intervalTime = "\(interval / 1440) day ago"
            }
            else {
                intervalTime = "\(interval / 1440) days"
            }
        }
        else if interval >= 525600 {
            intervalTime = "Over a year ago"
        }
        
        print("time interval = \(interval) minutes ago")
        return intervalTime
    }
    
}

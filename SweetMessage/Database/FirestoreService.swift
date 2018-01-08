//
//  FirestoreService.swift
//  SweetMessage
//
//  Created by Fabio Quintanilha on 1/6/18.
//  Copyright © 2018 Fabio Quintanilha. All rights reserved.
//

import Foundation
import Firebase
import FirebaseFirestore

class FirestoreService {
    
    private init(){}
    static let shared = FirestoreService()
    
    private var dataInserted : DocumentReference?
    private var messageListener : ListenerRegistration?
    
    
    private func reference(to collectionReference : DataCollectionReference) -> CollectionReference {
        return Firestore.firestore().collection(collectionReference.rawValue)
    }
    
    
    
    func create(message: Message, to collectionReference: DataCollectionReference) {
        
        dataInserted = reference(to: collectionReference).addDocument(data: message.dictionary) { (error) in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            else {
                 print("Document added with ID: \(String(describing: self.dataInserted?.documentID))")
            }
        }

    }
    
    
    
    func loadData(from collectionReference: DataCollectionReference, completion: @escaping ([Message]) -> Void){
        
        reference(to: collectionReference).order(by: "timeStamp", descending: true).addSnapshotListener { (snapshot, error) in
            if let error = error {
                print("Error Retriving data: \(error.localizedDescription)")
                return
            }
            
            guard let snapshot = snapshot else { return }
            
            var messages = [Message]()
            
            for document in snapshot.documents {
                var dictionary = [String : Any]()
                dictionary = document.data()
                
                if let sender = dictionary["sender"], let content = dictionary["content"], let subject = dictionary["subject"], let timeStamp = dictionary["timeStamp"] {
                   
                    let message = Message(sender: sender as! String, subject: subject as! String, content: content as! String, timeStamp: timeStamp as! Date)
                    
                    messages.append(message)
                }
            }
            completion(messages)
        }
        
    }
    
    func stopObserverQuery() {
        messageListener?.remove()
    }
    
}

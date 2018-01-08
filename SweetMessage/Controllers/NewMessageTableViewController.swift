//
//  NewMessageTableViewController.swift
//  SweetMessage
//
//  Created by Fabio Quintanilha on 1/5/18.
//  Copyright © 2018 Fabio Quintanilha. All rights reserved.
//

import UIKit
import Firebase

class NewMessageTableViewController: UITableViewController, UITextViewDelegate {
    
    
    
    @IBOutlet weak var subjectTextField: UITextField!
    @IBOutlet weak var messageTextView: UITextView!
    @IBOutlet weak var wordCount: UILabel!
    
    let maximumChar = 140
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        messageTextView.delegate = self
        
//        messageTextView.placeholder = "Insert your Message here"
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    
    
    @IBAction func saveBtnTapped(_ sender : UIBarButtonItem) {
        
        guard let subject = subjectTextField.text, !subject.isEmpty else { return }
        guard let content = messageTextView.text, !content.isEmpty else { return }
        
        let message = Message(sender: "Fabio", subject: subject, content: content)

        FirestoreService.shared.create(message: message, to: .messages)
        
        self.navigationController?.popViewController(animated: true)
    }
    
    
    
    @IBAction func cancelBtnTapped () {
        self.navigationController?.popViewController(animated: true)
    }

}



extension NewMessageTableViewController {
    
    // ----------------------- Counting the chars on the TextView ---------------------
    public func textViewDidChange(_ textView: UITextView) {
        wordCount.text = "\(textView.text.count) | 140"
    }
    
    
    // --------------------- Limiting the maximum characters on the textView ----------------
    public func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        
        guard text.characters.count > 0 else {
            return true
        }
        
        let currentText = textView.text ?? ""
        
        let prospectiveText = (currentText as NSString).replacingCharacters(in: range, with: text)
        
        return prospectiveText.characters.count <= maximumChar
        
    }
    
}

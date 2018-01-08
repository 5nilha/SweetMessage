//
//  TextViewPlaceholder.swift
//  SweetMessage
//
//  Created by Fabio Quintanilha on 1/8/18.
//  Copyright © 2018 Fabio Quintanilha. All rights reserved.
//

import UIKit

struct CountingChars {
    
    static var counting : Int = 0
}


extension UITextView {
    
    
    //----------------------- Creates a TextView Placeholder ----------------------
//    
//    
//    override open var bounds: CGRect {
//        didSet {
//            self.resizePlaceholder()
//        }
//    }
//    
//    
//    public var placeholder: String? {
//        get {
//            var placeholderText: String?
//            
//            if let placeholderLbl = self.viewWithTag(50) as? UILabel {
//                placeholderText = placeholderLbl.text
//            }
//            
//            return placeholderText
//        }
//        set {
//            if let placeholderLbl = self.viewWithTag(50) as! UILabel? {
//                placeholderLbl.text = newValue
//                placeholderLbl.sizeToFit()
//            } else {
//                self.addPlaceholder(newValue!)
//            }
//        }
//    }
//    
//    public func textViewDidChange(_ textView: UITextView) {
//        if let placeholderLbl = self.viewWithTag(50) as? UILabel {
//            placeholderLbl.isHidden = self.text.characters.count > 0
//        }
//        
//        print("Changing : \(textView.text.count)")
//    }
//    
//    
//    
//    private func resizePlaceholder() {
//        if let placeholderLbl = self.viewWithTag(50) as! UILabel? {
//            let x = self.textContainer.lineFragmentPadding
//            let y = self.textContainerInset.top - 2
//            let width = self.frame.width - (x * 2)
//            let height = placeholderLbl.frame.height
//            
//            placeholderLbl.frame = CGRect(x: x, y: y, width: width, height: height)
//        }
//    }
//    
//    private func addPlaceholder(_ placeholderText: String) {
//        let placeholderLbl = UILabel()
//        
//        placeholderLbl.text = placeholderText
//        placeholderLbl.sizeToFit()
//        
//        placeholderLbl.font = self.font
//        placeholderLbl.textColor = UIColor.lightGray
//        placeholderLbl.tag = 50
//        
//        placeholderLbl.isHidden = self.text.characters.count > 0
//        
//        self.addSubview(placeholderLbl)
//        self.resizePlaceholder()
//        self.delegate = self
//    }
    
}

//
//  MessagesVC.swift
//  splan
//
//  Created by cspeng on 2016/11/21.
//  Copyright © 2016年 shan. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

import Photos
class MessagesVC:JSQMessagesViewController {

     var messages = [JSQMessage]()
     var outgoingBubbleImageView: JSQMessagesBubbleImage!
     var incomingBubbleImageView: JSQMessagesBubbleImage!
     var messageRef:FIRDatabaseReference!
     var userTypingQuery:FIRDatabaseQuery!

     let rootRef = FIRDatabase.database().reference(fromURL: "https://splan-4968e.firebaseio.com/")

 
    
     let uid=UIDevice.current.identifierForVendor!.uuidString
     var userIsTypingRef:FIRDatabaseReference! //1
     private var localTyping = false //2
      var isTyping: Bool {set{ //3
        localTyping = newValue
        userIsTypingRef.setValue(newValue)
        } get{
            return localTyping
        }
     }
    
    


    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        senderId=uid
        senderDisplayName="test1"
        self.navigationItem.title=Title.menun5_title
        self.navigationController?.navigationBar.isHidden=false
        self.navigationController?.navigationBar.barTintColor=Common.CommonColor
        setupBubbles()
    
        collectionView.collectionViewLayout.incomingAvatarViewSize = CGSize.zero
        collectionView.collectionViewLayout.outgoingAvatarViewSize = CGSize.zero
        messageRef = rootRef.child("messages")
        
        self.navigationController?.navigationBar.isHidden=false
        

 
    
        // Do any additional setup after loading the view.
    }
    
    
    override func viewDidAppear(_ animated: Bool) { super.viewDidAppear(animated) // messages from someone else
       
         observeMessages()

         observeIsTyping()
        

        
    }
    
    

    
    func addMessage(id: String,displayName:String, text: String) {
        let message = JSQMessage(senderId: id, displayName: displayName, text: text)
        
        self.messages.append(message!)
    }
    
    

    
    override func collectionView(_ collectionView: JSQMessagesCollectionView!, messageDataForItemAt indexPath: IndexPath!) -> JSQMessageData! {
        
        print(self.messages[indexPath.item])
             return self.messages[indexPath.item]
    }
    
    
    override func collectionView(_ collectionView: JSQMessagesCollectionView!, messageBubbleImageDataForItemAt indexPath: IndexPath!) -> JSQMessageBubbleImageDataSource! {
        
        let message = self.messages[indexPath.item] // 1
        if message.senderId == senderId { // 2
            return outgoingBubbleImageView
        } else { // 3
            return incomingBubbleImageView
        }

        
    }
    override func collectionView(_ collectionView: JSQMessagesCollectionView!, avatarImageDataForItemAt indexPath: IndexPath!) -> JSQMessageAvatarImageDataSource! {
        
     

        return nil
    }
    override func collectionView(_ collectionView: JSQMessagesCollectionView!, attributedTextForCellTopLabelAt indexPath: IndexPath!) -> NSAttributedString! {
        let message = messages[indexPath.item]
        switch message.senderId {
        case senderId:
            return nil
        default:
            guard let senderDisplayName = message.senderDisplayName else {
                assertionFailure()
                return nil
            }
            return NSAttributedString(string: senderDisplayName)
        }
    }

 
    
   
    
    override  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
        let cell = super.collectionView(collectionView, cellForItemAt: indexPath)as! JSQMessagesCollectionViewCell
        let message = messages[indexPath.item]
        
       // var imageName = "geisha.png"
//        var image = UIImage(named: imageName)
//     
//         cell.avatarImageView.image=image
        if message.senderId == senderId {
            cell.textView.textColor = UIColor.white
        } else {
            cell.textView.textColor = UIColor.black
//             imageName = "m2"
//             image = UIImage(named: imageName)
        }
        
        
        return cell

    
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return   self.messages.count
    }
    
    
    override func collectionView(_ collectionView: JSQMessagesCollectionView!, layout collectionViewLayout: JSQMessagesCollectionViewFlowLayout!, heightForMessageBubbleTopLabelAt indexPath: IndexPath!) -> CGFloat {
        return 15
    }
    
    override func collectionView(_ collectionView: JSQMessagesCollectionView?, attributedTextForMessageBubbleTopLabelAt indexPath: IndexPath!) -> NSAttributedString? {
        let message = messages[indexPath.item]
        
        switch message.senderId {
        case senderId:
            return nil
        default:
            guard let senderDisplayName = message.senderDisplayName else {
                assertionFailure()
                return nil
            }
            
            
          
            return NSAttributedString(string: senderDisplayName)
        }
    }

    override func collectionView(_ collectionView: JSQMessagesCollectionView!, header headerView: JSQMessagesLoadEarlierHeaderView!, didTapLoadEarlierMessagesButton sender: UIButton!) {

        
        
    }
    override func didPressSend(_ button: UIButton!, withMessageText text: String!, senderId: String!, senderDisplayName: String!, date: Date!) {
        let itemRef = messageRef.childByAutoId()
        let messageItem = [ "text":text, "senderId":senderId,"displayName":senderDisplayName]
        
        
        itemRef.setValue(messageItem)
        JSQSystemSoundPlayer.jsq_playMessageSentSound()
        finishSendingMessage()
        isTyping = false

    
    }
    

    private func setupBubbles() {
        
        let factory = JSQMessagesBubbleImageFactory()
        outgoingBubbleImageView = factory?.outgoingMessagesBubbleImage( with: UIColor.jsq_messageBubbleBlue())
       
        incomingBubbleImageView = factory?.incomingMessagesBubbleImage( with: UIColor.jsq_messageBubbleLightGray())
    }
    
    
    func observeMessages() { //1
        let messagesQuery = messageRef.queryLimited(toLast: 25) //2
        messagesQuery.observe(.childAdded) { [weak self] (snpaShot:FIRDataSnapshot) in
            //3
            guard let dict = snpaShot.value as? [String:AnyObject] else { return }
            guard let id = dict["senderId"] as? String else { return }
            guard let text = dict["text"] as? String else { return } //4
            
            guard let displayName = dict["displayName"] as? String else { return } //5
         
            
            self?.addMessage(id:id,displayName:displayName,text: text) //5
            
           
            self?.finishReceivingMessage()
        }
    }
    
    override func textViewDidChange(_ textView: UITextView) { super.textViewDidChange(textView) // If the text is not empty, the user is typing
        print(textView.text != "")
        print("text")
        isTyping = textView.text != ""

    }
    
//    func observeIsTyping() {
//        
//        let typingIndicatorRef = rootRef.child("typingIndicator")
//        userIsTypingRef = typingIndicatorRef.child(senderId)
//        userIsTypingRef.onDisconnectRemoveValue()
//    }

    func observeIsTyping() { let typingIndicatorRef = rootRef.child("typingIndicator")
        userIsTypingRef = typingIndicatorRef.child(senderId)
        userIsTypingRef.onDisconnectRemoveValue() //1
        userTypingQuery = typingIndicatorRef.queryOrderedByValue().queryEqual(toValue: true) //2
        userTypingQuery.observe(.value) { [weak self] (snapShot:FIRDataSnapshot) in
            if let weakself = self { //3 You're the only typing, don't show the indicator
                if snapShot.childrenCount == 1 && weakself.isTyping { return } // 4 Are there others typing?
                weakself.showTypingIndicator = snapShot.childrenCount > 1
                weakself.scrollToBottom(animated: true)
            }
        }
    }




}

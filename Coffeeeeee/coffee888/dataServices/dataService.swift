import Foundation
import Firebase
let DB_Base = Database.database().reference()

class DataService {
    static let instance = DataService()
    private var _REF_BASE = DB_Base
    private var _REF_USERS = DB_Base.child("users")
    private var _REF_GROUP = DB_Base.child("group")
    private var _REF_FEED = DB_Base.child("feed")

var REF_BASE: DatabaseReference {
    return DB_Base
}
    var REF_USERS: DatabaseReference {
    return _REF_USERS
    }
    var REF_GROUP: DatabaseReference {
    return _REF_GROUP
}
    var REF_FEED: DatabaseReference {
    return _REF_FEED
}
    func createDBUser(uid: String, userData: Dictionary<String, Any>) {
    REF_USERS.child(uid).updateChildValues(userData)
}
    func getUsername (forUID uid: String, handler: @escaping (_ username: String) -> ()) {
       REF_USERS.observeSingleEvent(of: .value) { (userSnapshot) in
         guard let userSnapshot = userSnapshot.children.allObjects as?  [DataSnapshot] else
       {return}
      for user in userSnapshot {
            if user.key == uid {
                   handler(user.childSnapshot(forPath: "phoneNumber").value as! String)
                   }
        }
          }
    }
    func uploadPost(withMessage message:String, forUID uid: String, withGroupKey groupKey: String?, sendComplete: @escaping(_ status:Bool) -> ()) {
        if groupKey != nil {
            
        } else {
            REF_FEED.childByAutoId().updateChildValues(["content": message, "senderId": uid])
            sendComplete(true)
        }
    }
    func getAllFeedMessages(handler: @escaping(_ messages: [Message]) -> ())  {
       var messageArray = [Message]()
        REF_FEED.observeSingleEvent(of: .value) { (feedMessageSnapshot) in
            guard let feedMessageSnapshot = feedMessageSnapshot.children.allObjects as?
                [DataSnapshot] else {return}
            
            for message in feedMessageSnapshot {
                let content = message.childSnapshot(forPath: "content").value as! String
                let senderId = message.childSnapshot(forPath: "senderId").value as! String
                let message = Message(content: content, senderId: senderId)
            messageArray.append(message)
            }
            handler(messageArray)
        }
}

}

/*:
 # Custom iOS Notification Center
 
 Implemennt iOS Notification Center
 
 - addObserver
 - removeObserver
 - post
 
 /****************  Notification Center  ****************/
 open class NotificationCenter : NSObject {
 
 
 open class var `default`: NotificationCenter { get }
 
 
 open func addObserver(_ observer: Any, selector aSelector: Selector, name aName: NSNotification.Name?, object anObject: Any?)
 
 
 open func post(_ notification: Notification)
 
 open func post(name aName: NSNotification.Name, object anObject: Any?)
 
 open func post(name aName: NSNotification.Name, object anObject: Any?, userInfo aUserInfo: [AnyHashable : Any]? = nil)
 
 
 open func removeObserver(_ observer: Any)
 
 open func removeObserver(_ observer: Any, name aName: NSNotification.Name?, object anObject: Any?)
 
 
 @available(iOS 4.0, *)
 open func addObserver(forName name: NSNotification.Name?, object obj: Any?, queue: OperationQueue?, using block: @escaping (Notification) -> Void) -> NSObjectProtocol
 }
 
 Follow up:
 - thread safe
 
 */


/*:
 **Time Complexity:**
 
 **Space Complexity:**
 */

import NotificationCenter

class CustomNotificationCenter {
  
  let lock: NSLock = NSLock()
  
  func addObserver(name: String, object: Any?, queue: OperationQueue?, using: (String) -> Void) {
    
  }
  
  func addObserver(_ observer: Any, name: String, object: Any?, selector: Selector) {
    
  }
  
  func post(name aName: NSNotification.Name, object anObject: Any?) {
  }
  
  func removeObserver(_ observer: Any, name aName: NSNotification.Name?, object anObject: Any?) {
    
  }
  
}

/*:
 ## Test
 */
import XCTest

class TestCustomNotificationCenter: XCTestCase {
  
  
  
}

TestCustomNotificationCenter.defaultTestSuite.run()

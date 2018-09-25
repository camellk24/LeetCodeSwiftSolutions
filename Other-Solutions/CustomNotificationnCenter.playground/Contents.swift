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

enum Handler {
  case block((String) -> Void)
  case selector(Selector)
}

class CustomNotificationCenter {
  
  typealias Observer = (object: AnyObject?, queue: OperationQueue, handler: Handler)
  
  var dict: [String : [Observer]] = [:]
  var generalObservers: [Observer] = []
  let assessQueue = DispatchQueue(label: "notificationqueue")
  
  func addObserver(name: String?, object: Any?, queue: OperationQueue?, using: @escaping (String) -> Void) {
    guard let _queue = (queue ?? OperationQueue.current) else {
      return
    }
    
    assessQueue.async {
      print("current thread: \(Thread.current)")
      let _object = object as AnyObject
      let observer: Observer = (_object, _queue, Handler.block(using))
      if let name = name {
        if var existing = self.dict[name] {
          existing.append(observer)
          self.dict[name] = existing
        } else {
          self.dict[name] = [observer]
        }
      } else {
        self.generalObservers.append(observer)
      }
    }
  }
  
  func addObserver(_ observer: Any, name: String, object: Any?, selector: Selector) {
    
  }
  
  func post(name: String?, object anObject: Any?) {
    assessQueue.sync {
      if let name = name {
        if let observers = self.dict[name] {
          for observer in observers {
            self.post(name: name, observer: observer)
          }
        }
      } else {
        for observer in generalObservers {
          self.post(name: name, observer: observer)
        }
      }
    }
  }
  
  private func post(name: String?, observer: Observer) {
    let name = name ?? ""
    switch observer.handler {
    case .block(let _block):
      print("queue: \(observer.queue)")
      observer.queue.underlyingQueue?.async {
        _block(name)
      }
    case .selector(let _selector):
      observer.queue.underlyingQueue?.perform(_selector)
    }
  }
  
  func removeObserver(_ observer: Any, name aName: String?, object anObject: Any?) {
    let _observer = observer as AnyObject
    assessQueue.async {
      if let aName = aName {
        if let existing = self.dict[aName] {
          self.dict[aName] = existing.filter({ $0.object !== _observer })
        }
      } else {
        self.generalObservers = self.generalObservers.filter({ $0.object !== _observer })
      }
    }
  }
  
  
}

/*:
 ## Test
 */
import XCTest

class Object {}

class TestCustomNotificationCenter: XCTestCase {
  
  
  
  func testCusomNotficationCenter() {
    let notificationCenter = CustomNotificationCenter()
    let objectA = Object()
    
    notificationCenter.addObserver(name: "event 1", object: objectA, queue: nil) { (name) in
      print("object A event: \(name)")
    }
    
    notificationCenter.addObserver(name: "event 2", object: objectA, queue: nil) { (name) in
      print("object A event: \(name)")
    }
    
    print("before remve event 1:")
    notificationCenter.post(name: "event 1", object: nil)
    notificationCenter.post(name: "event 2", object: nil)
    
    notificationCenter.removeObserver(objectA, name: "event 1", object: nil)
    print("after remve event 1:")
    notificationCenter.post(name: "event 1", object: nil)
    notificationCenter.post(name: "event 2", object: nil)
    
  }
  
}

TestCustomNotificationCenter.defaultTestSuite.run()

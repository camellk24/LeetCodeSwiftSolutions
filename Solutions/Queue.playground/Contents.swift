/*:
 # Queue
 
 A set is a collection of elements that is kind of like an array but with two important differences: the order of the elements in the set is unimportant and each element can appear only once.
 
 */

/*:
 Queue
 */

public class Queue<T> {
  
  private class QueueNode<T> {
    var value: T?
    var next: QueueNode<T>?
    
    init(_ value: T? = nil) {
      self.value = value
    }
  }

  
  private var head: QueueNode<T>
  private var tail: QueueNode<T>
  
  public var isEmpty: Bool {
    return head.next == nil
  }
  
  init() {
    // set tail = head add the begining
    head = QueueNode<T>()
    self.tail = head
  }
  
  public func enqueue(_ value: T) {
    let newNode = QueueNode<T>(value)
    tail.next = newNode
    tail = newNode
  }
  
  public func dequeue() -> T? {
    let value = head.next?.value
    
    head.next = head.next?.next
    
    if head.next == nil {
      tail = head
    }
    
    return value
  }
  
  public func peek() -> T? {
    return head.next?.value
  }
}


/*:
 ## Test
 */
import XCTest

class TestQueue: XCTestCase {
  
  func testQueue() {
    let queue = Queue<Int>()
    queue.enqueue(1)
    XCTAssertEqual(queue.peek(), 1)
    queue.enqueue(2)
    XCTAssertEqual(queue.peek(), 1)
    XCTAssertEqual(queue.dequeue(), 1)
    XCTAssertEqual(queue.peek(), 2)
    XCTAssertEqual(queue.isEmpty, false)
    XCTAssertEqual(queue.dequeue(), 2)
    XCTAssertEqual(queue.isEmpty, true)
  }
  
}

TestQueue.defaultTestSuite.run()

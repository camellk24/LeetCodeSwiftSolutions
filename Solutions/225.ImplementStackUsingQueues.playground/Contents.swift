/*:
 # 225. Implement Stack Using Queues
 
 Implement the following operations of a stack using queues.
 
 push(x) -- Push element x onto stack.
 pop() -- Removes the element on top of the stack.
 top() -- Get the top element.
 empty() -- Return whether the stack is empty.
 Example:
 
 MyStack stack = new MyStack();
 
 stack.push(1);
 stack.push(2);
 stack.top();   // returns 2
 stack.pop();   // returns 2
 stack.empty(); // returns false
 Notes:
 
 You must use only standard operations of a queue -- which means only push to back, peek/pop from front, size, and is empty operations are valid.
 Depending on your language, queue may not be supported natively. You may simulate a queue by using a list or deque (double-ended queue), as long as you use only standard operations of a queue.
 You may assume that all operations are valid (for example, no pop or top operations will be called on an empty stack).
 
 */

/*:
 Using Linked List Queue
 */

public class MyStack<T> {
  
  var queue1: Queue<T>
  var queue2: Queue<T>
  
  var isEmpty: Bool {
    return false
  }
  
  init() {
    queue1 = Queue<T>()
    queue2 = Queue<T>()
  }
  
  public func push(_ item: T) {
    queue1.enqueue(item)
  }
  
  public func pop() -> T? {
    moveItems()
    if let item = queue1.dequeue() {
      swapQueues()
      return item
    } else {
      swapQueues()
      return nil
    }
  }
  
  
  public func top() -> T? {
    moveItems()
    if let item = queue1.dequeue() {
      swapQueues()
      queue1.enqueue(item)
      return item
    } else {
      swapQueues()
      return nil
    }
  }
  
  private func swapQueues() {
    let temp = queue2
    queue2 = queue1
    queue1 = temp
  }
  
  private func moveItems() {
    while queue1.count != 1 {
      queue2.enqueue(queue1.dequeue()!)
    }
  }
  
}
  


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
  
  var count: Int = 0
  
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
    count += 1
  }
  
  public func dequeue() -> T? {
    let value = head.next?.value
    
    head.next = head.next?.next
    count -= 1
    
    if head.next == nil {
      tail = head
      count = 0
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

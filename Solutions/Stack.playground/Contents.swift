/*:
 # Stack
 
 A stack is like an array but with limited functionality. You can only push to add a new element to the top of the stack, pop to remove the element from the top, and peek at the top element without popping it off.
 
 */

/*:
 Stack
 */

struct Stack<T> {
  
  private var array: [T] = []
  
  public var count: Int {
    return array.count
  }
  
  public mutating func push(_ element: T) {
    array.append(element)
  }
  
  public mutating func pop() -> T? {
    return array.popLast()
  }
  
  public var top: T? {
    return array.last
  }
  
}



/*:
 ## Test
 */
import XCTest

class TestStack: XCTestCase {
  
  func testStack() {
    var stack = Stack<Int>()
    stack.push(1)
    XCTAssertEqual(stack.top, 1)
    stack.push(2)
    XCTAssertEqual(stack.top, 2)
    stack.push(1)
    XCTAssertEqual(stack.top, 1)
    XCTAssertEqual(stack.pop(), 1)
    XCTAssertEqual(stack.count, 2)
  }
  
}

TestStack.defaultTestSuite.run()

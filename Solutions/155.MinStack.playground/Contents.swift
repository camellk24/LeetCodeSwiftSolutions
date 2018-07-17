/*:
 # 155. Min Stack
 
 Design a stack that supports push, pop, top, and retrieving the minimum element in constant time.
 
 push(x) -- Push element x onto stack.
 pop() -- Removes the element on top of the stack.
 top() -- Get the top element.
 getMin() -- Retrieve the minimum element in the stack.
 Example:
 MinStack minStack = new MinStack();
 minStack.push(-2);
 minStack.push(0);
 minStack.push(-3);
 minStack.getMin();   --> Returns -3.
 minStack.pop();
 minStack.top();      --> Returns 0.
 minStack.getMin();   --> Returns -2.
 
 
 class MinStack {
 
 init() {
 
 }
 
 func push(_ num: Int) {
 
 }
 
 func pop() {
 
 }
 
 func top() -> Int? {
 
 }
 
 func getMin() -> Int? {
 
 }
 }
 
 */


/*:
 
 Use second stack to track min
 
 */

class MinStack {
  
  var stack: [Int]
  var minStack: [Int]
  
  init() {
    stack = []
    minStack = []
  }
  
  // O(1)
  func push(_ num: Int) {
    stack.append(num)
    if minStack.isEmpty {
      minStack.append(num)
    } else {
      if num <= minStack.last! {
        minStack.append(num)
      }
    }
  }
  
  // O(1)
  func pop() {
    if minStack.last == stack.last {
      minStack.popLast()
    }
    stack.popLast()
  }
  
  // O(1)
  func top() -> Int? {
    return stack.last
  }
  
  // O(1)
  func getMin() -> Int? {
    return minStack.last
  }
}

/*:
 ## Test
 */
import XCTest

class TestMinStack: XCTestCase {
  
  func testMinStack() {
    let minStack = MinStack()
    minStack.push(-2)
    minStack.push(0)
    minStack.push(-3)
    XCTAssertEqual(minStack.getMin(), -3)
    minStack.pop()
    XCTAssertEqual(minStack.top(), 0)
    XCTAssertEqual(minStack.getMin(), -2)
  }
  
}

TestMinStack.defaultTestSuite.run()

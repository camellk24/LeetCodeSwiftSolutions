/*:
 # 341. Flatten Nested List Iterator
 
 Given a nested list of integers, implement an iterator to flatten it.
 
 Each element is either an integer, or a list -- whose elements may also be integers or other lists.
 
 Example 1:
 Given the list [[1,1],2,[1,1]],
 
 By calling next repeatedly until hasNext returns false, the order of elements returned by next should be: [1,1,2,1,1].
 
 Example 2:
 Given the list [1,[4,[6]]],
 
 By calling next repeatedly until hasNext returns false, the order of elements returned by next should be: [1,4,6].
 
 */


/*:
 
 **Time Complexity:** O(n)
 
 **Space Complexity:** O(n)
 
 */

public class NestedIterator {
  
  var stack: [Any] = []
  
  public init(nestedArray: [Any]) {
    pushNestedArrayToStack(nestedArray)
  }
  
  public func next() -> Int? {
    if hasNext() {
      return stack.removeLast() as? Int
    } else {
      return nil
    }
  }
  
  public func hasNext() -> Bool {
    while let _ = stack.last as? [Any] {
      pushNestedArrayToStack(stack.removeLast() as! [Any])
    }
    return !stack.isEmpty
  }
  
  private func pushNestedArrayToStack(_ nestedArray: [Any]) {
    
    //    // add element to stack reversely
    //    // e.g nestedArray: [[1, 2], 3, [4, 5]]
    //    // stack: [[4, 5], 3. [1, 2]]
    
    var i = nestedArray.count - 1
    while i >= 0 {
      stack.append(nestedArray[i])
      i -= 1
    }
  }
  
}




/*:
 ## Test
 */
import XCTest

class TestNestedArrayIterator: XCTestCase {
  
  func testFlattenNestedArray1() {
    let testArray: [Any] = [[1, 2], 3, [4, 5]]
    let nestedIterator = NestedIterator(nestedArray: testArray)
    var result: [Int] = []
    while let next = nestedIterator.next() {
      result.append(next)
    }
    XCTAssertEqual(result, [1, 2, 3, 4, 5])
  }
  
  func testFlattenNestedArray2() {
    let testArray: [Any] = [[1, [2, 3]], 4, [5]]
    let nestedIterator = NestedIterator(nestedArray: testArray)
    var result: [Int] = []
    while let next = nestedIterator.next() {
      result.append(next)
    }
    XCTAssertEqual(result, [1, 2, 3, 4, 5])
  }
  
  func testFlattenNestedArray3() {
    let testArray: [Any] = [1, 2, 3, 4, 5]
    let nestedIterator = NestedIterator(nestedArray: testArray)
    var result: [Int] = []
    while let next = nestedIterator.next() {
      result.append(next)
    }
    XCTAssertEqual(result, [1, 2, 3, 4, 5])
  }
  
}

TestNestedArrayIterator.defaultTestSuite.run()

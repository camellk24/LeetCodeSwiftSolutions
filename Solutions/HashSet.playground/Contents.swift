/*:
 # Hash Set
 
 A set is a collection of elements that is kind of like an array but with two important differences: the order of the elements in the set is unimportant and each element can appear only once.
 
 */

/*:
 Hash Set
 
 **Time Complexity:
 insert - O(1)
 remove - O(1)
 union -
 intersect -
 difference -
 
 **Space Complexity: O(n)
 */

struct HashSet<T: Hashable> {
  
  var dict: [T : Bool]
  
  public var count: Int {
    return dict.count
  }
  
  public var isEmpty: Bool {
    return dict.isEmpty
  }
  
  init(_ dict: [T : Bool] = [:]) {
    self.dict = dict
  }
  
  public mutating func insert(_ element: T) {
    dict[element] = true
  }
  
  public mutating func remove(_ element: T) {
    dict[element] = nil
  }
  
  public func contains(_ element: T) -> Bool {
    return dict[element] != nil
  }
  
  public func union(_ otherSet: HashSet<T>) -> HashSet<T> {
    
    var combined = HashSet<T>()
    
    if otherSet.count < self.count {
      combined = self
      for element in otherSet.dict.keys {
        combined.insert(element)
      }
    } else {
      combined = otherSet
      for element in self.dict.keys {
        combined.insert(element)
      }
    }
    
    
    return combined
  }
  
  public func interset(_ otherSet: HashSet<T>) -> HashSet<T> {
    var intersection = HashSet<T>()
    
    if otherSet.count < self.count {
      for element in otherSet.dict.keys {
        if self.contains(element) {
            intersection.insert(element)
        }
      }
    } else {
      for element in self.dict.keys {
        if otherSet.contains(element) {
          intersection.insert(element)
        }
      }
    }
    
    return intersection
  }
  
  public func difference(_ otherSet: HashSet<T>) -> HashSet<T> {
    var difference = HashSet<T>()
    for element in self.dict.keys {
      if !otherSet.contains(element) {
        difference.insert(element)
      }
    }
    return difference
  }
    
  public func toSet() -> Set<T> {
    return Set(Array(dict.keys))
  }
  
}

/*:
 Quick Sort
 
 **Time Complexity:** O(nlogn)
 
 **Space Complexity: O(logn)
 */
class Solution_Quick_Sort {
  
  
  
}


/*:
 ## Test
 */
import XCTest

class TestSortIntegers: XCTestCase {
  
  func testSetInsertAndRemove() {
    var set = HashSet<String>()
    set.insert("one")
    set.insert("two")
    set.insert("three")
    
    XCTAssertEqual(set.contains("one"), true)
    XCTAssertEqual(set.contains("two"), true)
    XCTAssertEqual(set.contains("three"), true)
    
    set.remove("two")
    
    XCTAssertEqual(set.contains("one"), true)
    XCTAssertEqual(set.contains("two"), false)
    XCTAssertEqual(set.contains("three"), true)
  }
  
  func testSetUnion() {
    var setA = HashSet<Int>()
    setA.insert(1)
    setA.insert(2)
    setA.insert(3)
    setA.insert(4)
    
    var setB = HashSet<Int>()
    setB.insert(3)
    setB.insert(4)
    setB.insert(5)
    setB.insert(6)
    
    let union = setA.union(setB)
    let expectedResult: Set<Int> = [5, 6, 2, 3, 1, 4]
    XCTAssertEqual(union.toSet(), expectedResult)
  }
  
  func testIntersection() {
    var setA = HashSet<Int>()
    setA.insert(1)
    setA.insert(2)
    setA.insert(3)
    setA.insert(4)
    
    var setB = HashSet<Int>()
    setB.insert(3)
    setB.insert(4)
    setB.insert(5)
    setB.insert(6)
    
    let union = setA.interset(setB)
    let expectedResult: Set<Int> = [3, 4]
    XCTAssertEqual(union.toSet(), expectedResult)
  }
  
  func testDifference() {
    var setA = HashSet<Int>()
    setA.insert(1)
    setA.insert(2)
    setA.insert(3)
    setA.insert(4)
    
    var setB = HashSet<Int>()
    setB.insert(3)
    setB.insert(4)
    setB.insert(5)
    setB.insert(6)
    
    let difference1 = setA.difference(setB)
    let expectedResult1: Set<Int> = [1, 2]
    XCTAssertEqual(difference1.toSet(), expectedResult1)
    
    let difference2 = setB.difference(setA)
    let expectedResult2: Set<Int> = [5, 6]
    XCTAssertEqual(difference2.toSet(), expectedResult2)
    
    
  }
  
}

TestSortIntegers.defaultTestSuite.run()

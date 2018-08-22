/*:
 # 432. All O`one Data Structure
 
 Implement a data structure supporting the following operations:
 
 Inc(Key) - Inserts a new key with value 1. Or increments an existing key by 1. Key is guaranteed to be a non-empty string.
 Dec(Key) - If Key's value is 1, remove it from the data structure. Otherwise decrements an existing key by 1. If the key does not exist, this function does nothing. Key is guaranteed to be a non-empty string.
 GetMaxKey() - Returns one of the keys with maximal value. If no element exists, return an empty string "".
 GetMinKey() - Returns one of the keys with minimal value. If no element exists, return an empty string "".
 Challenge: Perform all these in O(1) time complexity.
 
 */


/*:
 **Time Complexity:**
 
 **Space Complexity:**
 */

class Bucket {
  weak var prev: Bucket?
  var next: Bucket?
  
  var count: Int
  var keys: Set<String>
  
  init(_ count: Int, _ key: String) {
    self.count = count
    self.keys = [key]
  }
  
  init(_ count: Int) {
    self.count = count
    self.keys = []
  }
  
  func insert(_ key: String) {
    keys.insert(key)
  }
  
  func remove(_ key: String) {
    keys.remove(key)
  }
  
}

class AllOne {
  
  // find a node in o(1) -> hash table
  var keyCountDict: [String : Int] = [:]
  var countBucketMap: [Int : Bucket] = [:]
  
  // get min/max -> array or list
  // inc/dec -> doubbly linked list for insert or remove in O(1)
  var head: Bucket = Bucket(Int.max)
  var tail: Bucket = Bucket(Int.min)
  
  init() {
    head.next = tail
    tail.prev = head
  }
  
  func inc(_ key: String) {
    if let currCount = keyCountDict[key]{
      let newCount = currCount + 1
      keyCountDict[key] = newCount
      // remove value from current buckets
      let currBucket = countBucketMap[currCount]!
      let newCountBucket = countBucketMap[newCount]
      
      // 1. curr bucket has more than 1 key
      if currBucket.keys.count > 1 {
        // new count bucket exist
        if newCountBucket != nil {
          currBucket.remove(key)
          newCountBucket!.insert(key)
        } else {
          // new count bucket doesn't exist
          currBucket.remove(key)
          let newBucket = Bucket(newCount, key)
          insert(newBucket, inFrontOf: currBucket)
        }
      } else {
        // new count bucket exist
        if newCountBucket != nil {
          newCountBucket!.insert(key)
          newCountBucket?.next = currBucket.next
          currBucket.prev = newCountBucket
        } else {
          // new count bucket doesn't exist
          currBucket.count = newCount
        }
      }
      
    } else {
      keyCountDict[key] = 1
      if countBucketMap[1] != nil {
        // if 1 already there, insert key to count 1 bucket
        countBucketMap[1]!.insert(key)
      } else {
        let bucket = Bucket(1, key)
        insert(bucket, inFrontOf: tail)
      }
    }
  }
  
  private func insert(_ newBucket: Bucket, inFrontOf bucket: Bucket) {
    let prevBucket = bucket.prev
    bucket.prev = newBucket
    newBucket.next = bucket
    newBucket.prev = prevBucket
    prevBucket?.next = newBucket
    countBucketMap[newBucket.count] = newBucket
  }
  
  func dec(_ key: String) {
    
  }
  
  func getMinKey() -> String? {
    if tail.prev === head {
      return nil
    } else {
      return tail.prev?.keys.first
    }
  }
  
  func getMaxKey() -> String? {
    if head.next === tail {
      return nil
    } else {
      return head.next?.keys.first
    }
  }
  
  func getMinKeys() -> Set<String> {
    if head.next === tail {
      return []
    } else {
      return head.next?.keys ?? []
    }
  }
  
  func getMaxKeys() -> Set<String> {
    if tail.prev === head {
      return []
    } else {
      return tail.prev?.keys ?? []
    }
  }
  
  func printNode() {
    var test: Bucket? = head
    var result = ""
    while test != nil {
      if result == "" {
        result.append("[keys: \(test!.keys), count: \(test!.count)]")
      } else {
        result.append("->[keys: \(test!.keys), count: \(test!.count)]")
      }
      test = test?.next
    }
    print("result: \(result)")
  }
  
}
/*:
 ## Test
 */
import XCTest

class TestAllOne: XCTestCase {
  
  func testAllOne() {
    
    let allOne = AllOne()
    let min = allOne.getMinKey()
    XCTAssertNil(min)
    let max = allOne.getMaxKey()
    XCTAssertNil(max)
    
    // inc A key
    allOne.inc("A")
    XCTAssertEqual(allOne.getMaxKey(), "A")
    XCTAssertEqual(allOne.getMinKey(), "A")
    
    // inc B key
    allOne.inc("B")
    XCTAssertEqual(allOne.getMaxKeys().contains("B"), true)
    XCTAssertEqual(allOne.getMaxKeys().contains("B"), true)
    
    // inc A key
    allOne.inc("A")
    allOne.inc("A")
    allOne.inc("A")
    XCTAssertEqual(allOne.getMaxKey(), "A")
    XCTAssertEqual(allOne.getMinKey(), "B")
    
    // inc C key
    allOne.inc("C")
    
    // inc B key
    allOne.inc("B")
    XCTAssertEqual(allOne.getMaxKey(), "A")
    XCTAssertEqual(allOne.getMinKey(), "C")
    
    
    allOne.printNode()
    
  }
  
}

TestAllOne.defaultTestSuite.run()

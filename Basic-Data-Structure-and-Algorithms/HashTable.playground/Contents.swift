/*:
 # Hash Set
 
 hash table allows you to store and retrieve objects by a "key".
 
 A hash table is used to implement structures, such as a dictionary, a map, and an associative array. These structures can be implemented by a tree or a plain array, but it is efficient to use a hash table.
 
 This should explain why Swift's built-in Dictionary type requires that keys conform to the Hashable protocol: internally it uses a hash table, like the one you will learn about here.
 
 */

/*:
 Hash Table
 */

struct HashTable<Key: Hashable, Value> {
  
  private class BucketNode {
    let key: Key
    var value: Value
    var next: BucketNode?
    
    init(_ key: Key, _ value: Value) {
      self.key = key
      self.value = value
    }
  }
    
  private typealias Element = (key: Key, value: Value)
  private typealias Bucket = [Element]
  private var buckets: [BucketNode?]
  
  init(_ capacity: Int = 10) {
    buckets = Array(repeating: nil, count: capacity)
  }

  public subscript(key: Key) -> Value? {
    get {
      return value(forKey: key)
    }
    set {
      if let value = newValue {
        updateValue(value, forKey: key)
      } else {
        removeValue(forKey: key)
      }
    }
  }
  
  public func value(forKey key: Key) -> Value? {
    let index = self.index(forKey: key)
    var bucketNode = buckets[index]
    while bucketNode != nil {
      if bucketNode!.key == key {
        return bucketNode!.value
      } else {
        bucketNode = bucketNode!.next
      }
    }
    return nil
  }
  
  public mutating func updateValue(_ newValue: Value, forKey key: Key) -> Value? {
    let index = self.index(forKey: key)
    var bucketNode = buckets[index]
    
    // update existing value if any
    while bucketNode != nil {
      if bucketNode!.key == key {
        let oldValue = bucketNode!.value
        bucketNode!.value = newValue
        return oldValue
      } else {
        bucketNode = bucketNode?.next
      }
    }
    
    // append new value
    let existingBucketNode = buckets[index]
    let newNode = BucketNode(key, newValue)
    newNode.next = existingBucketNode
    buckets[index] = newNode
    return nil
  }
  
  public mutating func removeValue(forKey key: Key) -> Value? {
    let index = self.index(forKey: key)
    
    var bucketNode = buckets[index]
    var prevBucketNode: BucketNode?
    
    // update existing value if any
    while bucketNode != nil {
      if bucketNode!.key == key {
        let oldValue = bucketNode!.value
        if prevBucketNode != nil {
          prevBucketNode?.next = bucketNode?.next
        } else {
          buckets[index] = nil
        }
        return oldValue
      } else {
        prevBucketNode = bucketNode
        bucketNode = bucketNode?.next
      }
    }
    return nil
  }
  
  private func index(forKey key: Key) -> Int {
    return abs(key.hashValue) % buckets.count
  }
  
}


/*:
 ## Test
 */
import XCTest

class TestHashTable: XCTestCase {
  
  func testHashTable() {
    
    var hashTable = HashTable<Int, Int>()
    
    hashTable[1] = 1
    hashTable[2] = 2
    XCTAssertEqual(hashTable[1], 1)
    XCTAssertEqual(hashTable[3], nil)
    hashTable[2] = 1
    XCTAssertEqual(hashTable[2], 1)
    hashTable[3] = 3
    XCTAssertEqual(hashTable[3], 3)
    hashTable.removeValue(forKey: 2)
    XCTAssertEqual(hashTable[2], nil)
  }
  
  func testHashTableWithCapcityOne() {
    
    var hashTable = HashTable<Int, Int>(1)
    hashTable[1] = 1
    hashTable[2] = 2
    XCTAssertEqual(hashTable[1], 1)
    XCTAssertEqual(hashTable[3], nil)
    hashTable[2] = 1
    XCTAssertEqual(hashTable[2], 1)
    hashTable[3] = 3
    XCTAssertEqual(hashTable[3], 3)
    hashTable.removeValue(forKey: 2)
    XCTAssertEqual(hashTable[2], nil)
  }
  
}

TestHashTable.defaultTestSuite.run()

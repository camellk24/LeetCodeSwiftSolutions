/*:
 # 146. LRU Cache
 
 Design and implement a data structure for Least Recently Used (LRU) cache. It should support the following operations: get and put.
 
 get(key) - Get the value (will always be positive) of the key if the key exists in the cache, otherwise return -1.
 put(key, value) - Set or insert the value if the key is not already present. When the cache reached its capacity, it should invalidate the least recently used item before inserting a new item.
 
 Follow up:
 Could you do both operations in O(1) time complexity?
 
 Example:
 
 LRUCache cache = new LRUCache( 2 /* capacity */ );
 
 cache.put(1, 1);
 cache.put(2, 2);
 cache.get(1);       // returns 1
 cache.put(3, 3);    // evicts key 2
 cache.get(2);       // returns -1 (not found)
 cache.put(4, 4);    // evicts key 1
 cache.get(1);       // returns -1 (not found)
 cache.get(3);       // returns 3
 cache.get(4);       // returns 4
 
 
 class LRUCache {
 
    init(_ capacity: Int) {
 
    }
 
    func get(_ key: Int) -> Int {
 
    }
 
    func put(_ key: Int, _ value: Int) {
 
    }
 
 }
 
 */




/*:
 **Time Complexity:**
 
 **Space Complexity:**
 */

class Node<Key: Hashable, Value> {
  
  weak var prev: Node?
  var next: Node?
  let key: Key?
  var value: Value?
  
  init(_ key: Key? = nil, _ value: Value? = nil) {
    self.key = key
    self.value = value
  }
  
}

class LRUCache<Key: Hashable, Value> {
 
  // need quick accesss to key - dict
  var dict: [Key : Node<Key, Value>] = [:]
  
  // remove last in O(1) - array, linkedlist, set
  // add/move an entry - linkedlist
  var head: Node<Key, Value> = Node()
  var tail: Node<Key, Value> = Node()
  let capacity: Int
  
  init(_ capacity: Int) {
    self.capacity = capacity
    head.next = tail
    tail.prev = head
  }
  
  func get(_ key: Key) -> Value? {
    if let node = dict[key] {
      takeoutNode(node)
      moveToTail(node)
      return node.value
    } else {
      // no existing node
      return nil
    }
  }
  
  func put(_ key: Key, _ value: Value) {
    if let _ = get(key) {
      // get call will move node to tail if node exists
      dict[key]!.value = value
    } else {
      // remove if exceed capacity
      if dict.count == capacity {
        evict()
      }
      
      // insert new node
      let newNode = Node(key, value)
      dict[key] = newNode
      moveToTail(newNode)
    }
  }
  
  private func takeoutNode(_ node: Node<Key, Value>) {
    let prev = node.prev
    let next = node.next
    prev?.next = next
    next?.prev = prev
    node.next = nil
    node.prev = nil
  }
  
  private func evict() {
    if let headNextKey = head.next?.key {
      dict[headNextKey] = nil
    }
    
    head.next = head.next!.next
    head.next!.prev = head
  }
  
  private func moveToTail(_ node: Node<Key, Value>) {
    let tailPrev = tail.prev
    tailPrev?.next = node
    node.prev = tailPrev
    tail.prev = node
    node.next = tail
  }
    
}

/*:
 ## Test
 */
import XCTest

class TestLRUCache: XCTestCase {
  
  func testLRUCache() {
    let cache = LRUCache<Int, Int>(2)
    cache.put(1, 1)
    cache.put(2, 2)
    XCTAssertEqual(cache.get(1), 1)
    cache.put(3, 3)
    XCTAssertNil(cache.get(2))
    cache.put(4, 4)
    XCTAssertNil(cache.get(1))
    XCTAssertEqual(cache.get(3), 3)
    XCTAssertEqual(cache.get(4), 4)
  }
  
}

TestLRUCache.defaultTestSuite.run()

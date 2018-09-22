/*:
 # 208. Implement Trie (Prefix Tree)
 
 Implement a trie with insert, search, and startsWith methods.
 
 Example:
 
 Trie trie = new Trie();
 
 trie.insert("apple");
 trie.search("apple");   // returns true
 trie.search("app");     // returns false
 trie.startsWith("app"); // returns true
 trie.insert("app");
 trie.search("app");     // returns true
 Note:
 
 You may assume that all inputs are consist of lowercase letters a-z.
 All inputs are guaranteed to be non-empty strings.
 
 
 */


/*:
 
 Time Complexity:
 
 Space Complexity:
 
 */

class Trie {
  
  private class TrieNode {
    var children: [Character : TrieNode] = [:]
    var isWord = false
  }
  
  private var root: TrieNode = TrieNode()
  
  func insert(_ word: String) {
    var curr: TrieNode = root
    
    for char in Array(word) {
      if curr.children[char] == nil {
        curr.children[char] = TrieNode()
      }
      curr = curr.children[char]!
    }
    
    curr.isWord = true
  }
  
  func search(_ word: String) -> Bool {
    var curr: TrieNode = root
    
    for char in Array(word) {
      if curr.children[char] == nil {
        return false
      }
      curr = curr.children[char]!
    }
    
    return curr.isWord
  }
  
  func isWordExistsStartWith(_ prefix: String) -> Bool {
    var curr: TrieNode = root
    for char in Array(prefix) {
      if curr.children[char] == nil {
        return false
      }
      curr = curr.children[char]!
    }
    
    return true
  }
  
}

  
/*:
 ## Test
 */
import XCTest

class TestTrie: XCTestCase {
  
  func testTrie() {
    /*
     Trie trie = new Trie();
     
     trie.insert("apple");
     trie.search("apple");   // returns true
     trie.search("app");     // returns false
     trie.startsWith("app"); // returns true
     trie.insert("app");
     trie.search("app");     // returns true
     */
    
    let trie = Trie()
    trie.insert("apple")
    XCTAssertEqual(trie.search("apple"), true)
    XCTAssertEqual(trie.search("app"), false)
    XCTAssertEqual(trie.isWordExistsStartWith("app"), true)
    trie.insert("app")
    XCTAssertEqual(trie.search("app"), true)
  }
  
}

TestTrie.defaultTestSuite.run()

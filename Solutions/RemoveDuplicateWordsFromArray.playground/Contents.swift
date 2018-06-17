/*:
 # Remove Duplicate Words from Array
 
 Reference:
 https://www.glassdoor.com/Interview/given-an-array-of-words-how-to-eliminate-the-duplicates-You-have-a-simple-tree-structure-and-its-clone-Each-no-QTN_1341992.htm
 
 func removeDuplicates(_ words: [String]) -> [String] {
 
 }
 
 */


/*:
 **Time Complexity:**
 
 **Space Complexity:**
 */

class Solution {
  
  func removeDuplicates(_ words: inout [String]) {
    words.sort()
    var i = 0
    // ["test", "test1", "something", "something"]
    for j in 1 ..< words.count {
      if words[i] != words[j] {
        i += 1
        words[i] = words[j]
      }
    }
    
    words.removeSubrange(i+1 ..< words.count)
  }
  
}

/*:
 ## Test
 */
import XCTest

class TestRemoveDuplicateWords: XCTestCase {
  
  func testRemoveDuplicateWords() {
    var words = ["egg", "chicken", "egg", "tesla", "apple", "google", "google"]
    Solution().removeDuplicates(&words)
    XCTAssertEqual(words, ["apple", "chicken", "egg", "google", "tesla"])
  }
  
}

TestRemoveDuplicateWords.defaultTestSuite.run()

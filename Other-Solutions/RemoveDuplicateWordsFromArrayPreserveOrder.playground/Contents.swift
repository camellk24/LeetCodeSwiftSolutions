/*:
 # Remove Duplicate Words from Array Preserve Order
 
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
  
  func removingDuplicates(_ words: [String]) -> [String] {
    var result = [String]()
    var set = Set<String>()
  
    for i in 0 ..< words.count {
      let word = words[i]
      if set.contains(word) {
        continue
      } else {
        result.append(word)
        set.insert(word)
      }
    }
    return result
  }
  
}

/*:
 ## Test
 */
import XCTest

class TestRemoveDuplicateWords: XCTestCase {
  
  func testRemoveDuplicateWords() {
    let words = ["egg", "chicken", "egg", "tesla", "apple", "google", "google"]
    let result = Solution().removingDuplicates(words)
    XCTAssertEqual(result, ["egg", "chicken", "tesla", "apple", "google"])
  }
  
}

TestRemoveDuplicateWords.defaultTestSuite.run()

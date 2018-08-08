
/*:
 # 243. Shortest Word Distance
 
 Given a list of words and two words word1 and word2, return the shortest distance between these two words in the list.
 
 Example:
 Assume that words = ["practice", "makes", "perfect", "coding", "makes"].
 
 Input: word1 = “coding”, word2 = “practice”
 Output: 3
 Input: word1 = "makes", word2 = "coding"
 Output: 1
 Note:
 You may assume that word1 does not equal to word2, and word1 and word2 are both in the list.
 
 
 **Implement below function**
 
 func shortestDistance(_ words: [String], _ word1: String, _ word2: String) -> Int {
 
 }
 
 */

/*:
 **Time Complexity:** O(n)
 
 **Space Complexity:** O(1)
 */

class Solution {
  func shortestDistance(_ words: [String], _ word1: String, _ word2: String) -> Int {
    
    var pos1: Int?
    var pos2: Int?
    var result = Int.max
    
    for i in 0 ..< words.count {
      let word = words[i]
      
      if word == word1 {
        if let pos2 = pos2 {
          let dist = abs(pos2 - i)
          result = min(result, dist)
        }
        pos1 = i
      }
      
      if word == word2 {
        if let pos1 = pos1 {
          let dist = abs(pos1 - i)
          result = min(result, dist)
        }
        pos2 = i
      }
    }
    
    return result
    
  }
}


/*:
 ## Test
 */
import XCTest

class TestShortestWordDistance: XCTestCase {
  
  func testShortestWordDistance1() {
    let words = ["practice", "makes", "perfect", "coding", "makes"]
    let word1 = "coding"
    let word2 = "practice"
    
    let result = Solution().shortestDistance(words, word1, word2)
    XCTAssertEqual(result, 3)
  }
  
  func testShortestWordDistance2() {
    let words = ["practice", "makes", "perfect", "coding", "makes"]
    let word1 = "makes"
    let word2 = "coding"
    
    let result = Solution().shortestDistance(words, word1, word2)
    XCTAssertEqual(result, 1)
  }
  
  func testShortestWordDistance3() {
    let words = ["a","c","b","b","a"]
    let word1 = "a"
    let word2 = "b"
    
    let result = Solution().shortestDistance(words, word1, word2)
    XCTAssertEqual(result, 1)
  }
  
}

TestShortestWordDistance.defaultTestSuite.run()





/*:
 # 244. Shortest Word Distance II
 
 Design a class which receives a list of words in the constructor, and implements a method that takes two words word1 and word2 and return the shortest distance between these two words in the list. Your method will be called repeatedly many times with different parameters.
 
 Example:
 Assume that words = ["practice", "makes", "perfect", "coding", "makes"].
 
 Input: word1 = “coding”, word2 = “practice”
 Output: 3
 Input: word1 = "makes", word2 = "coding"
 Output: 1
 Note:
 You may assume that word1 does not equal to word2, and word1 and word2 are both in the list.
 
 */

/*:
 Hash Set
 
 **Time Complexity:
 
 
 **Space Complexity: O(n)
 */

class ShortestWordDistance {
  
  
  let words: [String]
  var dict: [String : [Int]] = [:] // key: word, value: list of indexes
  
  init(_ words: [String]) {
    self.words = words
    buildDict(words)
  }
  
  func shortest(_ word1: String, _ word2: String) -> Int {
    var result = Int.max
    let word1Indexes = dict[word1] ?? []
    let word2Indexes = dict[word2] ?? []
    
    var i = 0
    var j = 0
    
    while i < word1Indexes.count && j < word2Indexes.count {
      let pos1 = word1Indexes[i]
      let pos2 = word2Indexes[j]
      
      if pos1 < pos2 {
        result = min(result, pos2 - pos1)
        i += 1
      } else {
        result = min(result, pos1 - pos2)
        j += 1
      }
    }
    return result
  }
  
  private func buildDict(_ words: [String]) {
    for i in 0 ..< words.count {
      let word = words[i]
      if dict[word] != nil {
        dict[word]!.append(i)
      } else {
        dict[word] = [i]
      }
    }
  }
  
}

/*:
 ## Test
 */
import XCTest

class TestShortestWordDistance: XCTestCase {
  
  func testShortestWordDistance() {
    let shortestWordDistance = ShortestWordDistance(["practice", "makes", "perfect", "coding", "makes"])
    XCTAssertEqual(shortestWordDistance.shortest("practice", "makes"), 1)
    XCTAssertEqual(shortestWordDistance.shortest("practice", "perfect"), 2)
    XCTAssertEqual(shortestWordDistance.shortest("makes", "coding"), 1)
    XCTAssertEqual(shortestWordDistance.shortest("coding", "makes"), 1)
  }
  
}

TestShortestWordDistance.defaultTestSuite.run()

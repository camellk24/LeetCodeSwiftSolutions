
/*:
 # Find Duplicate Characters in a String
 
 let s = "aaba",
 result
 "a" -> 3
 
 let s = "aabacdc",
 result
 "a" -> 3
 "c" -> 2
 
 */

/*:
 **Time Complexity:** O(nlogn)
 
 **Space Complexity:** O(n)
 */

class Solution {

  func findDuplicateCharacters(in s: String) -> [Character : Int] {
    
    let chars = Array(s)
    var dict: [Character : Int] = [:]
    
    for i in 0 ..< chars.count {
      let char = chars[i]
      if dict[char] != nil {
        dict[char] = dict[char]! + 1
      } else {
        dict[char] = 1
      }
    }
    
    return dict
  }
  
}





/*:
 ## Test
 */
import XCTest

class TestFindDuplicateCharactersInAString: XCTestCase {
  
  func testFindDuplicateCharactersInAString1() {
    let input = "geeksforgeeks"
    let result = Solution().findDuplicateCharacters(in: input)
    XCTAssertEqual(result["e"], 4)
    XCTAssertEqual(result["g"], 2)
    XCTAssertEqual(result["k"], 2)
  }
  
}

TestFindDuplicateCharactersInAString.defaultTestSuite.run()





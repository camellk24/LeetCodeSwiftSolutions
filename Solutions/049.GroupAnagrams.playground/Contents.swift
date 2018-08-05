
/*:
 # 49. Group Anagrams
 
 Given an array of strings, group anagrams together.
 
 Example:
 
 Input: ["eat", "tea", "tan", "ate", "nat", "bat"],
 Output:
 [
 ["ate","eat","tea"],
 ["nat","tan"],
 ["bat"]
 ]
 Note:
 
 All inputs will be in lowercase.
 The order of your output does not matter.
 */

/*:
 **Time Complexity:** O(n)
 
 **Space Complexity:** O(n)
 */

class Solution {
  func groupAnagrams(_ strs: [String]) -> [[String]] {
    
    var aDict: [String : [String]] = [:]
    
    for i in 0 ..< strs.count {
      
      let str = strs[i]
      
      let sortedStr = String(Array(str).sorted(by: <))
      
      if aDict[sortedStr] == nil {
        aDict[sortedStr] = [str]
      } else {
        aDict[sortedStr]!.append(str)
      }
    }
    
    return Array(aDict.values)
  }
}





/*:
 ## Test
 */
import XCTest

class TestGroupAnagrams: XCTestCase {
  
  func testGroupAnagrams() {
    let input = ["eat", "tea", "tan", "ate", "nat", "bat"]
    let output = [
      ["ate","eat","tea"],
      ["nat","tan"],
      ["bat"]
    ]
    
    let result = Solution().groupAnagrams(input)
    
    
    
    XCTAssertEqual(result.count, output.count)
    
    var outputSet: Set<Set<String>> = []
    for i in 0 ..< output.count {
      let set = Set(output[i])
      outputSet.insert(set)
    }
    
    var resultSet: Set<Set<String>> = []
    for i in 0 ..< result.count {
      let set = Set(result[i])
      resultSet.insert(set)
    }
    
    XCTAssertEqual(outputSet, resultSet)
  }
  
  
}

TestGroupAnagrams.defaultTestSuite.run()





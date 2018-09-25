
/*:
 # 269. Alien Dictionary
 
 "ett",
 "rftt"
 ]
 
 Output: "wertf"
 Example 2:
 
 Input:
 [
 "z",
 "x"
 ]
 
 Output: "zx"
 Example 3:
 
 Input:
 [
 "z",
 "x",
 "z"
 ]
 
 Output: ""
 
 Explanation: The order is invalid, so return "".
 Note:
 
 You may assume all letters are in lowercase.
 You may assume that if a is a prefix of b, then a must appear before b in the given dictionary.
 If the order is invalid, return an empty string.
 There may be multiple valid order of letters, return any one of them is fine.
 
 */

/*:
 **Time Complexity:**
 
 **Space Complexity:**
 */

class Solution {
  func alienOrder(_ words: [String]) -> String {
    let graph = getGraph(words)
    return topologicalSort(graph)
  }
  
  private func getGraph(_ words: [String]) -> [Character : Set<Character>] {
    
    var graph: [Character : Set<Character>] = [:]
    
    // create nodes
    for word in words {
      for char in Array(word) {
        if graph[char] == nil {
          graph[char] = []
        }
      }
    }
    
    // create edges
    for i in 0 ..< words.count - 1 {
      var index = 0
      // handle
      while (index < words[i].count && index < words[i+1].count) {
        let chars1 = Array(words[i])
        let chars2 = Array(words[i+1])
        if chars1[index] != chars2[index] {
          graph[chars1[index]]!.insert(chars2[index])
          break
        }
        index += 1
      }
    }
    
    return graph
  }
  
  private func getIndegree(_ graph: [Character : Set<Character>]) -> [Character : Int] {
    
    var indegree: [Character : Int] = [:]
    for (c, _) in graph {
      indegree[c] = 0
    }
    
    for (_, neighbors) in graph {
      for neighbor in neighbors {
        indegree[neighbor]! += 1
      }
    }
    return indegree
    
  }
  
  private func topologicalSort(_ graph: [Character : Set<Character>]) -> String {
    // get indegree
    var indegrees = getIndegree(graph)
    
    var queue: [Character] = []
    
    // find 0 indegree node
    for (c, indegree) in indegrees {
      if indegree == 0 {
        queue.append(c)
      }
    }
    
    var res = ""
    
    while !queue.isEmpty {
      
      let c = queue.removeFirst()
      res = "\(res)\(c)"
      
      for neighbor in graph[c]! {
        indegrees[neighbor]! -= 1
        if indegrees[neighbor] == 0 {
          queue.append(neighbor)
        }
      }
      
    }
    
    if res.count != graph.count {
      return ""
    }
    
    return res
  }
}

/*:
 ## Test
 */
import XCTest

class TestAlienDictionary: XCTestCase {
  
  func testAlienDictionary1() {
    let input = [
      "wrt",
      "wrf",
      "er",
      "ett",
      "rftt"
    ]
    
    XCTAssertEqual(Solution().alienOrder(input), "wertf")
  }
  
  func testAlienDictionary2() {
    let input = [
      "z",
      "x"
    ]
    
    XCTAssertEqual(Solution().alienOrder(input), "zx")
  }
  
  func testAlienDictionary3() {
    let input = [
      "z",
      "x",
      "z"
    ]
    
    XCTAssertEqual(Solution().alienOrder(input), "")
  }
  
}

TestAlienDictionary.defaultTestSuite.run()





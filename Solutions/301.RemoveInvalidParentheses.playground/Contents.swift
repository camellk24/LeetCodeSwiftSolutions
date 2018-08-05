
/*:
 # 301. Remove Invalid Parentheses
 
 Remove the minimum number of invalid parentheses in order to make the input string valid. Return all possible results.
 
 Note: The input string may contain letters other than the parentheses ( and ).
 
 Example 1:
 
 Input: "()())()"
 Output: ["()()()", "(())()"]
 Example 2:
 
 Input: "(a)())()"
 Output: ["(a)()()", "(a())()"]
 Example 3:
 
 Input: ")("
 Output: [""]
 
 **Implement below function**
 
 func removeInvalidParentheses(_ s: String) -> [String] {
 
 }
 
 */

/*:
 
 BFS
 
 reference: https://github.com/tongzhang1994/Facebook-Interview-Coding/blob/master/301.%20Remove%20Invalid%20Parentheses.java#L66
 
 **Time Complexity:**
 
 
 
 BFS -> guarantee the number of parentheses that need to be removed is minimal
 // With the input string s, we generate all possible states by removing one ( or ), check if they are valid,
 // if found valid ones on the current level, put them to res and we are done, otherwise add them to a queue and carry on to the next level
 Time: T(n) = n x C(n, n) + (n-1) x C(n, n-1) + ... + 1 x C(n, 1) = n x 2^(n-1).
 // In BFS we handle the states level by level, in the worst case, we need to handle all the levels,
 // we can analyze the time complexity level by level and add them up to get the final complexity.
 // On the first level, there's only one string which is the input string s, let's say the length of it is n, to check whether it's valid,
 // we need O(n) time. On the second level, we remove one ( or ) from the first level, so there are C(n, n-1) new strings,
 // each of them has n-1 characters, and for each string, we need to check whether it's valid or not, thus the total time complexity
 // on this level is (n-1) x C(n, n-1). Come to the third level, total time complexity is (n-2) x C(n, n-2), so on and so forth...
 Run: e.x. "(a)())()"
 // q = ["(a)())()"]
 //      ["a)())()", "(a())()", "(a))()", "(a)()()", "(a)()))", "(a)())("]
 // visited = ["(a)())()", "a)())()", "(a())()", "(a))()", "(a)()()", "(a)()))", "(a)())("]
 // res = ["(a())()", "(a)()()"]
 
 **Space Complexity:** O(n)
 */

class Solution {
  func removeInvalidParentheses(_ s: String) -> [String] {
    
    guard s.count > 0 else {
      return [""]
    }
    var result: [String] = []
    var visited: Set<String> = []
    var queue: [String] = [s]
    var foundValid: Bool = false
    while !queue.isEmpty {
      let str = queue.removeFirst()
      if isValidParentheses(str) {
        result.append(str)
        foundValid = true
      }
      // if one solution found, continue
      if foundValid {
        continue
      }
      
      let chars = Array(str)
      for i in 0 ..< chars.count {
        if chars[i] != "(" && chars[i] != ")" {
          continue
        }
        let newStr = removingChar(at: i, for: str)
        if !visited.contains(newStr) {
          queue.append(newStr)
          visited.insert(newStr)
        }
      }
    }
    return result
  }
  
  private func removingChar(at index: Int, for s: String) -> String {
    var newStr = s
    if let index = s.index(s.startIndex, offsetBy: index, limitedBy: s.endIndex) {
      newStr.remove(at: index)
    }
    return newStr
  }
  
  private func isValidParentheses(_ s: String) -> Bool {
    var count = 0
    let chars = Array(s)
    for char in chars {
      if char == "(" {
        count += 1
      } else if char == ")" {
        count -= 1
        if count < 0 {
          return false
        }
      }
    }
    return count == 0
  }
  
}





/*:
 ## Test
 */
import XCTest

class TestRemoveInvalidParentheses: XCTestCase {
  
  func testRemoveInvalidParentheses1() {
    let input = "()())()"
    let output: Set<String> = ["()()()", "(())()"]
    let solution = Solution()
    let result = solution.removeInvalidParentheses(input)
    XCTAssertEqual(Set(result), output)
  }

  func testRemoveInvalidParentheses2() {
    let input = "(a)())()"
    let output: Set<String> = ["(a)()()", "(a())()"]
    let solution = Solution()
    let result = solution.removeInvalidParentheses(input)
    XCTAssertEqual(Set(result), output)
  }

  func testRemoveInvalidParentheses3() {
    let input = ")("
    let output: Set<String> = [""]
    let solution = Solution()
    let result = solution.removeInvalidParentheses(input)
    XCTAssertEqual(Set(result), output)
  }

  func testRemoveInvalidParentheses4() {
    let input = ""
    let output: Set<String> = [""]
    let solution = Solution()
    let result = solution.removeInvalidParentheses(input)
    XCTAssertEqual(Set(result), output)
  }
  
  func testRemoveInvalidParentheses5() {
    let input = ")d))"
    let output: Set<String> = ["d"]
    let solution = Solution()
    let result = solution.removeInvalidParentheses(input)
    XCTAssertEqual(Set(result), output)
  }
  
}

TestRemoveInvalidParentheses.defaultTestSuite.run()





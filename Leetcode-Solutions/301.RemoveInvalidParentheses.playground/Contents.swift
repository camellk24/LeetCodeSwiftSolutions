
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
    
    var visited: Set<String> = [s]
    var q = [s]
    var found = false
    var res: [String] = []
    
    while !q.isEmpty {
      
      let str = q.removeFirst()
      let chars = Array(str)
      
      if isValid(chars) {
        res.append(str)
        found = true
      }
      
      if found {
        continue
      }
      
      for i in 0 ..< chars.count {
        let char = chars[i]
        if char != "(" && char != ")" {
          continue
        }
        
        if let sub = removingChar(at: i, for: str) {
          if !visited.contains(sub) {
            q.append(sub)
            visited.insert(sub)
          }
        }
      }
    }
    
    return res
  }
  
  private func isValid(_ chars: [Character]) -> Bool {
    var cnt = 0
    for c in chars {
      if c == "(" {
        cnt += 1
      } else if c == ")" {
        cnt -= 1
        if cnt < 0 {
          return false
        }
      }
    }
    
    return cnt == 0
  }
  
  private func removingChar(at i: Int, for s: String) -> String? {
    if let index = s.index(s.startIndex, offsetBy: i, limitedBy: s.endIndex) {
      var newStr = s
      newStr.remove(at: index)
      return newStr
    } else {
      return nil
    }
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





/*:
 # 227. Basic Calculator II
 
 Implement a basic calculator to evaluate a simple expression string.
 
 The expression string contains only non-negative integers, +, -, *, / operators and empty spaces . The integer division should truncate toward zero.
 
 Example 1:
 
 Input: "3+2*2"
 Output: 7
 Example 2:
 
 Input: " 3/2 "
 Output: 1
 Example 3:
 
 Input: " 3+5 / 2 "
 Output: 5
 
 
 
 func calculate(_ s: String) -> Int {
 
 }
 
 */

/*:
 
 Stack
 
 reference: http://www.cnblogs.com/grandyang/p/4601208.html
 
 **Time Complexity:** O(n)
 
 **Space Complexity:** O(n)
 
 */


class Solution {
  func calculate(_ s: String) -> Int {
    
    let n = s.count
    
    guard n > 0 else {
      return 0
    }
    
    let chars = Array(s)
    var stack: [Int] = []
    var result = 0
    var op: Character = "+"
    var currNum = 0
    
    for i in 0 ..< n {
      
      let char = chars[i]
      
      if let digit = getDigit(char) {
        currNum = currNum * 10 + digit
      }
      
      if isOp(char) || i == n - 1 {
        switch op {
        case "+":
          stack.append(currNum)
        case "-":
          stack.append(-currNum)
        case "*":
          let lastNum = stack.removeLast()
          stack.append(lastNum * currNum)
        case "/":
          let lastNum = stack.removeLast()
          stack.append(lastNum / currNum)
        default:
          break
        }
        // reset
        op = char
        currNum = 0
      }
    }
    
    while !stack.isEmpty {
      result += stack.removeLast()
    }
    
    return result
  }
  
  private func isOp(_ char: Character) -> Bool {
    return char == "+" || char == "-" || char == "*" || char == "/"
  }
  
  private func getDigit(_ char: Character) -> Int? {
    switch char {
    case "1":
      return 1
    case "2":
      return 2
    case "3":
      return 3
    case "4":
      return 4
    case "5":
      return 5
    case "6":
      return 6
    case "7":
      return 7
    case "8":
      return 8
    case "9":
      return 9
    case "0":
      return 0
    default:
      return nil
    }
  }
  
}


/*:
 ## Test
 */
import XCTest

class TestBasicCalculatorII: XCTestCase {
  
  func testBasicCalculator1() {
    let solution = Solution()
    let result = solution.calculate("3+2*2")
    XCTAssertEqual(result, 7)
  }
  
  func testBasicCalculator2() {
    let solution = Solution()
    let result = solution.calculate(" 3/2 ")
    XCTAssertEqual(result, 1)
  }
  
  func testBasicCalculator3() {
    let solution = Solution()
    let result = solution.calculate(" 3+5 / 2")
    XCTAssertEqual(result, 5)
  }

  func testBasicCalculator4() {
    let solution = Solution()
    let result = solution.calculate("42")
    XCTAssertEqual(result, 42)
  }
}

TestBasicCalculatorII.defaultTestSuite.run()

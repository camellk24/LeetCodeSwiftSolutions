/*:
 # 224. Basic Calculator
 
 
 Implement a basic calculator to evaluate a simple expression string.
 
 The expression string may contain open ( and closing parentheses ), the plus + or minus sign -, non-negative integers and empty spaces .
 
 Example 1:
 
 Input: "1 + 1"
 Output: 2
 Example 2:
 
 Input: " 2-1 + 2 "
 Output: 3
 Example 3:
 
 Input: "(1+(4+5+2)-3)+(6+8)"
 Output: 23
 
 
 
 func calculate(_ s: String) -> Int {
 
 }
 
 */

/*:
 
 Stack
 
 **Time Complexity:** O(n)
 
 **Space Complexity:** O(n)
 
 */


class Solution {
  func calculate(_ s: String) -> Int {
    
    let chars = Array(s)
    let n = s.count
    
    var stack: [Int] = []
    var sign = 1
    var result = 0
    
    var i = 0
    while i < n {
      
      let char = chars[i]
      
      if let digit = getDigit(char) {
        
        // find digit, search for all
        var num = digit
        i += 1
        while i < n, let digit = getDigit(chars[i]) {
          num = num * 10 + digit
          i += 1
        }
        
        result += (sign * num)
        continue
      } else if char == "+" {
        sign = 1
      } else if char == "-" {
        sign = -1
      } else if char == "(" {
        stack.append(result)
        stack.append(sign)
        result = 0
        sign = 1
      } else if char == ")" {
        let sign = stack.removeLast()
        
        result *= sign
        let num = stack.removeLast()
        result += num
      }
      
      i += 1
    }
    
    return result
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

class TestBasicCalculator: XCTestCase {
  
  func testBasicCalculator1() {
    let solution = Solution()
    let result = solution.calculate("1 + 1")
    XCTAssertEqual(result, 2)
  }

  func testBasicCalculator2() {
    let solution = Solution()
    let result = solution.calculate("2-1 + 2")
    XCTAssertEqual(result, 3)
  }

  func testBasicCalculator3() {
    let solution = Solution()
    let result = solution.calculate("(1+(4+5+2)-3)+(6+8)")
    XCTAssertEqual(result, 23)
  }

  func testBasicCalculator4() {
    let solution = Solution()
    let result = solution.calculate("  30")
    XCTAssertEqual(result, 30)
  }
  
  func testBasicCalculator5() {
    let solution = Solution()
    let result = solution.calculate("1-(5)")
    XCTAssertEqual(result, -4)
  }

}

TestBasicCalculator.defaultTestSuite.run()

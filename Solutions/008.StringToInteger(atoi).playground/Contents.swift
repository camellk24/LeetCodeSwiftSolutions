/*:
 # 8. String to Integer (atoi)
 
 Implement atoi which converts a string to an integer.
 
 The function first discards as many whitespace characters as necessary until the first non-whitespace character is found. Then, starting from this character, takes an optional initial plus or minus sign followed by as many numerical digits as possible, and interprets them as a numerical value.
 
 The string can contain additional characters after those that form the integral number, which are ignored and have no effect on the behavior of this function.
 
 If the first sequence of non-whitespace characters in str is not a valid integral number, or if no such sequence exists because either str is empty or it contains only whitespace characters, no conversion is performed.
 
 If no valid conversion could be performed, a zero value is returned.
 
 Note:
 
 Only the space character ' ' is considered as whitespace character.
 Assume we are dealing with an environment which could only store integers within the 32-bit signed integer range: [−231,  231 − 1]. If the numerical value is out of the range of representable values, INT_MAX (231 − 1) or INT_MIN (−231) is returned.
 Example 1:
 
 Input: "42"
 Output: 42
 Example 2:
 
 Input: "   -42"
 Output: -42
 Explanation: The first non-whitespace character is '-', which is the minus sign.
 Then take as many numerical digits as possible, which gets 42.
 Example 3:
 
 Input: "4193 with words"
 Output: 4193
 Explanation: Conversion stops at digit '3' as the next character is not a numerical digit.
 Example 4:
 
 Input: "words and 987"
 Output: 0
 Explanation: The first non-whitespace character is 'w', which is not a numerical
 digit or a +/- sign. Therefore no valid conversion could be performed.
 Example 5:
 
 Input: "-91283472332"
 Output: -2147483648
 Explanation: The number "-91283472332" is out of the range of a 32-bit signed integer.
 Thefore INT_MIN (−231) is returned.
 
 func myAtoi(_ str: String) -> Int {
 
 }
 
 */

/*:
 **Time Complexity:** O(n)
 
 **Space Complexity:** O(1)
 */

class Solution {
  
  
  func myAtoi(_ str: String) -> Int {
    
    let int_max = 2147483647
    let int_min = -2147483648
    let chars = Array(str)
    
    var sign = 1
    var sum = 0
    var foundNumber = false
    var startIndex = 0
    
    // trim white space
    while startIndex < chars.count {
      if chars[startIndex] == " " {
        startIndex += 1
      } else {
        break
      }
      
    }
    
    if startIndex >= chars.count {
      return 0
    }
    
    for i in startIndex ..< chars.count {
      let char = chars[i]
      
      // check sign
      if i == startIndex && (char == "-" || char == "+") {
        if char == "-" {
          sign = -1
        }
        continue
      }
      
      // check numbers
      if let integer = getInt(from: char) {
        sum = (sum * 10 + integer)
        foundNumber = true
        if sum > int_max {
          break
        }
      } else {
        if foundNumber {
          break
        } else {
          // handle case "+-2"
          return 0
        }
      }
    }
    
    // check max overflow
    if sign * sum > int_max {
      return int_max
    }
    
    // check min overflow
    if sign * sum < int_min {
      return int_min
    }
    
    return sum * sign
  }
  
  private func getInt(from char: Character) -> Int? {
    switch char {
    case "0":
      return 0
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
    default:
      return nil
    }
  }
}

/*:
 ## Test
 */
import XCTest

class TestStringToInteger: XCTestCase {
  
  func testStringToInteger() {
    let str = "42"
    let solution = Solution()
    XCTAssertEqual(solution.myAtoi(str), 42)
  }
  
  func testSignedWithWhiteSpace() {
    let str = "   -42"
    let solution = Solution()
    XCTAssertEqual(solution.myAtoi(str), -42)
  }
  
  func testNumberWithString() {
    let str = "4193 with words"
    let solution = Solution()
    XCTAssertEqual(solution.myAtoi(str), 4193)
  }
  
  func testStringWithNumber() {
    let str = "words and 987"
    let solution = Solution()
    XCTAssertEqual(solution.myAtoi(str), 0)
  }
  
  func testOverflow() {
    let str = "-91283472332"
    let solution = Solution()
    XCTAssertEqual(solution.myAtoi(str), -2147483648)
  }
  
}

TestStringToInteger.defaultTestSuite.run()


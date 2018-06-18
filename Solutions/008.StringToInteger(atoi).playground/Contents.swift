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
          return 0
        }
      }
    }
    
    
    if sign * sum > int_max {
      return int_max
    }
    
    if sign * sum < int_min {
      return int_min
    }
    
    return sum * sign
  }
  
  private func getInt(from char: Character) -> Int? {
    let dict: [Character : Int] = ["1" : 1,
                                   "2" : 2,
                                   "3" : 3,
                                   "4" : 4,
                                   "5" : 5,
                                   "6" : 6,
                                   "7" : 7,
                                   "8" : 8,
                                   "9" : 9,
                                   "0" : 0]
    
    return dict[char]
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


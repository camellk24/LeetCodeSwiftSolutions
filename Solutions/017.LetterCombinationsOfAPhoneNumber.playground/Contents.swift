/*:
 # 17. Letter Combinations of a Phone Number
 
 Given a string containing digits from 2-9 inclusive, return all possible letter combinations that the number could represent.
 
 A mapping of digit to letters (just like on the telephone buttons) is given below. Note that 1 does not map to any letters.
 
 1 ->
 2 -> abc
 3 -> def
 4 -> ghi
 5 -> jkl
 6 -> mno
 7 -> pqrs
 8 -> tuv
 9 -> wxyz
 0 ->
 * ->
 # ->
 
 Example:
 
 Input: "23"
 Output: ["ad", "ae", "af", "bd", "be", "bf", "cd", "ce", "cf"].
 Note:
 
 Although the above answer is in lexicographical order, your answer could be in any order you want.
 
 
 func letterCombinations(_ digits: String) -> [String] {
 
 }
 
 */


/*:
 
 Backtracking, dfs
 
 **Time Complexity:** Assuming the average number of letters on every number is m, and the length of digits string is n, then the complexity is O(mn).
 
 **Space Complexity:**
 */

class Solution {
  
  func letterCombinations(_ digits: String) -> [String] {
    
    guard digits.count > 0 else {
      return []
    }
    
    let chars = Array(digits)
    var result: [String] = []
    
    dfs(chars, 0, "", &result)
    return result
  }
  
  private func dfs(_ digits: [Character], _ startIndex: Int, _ combination: String, _ result: inout [String]) {
    
    if startIndex == digits.count {
      result.append(combination)
      return
    }
    
    let digit = digits[startIndex]
    for char in getAlphabets(fromDigit: digit) {
      let newComb = "\(combination)\(char)"
      dfs(digits, startIndex + 1, newComb, &result)
    }
  }
  
  private func getAlphabets(fromDigit digit: Character) -> [Character] {
    
    switch digit {
    case "2":
      return ["a", "b", "c"]
    case "3":
      return ["d", "e", "f"]
    case "4":
      return ["g", "h", "i"]
    case "5":
      return ["j", "k", "l"]
    case "6":
      return ["m", "n", "o"]
    case "7":
      return ["p", "q", "r", "s"]
    case "8":
      return ["t", "u", "v"]
    case "9":
      return ["w", "x", "y", "z"]
    default:
      return []
    }
    
  }
  
}

/*:
 ## Test
 */
import XCTest

class TestLetterCombinationOfAPhoneNumber: XCTestCase {

  
  func testLetterCombinationOfAPhoneNumber() {
    let solution = Solution()
    let result = solution.letterCombinations("23")
    XCTAssertEqual(result, ["ad", "ae", "af", "bd", "be", "bf", "cd", "ce", "cf"])
  }
  
  
}

TestLetterCombinationOfAPhoneNumber.defaultTestSuite.run()

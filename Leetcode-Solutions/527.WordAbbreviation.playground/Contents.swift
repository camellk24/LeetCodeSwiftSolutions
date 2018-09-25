/*:
 # 527. Word Abbreviation
 
 Given an array of n distinct non-empty strings, you need to generate minimal possible abbreviations for every word following rules below.
 
 Begin with the first character and then the number of characters abbreviated, which followed by the last character.
 If there are any conflict, that is more than one words share the same abbreviation, a longer prefix is used instead of only the first character until making the map from word to abbreviation become unique. In other words, a final abbreviation cannot map to more than one original words.
 If the abbreviation doesn't make the word shorter, then keep it as original.
 Example:
 Input: ["like", "god", "internal", "me", "internet", "interval", "intension", "face", "intrusion"]
 Output: ["l2e","god","internal","me","i6t","interval","inte4n","f2e","intr4n"]
 Note:
 Both n and the length of each word will not exceed 400.
 The length of each word is greater than 1.
 The words consist of lowercase English letters only.
 The return answers should be in the same order as the original array.
 

 func wordsAbbreviation(_ dict: [String]) -> [String] {
 
 }
 
 
 */


/*:
 
 Time Complexity: O(nL)
 
 Space Complexity: O(n)
 
 */

class Solution {
  func wordsAbbreviation(_ dict: [String]) -> [String] {
    
    guard dict.count > 0 else {
      return []
    }
    
    /*
     Input: ["like", "god", "internal", "me", "internet", "interval", "intension", "face", "intrusion"]
     Output: ["l2e","god","internal","me","i6t","interval","inte4n","f2e","intr4n"]
     */
    
    let n = dict.count
    
    var result: [String] = Array(repeating: "", count: n)
    var prefixes: [Int] = Array(repeating: 1, count: n)
    var resultCount: [String : Int] = [:]
    
    // init result and result count
    for i in 0 ..< n {
      let abbr = getAbbr(dict[i], 1)
      result[i] = abbr
      incrementResultCount(&resultCount, abbr)
    }
    
    while true {
      var isUnique = true
      for i in 0 ..< n {
        // NOTE: need to get the original string, instead of abbreviated string
        
        if let currCount = resultCount[result[i]], currCount > 1 {
          let newPrefix = prefixes[i] + 1
          prefixes[i] = newPrefix
          let abbr = getAbbr(dict[i], newPrefix)
          result[i] = abbr // we update result, so we don't need to update count in dict for old result
          incrementResultCount(&resultCount, abbr)
          isUnique = false
        }
      }
      
      if isUnique {
        break
      }
    }
    
    return result
  }
  
  private func incrementResultCount(_ resultCount: inout [String : Int], _ abbr: String) {
    if let currCount = resultCount[abbr] {
      resultCount[abbr] = currCount + 1
    } else {
      resultCount[abbr] = 1
    }
  }
  
  private func getAbbr(_ s: String, _ index: Int) -> String {
    guard index < s.count - 2 else {
      // no abbrevation needed
      return s
    }
    
    let abbrCount = "\(s.count - index - 1)"
    let startIndex = s.index(s.startIndex, offsetBy: index)
    let prefix = s[..<startIndex]
    let endIndex = s.index(s.endIndex, offsetBy: -1)
    let suffix = s[endIndex...]
    let abbr = "\(prefix)\(abbrCount)\(suffix)"
    return abbr
  }
  
}

/*:
 ## Test
 */
import XCTest

class TestWordAbbreviation: XCTestCase {
  
  func testWordAbbreviation() {
    let solution = Solution()
    let result = solution.wordsAbbreviation(["like", "god", "internal", "me", "internet", "interval", "intension", "face", "intrusion"])
    XCTAssertEqual(result, ["l2e","god","internal","me","i6t","interval","inte4n","f2e","intr4n"])
  }
  
}

TestWordAbbreviation.defaultTestSuite.run()

/*:
 # 418. Sentence Screen Fitting
 
 Given a rows x cols screen and a sentence represented by a list of non-empty words, find how many times the given sentence can be fitted on the screen.
 
 Note:
 
 A word cannot be split into two lines.
 The order of words in the sentence must remain unchanged.
 Two consecutive words in a line must be separated by a single space.
 Total words in the sentence won't exceed 100.
 Length of each word is greater than 0 and won't exceed 10.
 1 ≤ rows, cols ≤ 20,000.
 Example 1:
 
 Input:
 rows = 2, cols = 8, sentence = ["hello", "world"]
 
 Output:
 1
 
 Explanation:
 hello---
 world---
 
 The character '-' signifies an empty space on the screen.
 Example 2:
 
 Input:
 rows = 3, cols = 6, sentence = ["a", "bcd", "e"]
 
 Output:
 2
 
 Explanation:
 a-bcd-
 e-a---
 bcd-e-
 
 The character '-' signifies an empty space on the screen.
 Example 3:
 
 Input:
 rows = 4, cols = 5, sentence = ["I", "had", "apple", "pie"]
 
 Output:
 1
 
 Explanation:
 I-had
 apple
 pie-I
 had--
 
 The character '-' signifies an empty space on the screen.
 
 */


/*:
 **Time Complexity:**
 
 **Space Complexity:**
 */

class Solution {
    
    /*
    
    a bcd e a bcd e a bcd e
    
    xxxxxx
          xxxx
              xxxxxx
    
    */
    
    func wordsTyping(_ sentence: [String], _ rows: Int, _ cols: Int) -> Int {
        
        var combinedStr = ""
        
        for word in sentence {
            combinedStr += "\(word) "
        }
        
        let combinedChars = Array(combinedStr)
        let n = combinedChars.count
        var charCount = 0
        
        for i in 0 ..< rows {
            
            charCount += cols
            
            if combinedChars[charCount % n] == " " {
                charCount += 1
            } else {
                while charCount > 0 && combinedChars[(charCount - 1) % n] != " " {
                    charCount -= 1
                }
            }
        }
        
        return charCount / n
        
    }
}


/*:
 ## Test
 */
import XCTest

class TestSentenceScreenFitting: XCTestCase {
  
  func testSentenceScreenFitting() {
    
  }
  
}

TestSentenceScreenFitting.defaultTestSuite.run()

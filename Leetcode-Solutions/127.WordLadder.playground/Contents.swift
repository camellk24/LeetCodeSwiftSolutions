/*:
 # 127. Word Ladder
 
 Given two words (beginWord and endWord), and a dictionary's word list, find the length of shortest transformation sequence from beginWord to endWord, such that:
 
 Only one letter can be changed at a time.
 Each transformed word must exist in the word list. Note that beginWord is not a transformed word.
 Note:
 
 Return 0 if there is no such transformation sequence.
 All words have the same length.
 All words contain only lowercase alphabetic characters.
 You may assume no duplicates in the word list.
 You may assume beginWord and endWord are non-empty and are not the same.
 Example 1:
 
 Input:
 beginWord = "hit",
 endWord = "cog",
 wordList = ["hot","dot","dog","lot","log","cog"]
 
 Output: 5
 
 Explanation: As one shortest transformation is "hit" -> "hot" -> "dot" -> "dog" -> "cog",
 return its length 5.
 Example 2:
 
 Input:
 beginWord = "hit"
 endWord = "cog"
 wordList = ["hot","dot","dog","lot","log"]
 
 Output: 0
 
 Explanation: The endWord "cog" is not in wordList, therefore no possible transformation.
 
 func ladderLength(_ beginWord: String, _ endWord: String, _ wordList: [String]) -> Int {
 
 }
 
 */

/*:
 **Time Complexity:** O(n!)
 
 **Space Complexity:** O(n!)
 */

func ladderLength(_ beginWord: String, _ endWord: String, _ wordList: [String]) -> Int {
  
  var wordSet: Set<String> = []
  for word in wordList {
    wordSet.insert(word)
  }
  // wordSet.insert(beginWord)
  // wordSet.insert(endWord)
  
  if beginWord == endWord && wordSet.contains(endWord) {
    return 1
  }
  
  // bfs
  var queue: [String] = []
  var visitedWord: Set<String> = []
  var length: Int = 1
  
  queue.append(beginWord)
  visitedWord.insert(beginWord)
  
  while (!queue.isEmpty) {
    
    let size = queue.count
    length += 1
    
    for _ in 0 ..< size {
      
      let word = queue.removeFirst()
      
      
      for nextWord in getNextWord(for: word, in: wordSet) {
        
        if visitedWord.contains(nextWord) {
          continue
        }
        
        if nextWord == endWord {
          return length
        }
        
        queue.append(nextWord)
        visitedWord.insert(nextWord)
      }
      
    }
    
  }
  
  return 0
  
}

private func getNextWord(for word: String, in wordLists: Set<String>) -> Set<String> {
  var nextWordLists: Set<String> = []
  let chars: [Character] = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]
  let wordChars = Array(word)
  
  for char in chars {
    for j in 0 ..< wordChars.count {
      if char == wordChars[j] {
        continue
      }
      var newWordChars = wordChars
      newWordChars[j] = char
      
      let newWord = String(newWordChars)
      if wordLists.contains(newWord) {
        nextWordLists.insert(newWord)
      }
    }
  }
  
  return nextWordLists
}


/*:
 ## Test
 */
import XCTest

class TestWordLadder: XCTestCase {  
  
  func testWordLadder1() {
    let result = ladderLength("hit", "cog", ["hot","dot","dog","lot","log","cog"])
    XCTAssertEqual(result, 5)
  }
  
  func testWordLadder2() {
    let result = ladderLength("hit", "cog", ["hot","dot","dog","lot","log"])
    XCTAssertEqual(result, 0)
  }
  
}

TestWordLadder.defaultTestSuite.run()


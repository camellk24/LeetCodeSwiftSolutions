
/*:
 # Draw Arc According to Binary Input
 
 References:
 1. BQ + 一个数组，类似[0, 1, 1, 0, 1]，可以想象是一个圆形，两个连续点是1的情况下，可以画线，实现连接整个数组的function (http://www.1point3acres.com/bbs/forum.php?mod=viewthread&tid=436632&extra=page%3D1%26filter%3Dsortid%26sortid%3D311%26searchoption%5B3088%5D%5Bvalue%5D%3D10%26searchoption%5B3088%5D%5Btype%5D%3Dradio%26sortid%3D311
 
 2. 小算法是他现场出的，我抽象一下，大概意思是给你一个API，提供起点和终点index，可以画点或者线，现在让你按照给的一个字符串，画一个对应的首尾相接的圆，比如11011，那其实只有一道弧线就可以了。这题目我当时回答的是复制第一个元素到最后，然后直接按照是不是11相邻去按次序画出来就可以。(http://www.1point3acres.com/bbs/forum.php?mod=viewthread&tid=431182&highlight=ios)
 
 3. Given a binary encoded string, find the range of all consecutive 1's and use them to draw an arc. (https://www.glassdoor.com/Interview/-Convert-a-string-into-an-integer-without-using-the-inbuilt-frameworks-Given-a-binary-encoded-string-find-the-range-o-QTN_1566346.htm)
 
 **Implement below function**
 
 func drawArc() {
 
 }
 
 Questions to ask:
 1. What if input has not 1 or 0 value?
 2. Shall i validate input first before drawing anything?
 
 */

// api call
func drawArc(_ startIndex: Int, _ endIndex: Int, _ result: inout [DrawResult]) {
  let draw = DrawResult(start: startIndex, end: endIndex)
  result.append(draw)
}

struct DrawResult: Equatable {
  let start: Int
  let end: Int
  
  static func ==(lhs: DrawResult, rhs: DrawResult) -> Bool {
    return lhs.start == rhs.start && lhs.end == rhs.end
  }
}


/*:
 **Time Complexity:** O(n)
 
 **Space Complexity:** O(1)
 */

class Solution {
  
  func connect(_ input: [Int]) -> [DrawResult] {
    
    var result: [DrawResult] = []
    
    guard input.count > 0 else {
      return result
    }
    
    let first = input[0]
    var mutableInput = input
    mutableInput.append(first)
    
    var lastOneIndex: Int? = nil
    for i in 0 ..< mutableInput.count {
      let curr = mutableInput[i]
      
      if curr == 1 {
        if let index = lastOneIndex {
          if i + 1 < mutableInput.count && mutableInput[i + 1] == 0 {
            drawArc(index, i, &result)
            lastOneIndex = nil
          } else if i + 1 == mutableInput.count {
            drawArc(index, 0, &result)
            lastOneIndex = nil
          }
        } else {
          lastOneIndex = i
        }
      } else {
        lastOneIndex = nil
      }
    }
    
    return result
  }
}


/*:
 ## Test
 */
import XCTest

class DrawArcAccordingtoBinaryInput: XCTestCase {
  
  func testDrawArc1() {
    let input = [1, 1, 0, 1, 1]
    let results = Solution().connect(input)
    let expected = [DrawResult(start: 0, end: 1), DrawResult(start: 3, end: 0)]
    XCTAssertEqual(results, expected)
  }
  
  func testDrawArc2() {
    let input = [1, 0, 0, 1, 1, 1, 1, 1, 0]
    let results = Solution().connect(input)
    let expected = [DrawResult(start: 3, end: 7)]
    XCTAssertEqual(results, expected)
  }
  
  func testDrawArc3() {
    let input = [1, 1, 1, 1, 1, 1, 1, 1, 0]
    let results = Solution().connect(input)
    let expected = [DrawResult(start: 0, end: 7)]
    XCTAssertEqual(results, expected)
  }
  
  func testDrawArc4() {
    let input = [1, 0, 1, 0, 1, 0, 1, 0]
    let results = Solution().connect(input)
    let expected: [DrawResult] = []
    XCTAssertEqual(results, expected)
  }
  
  func testDrawArc5() {
    let input = [1, 0, 1, 0, 1, 0, 1]
    let results = Solution().connect(input)
    let expected: [DrawResult] = [DrawResult(start: 6, end: 0)]
    XCTAssertEqual(results, expected)
  }
  
}

DrawArcAccordingtoBinaryInput.defaultTestSuite.run()





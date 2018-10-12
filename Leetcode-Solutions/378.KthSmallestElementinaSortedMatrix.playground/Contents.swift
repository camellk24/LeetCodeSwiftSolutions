/*:
 # 378. Kth Smallest Element in a Sorted Matrix
 
 Given a n x n matrix where each of the rows and columns are sorted in ascending order, find the kth smallest element in the matrix.
 
 Note that it is the kth smallest element in the sorted order, not the kth distinct element.
 
 Example:
 
 matrix = [
 [ 1,  5,  9],
 [10, 11, 13],
 [12, 13, 15]
 ],
 k = 8,
 
 return 13.
 Note:
 You may assume k is always valid, 1 ≤ k ≤ n2.
 
 */


/*:
 **Time Complexity:** O(klogk)
 
 **Space Complexity:**
 */

class Solution_Heap {
  
  struct Element: Comparable, Hashable {
    
    let x: Int
    let y: Int
    let val: Int
    
    init(_ x: Int, _ y: Int, _ value: Int) {
      self.x = x
      self.y = y
      self.val = value
    }
    
    static func < (lhs: Solution_Heap.Element, rhs: Solution_Heap.Element) -> Bool {
      return lhs.val < rhs.val
    }
    
    static func == (lhs: Solution_Heap.Element, rhs: Solution_Heap.Element) -> Bool {
      return lhs.x == rhs.x && lhs.y == rhs.y && lhs.val == rhs.val
    }
    
  }
    
  func kthSmallest(_ matrix: [[Int]], _ k: Int) -> Int {
    
    // check valid input
    guard matrix.count > 0 && matrix[0].count > 0 else {
      return -1
    }
    
    var minHeap = Heap<Element>(sort: { $0 < $1 })
    minHeap.insert(Element(0, 0, matrix[0][0]))
    
    var visited: Set<Element> = []
    
    let dx = [0, 1]
    let dy = [1, 0]
    let rows = matrix.count
    let cols = matrix[0].count
    
    // NOTE: should iterate from 0 ~ k-1
    for _ in 0 ..< k - 1 {
      let curr = minHeap.remove()!
      
      for j in 0 ..< 2 {
        let nextX = curr.x + dx[j]
        let nextY = curr.y + dy[j]
        
        // check out of bound
        if !isInBound(nextX, nextY, cols, rows) {
          continue
        }
          
        let nextElement = Element(nextX, nextY, matrix[nextX][nextY])
        if !visited.contains(nextElement) {
          visited.insert(nextElement)
          minHeap.insert(nextElement)
        }
      }
      
    }
    
    return minHeap.peek()!.val
  }
  
  private func isInBound(_ x: Int, _ y: Int, _ cols: Int, _ rows: Int) -> Bool {
    return x >= 0 && x < cols && y >= 0 && y < rows
  }
}

/*:
 ## Test
 */
import XCTest

class TestKthSmallestInSorterMatrix: XCTestCase {
  
  func testHeapSolution() {
    let matrix = [
      [ 1,  5,  9],
      [10, 11, 13],
      [12, 13, 15]
    ]
    
    let result = Solution_Heap().kthSmallest(matrix, 8)
    XCTAssertEqual(result, 13)
  }
  
}

TestKthSmallestInSorterMatrix.defaultTestSuite.run()


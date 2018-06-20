/*:
 # 286. Walls and Gates
 
 You are given a m x n 2D grid initialized with these three possible values.
 
 -1 - A wall or an obstacle.
 0 - A gate.
 INF - Infinity means an empty room. We use the value 231 - 1 = 2147483647 to represent INF as you may assume that the distance to a gate is less than 2147483647.
 Fill each empty room with the distance to its nearest gate. If it is impossible to reach a gate, it should be filled with INF.
 
 Example:
 
 Given the 2D grid:
 
 INF  -1  0  INF
 INF INF INF  -1
 INF  -1 INF  -1
 0  -1 INF INF
 After running your function, the 2D grid should be:
 
 3  -1   0   1
 2   2   1  -1
 1  -1   2  -1
 0  -1   3   4


 func wallsAndGates(_ rooms: inout [[Int]]) {
 
 }
 
 */

/*:
 
 BFS: http://www.cnblogs.com/grandyang/p/5285868.html
 
 **Time Complexity:** O(nm)
 
 **Space Complexity:** O(nm)
 */
class Solution {
  func wallsAndGates(_ rooms: inout [[Int]]) {
    
    guard rooms.count > 0 else {
      return
    }
    
    var queue: [(x: Int, y: Int)] = []
    
    // iterate through all elements
    for y in 0 ..< rooms.count {
      for x in 0 ..< rooms[0].count {
        // we find any gates, add to queue
        if rooms[y][x] == 0 {
          queue.append((x, y))
        }
      }
    }
    
    bfs(&rooms, &queue)
  }
  
  private func bfs(_ rooms: inout [[Int]], _ queue: inout [(x: Int, y: Int)]) {
    
    let deltaX = [-1, 1, 0, 0]
    let deltaY = [0, 0, -1, 1]
    let cols = rooms[0].count
    let rows = rooms.count
    
    while (!queue.isEmpty) {
      
      let coordinate = queue.removeFirst()
      let x = coordinate.x
      let y = coordinate.y
      for i in 0...3 {
        
        let newX = deltaX[i] + x
        let newY = deltaY[i] + y
        
        if !isInBound(newX, newY, cols, rows) || rooms[newY][newX] <= rooms[y][x] {
          continue
        }
        
        rooms[newY][newX] = rooms[y][x] + 1
        queue.append((newX, newY))
      }
    }
    
  }
  
  
  private func isInBound(_ x: Int, _ y: Int, _ cols: Int, _ rows: Int) -> Bool {
    return x >= 0 && x < cols && y >= 0 && y < rows
  }
}

/*:
 ## Test
 */
import XCTest

class TestWallsAndGates: XCTestCase {
  
  func testWallsAndGates() {
    let INF = 2147483647
    var rooms: [[Int]] = [[INF, -1, 0, INF],
                          [INF, INF, INF, -1],
                          [INF, -1, INF, -1],
                          [0, -1, INF, INF]]
    
    
    Solution().wallsAndGates(&rooms)
    XCTAssertEqual(rooms, [[3, -1, 0, 1],
                          [2, 2, 1, -1],
                          [1, -1, 2, -1],
                          [0, -1, 3, 4]])
  }
  
}

TestWallsAndGates.defaultTestSuite.run()

/*:
 # 207. Course Schedule
 
 There are a total of n courses you have to take, labeled from 0 to n-1.
 
 Some courses may have prerequisites, for example to take course 0 you have to first take course 1, which is expressed as a pair: [0,1]
 
 Given the total number of courses and a list of prerequisite pairs, is it possible for you to finish all courses?
 
 Example 1:
 
 Input: 2, [[1,0]]
 Output: true
 Explanation: There are a total of 2 courses to take.
 To take course 1 you should have finished course 0. So it is possible.
 Example 2:
 
 Input: 2, [[1,0],[0,1]]
 Output: false
 Explanation: There are a total of 2 courses to take.
 To take course 1 you should have finished course 0, and to take course 0 you should
 also have finished course 1. So it is impossible.
 Note:
 
 The input prerequisites is a graph represented by a list of edges, not adjacency matrices. Read more about how a graph is represented.
 You may assume that there are no duplicate edges in the input prerequisites.
 
 func canFinish(_ numCourses: Int, _ prerequisites: [[Int]]) -> Bool {
 
 }
 
 */

/*:
 
 Topological Sort
 Goal: to find no cycle in directed graph
 
 **Time Complexity:** O(n)
 
 **Space Complexity:** O(n)
 */

func canFinish(_ numCourses: Int, _ prerequisites: [[Int]]) -> Bool {
  
  // Goal: to find no cycle in directed graph
  
  // build graph and indegree
  var graph: [Int: Set<Int>] = [:]
  var indegree: [Int: Int] = [:]
  buildGraphAndIndegree(numCourses, prerequisites, &graph, &indegree)
  
  // find nodes with 0 indegree
  var queue: [Int] = []
  for (node, _indegree) in indegree {
    if _indegree == 0 {
      queue.append(node)
    }
  }
  
  // bfs
  var visited = 0
  while (!queue.isEmpty) {
    let node = queue.removeFirst()
    visited += 1
    if let neighbors = graph[node] {
      for neighbor in neighbors {
        if var existingIndegree = indegree[neighbor] {
          existingIndegree -= 1
          indegree[neighbor] = existingIndegree
          if existingIndegree == 0 {
            queue.append(neighbor)
          }
        }
      }
      
    }
    
  }
  
  return visited == numCourses
}

func buildGraphAndIndegree(_ n: Int, _ edges: [[Int]], _ graph: inout [Int: Set<Int>], _ indegree: inout [Int: Int]) {
  
  for i in 0..<n {
    graph[i] = Set<Int>()
    indegree[i] = 0
  }
  
  for i in 0 ..< edges.count {
    let u = edges[i][0]
    let v = edges[i][1]
    
    // build graph, only add v -> u
    if var existingSet = graph[v] {
      existingSet.insert(u)
      graph[v] = existingSet
    } else {
      graph[v] = [u]
    }
    
    // build indegree
    if var existingIndegree = indegree[u] {
      existingIndegree += 1
      indegree[u] = existingIndegree
    }
    
  }
  
}

/*:
 ## Test
 */
import XCTest

class TestCourseSchedule: XCTestCase {
  
  func testCourseSchedule1() {
    let result = canFinish(2, [[1, 0]])
    XCTAssertTrue(result)
  }
  
  func testCourseSchedule2() {
    let result = canFinish(2, [[1, 0], [0, 1]])
    XCTAssertFalse(result)
  }
  
  
}

TestCourseSchedule.defaultTestSuite.run()

/*:
 # 210. Course Schedule II
 
 There are a total of n courses you have to take, labeled from 0 to n-1.
 
 Some courses may have prerequisites, for example to take course 0 you have to first take course 1, which is expressed as a pair: [0,1]
 
 Given the total number of courses and a list of prerequisite pairs, return the ordering of courses you should take to finish all courses.
 
 There may be multiple correct orders, you just need to return one of them. If it is impossible to finish all courses, return an empty array.
 
 Example 1:
 
 Input: 2, [[1,0]]
 Output: [0,1]
 Explanation: There are a total of 2 courses to take. To take course 1 you should have finished
 course 0. So the correct course order is [0,1] .
 Example 2:
 
 Input: 4, [[1,0],[2,0],[3,1],[3,2]]
 Output: [0,1,2,3] or [0,2,1,3]
 Explanation: There are a total of 4 courses to take. To take course 3 you should have finished both
 courses 1 and 2. Both courses 1 and 2 should be taken after you finished course 0.
 So one correct course order is [0,1,2,3]. Another correct ordering is [0,2,1,3] .
 Note:
 
 The input prerequisites is a graph represented by a list of edges, not adjacency matrices. Read more about how a graph is represented.
 You may assume that there are no duplicate edges in the input prerequisites.
 
 func findOrder(_ numCourses: Int, _ prerequisites: [[Int]]) -> [Int] {
 
 }
 
 */

/*:
 
 Topological Sort
 Goal: to find no cycle in directed graph
 
 **Time Complexity:** n nodes, m edges -> O(m)
 
 **Space Complexity:** O(m)
 */

func findOrder(_ numCourses: Int, _ prerequisites: [[Int]]) -> [Int] {
  // Goal: to find no cycle in directed graph
  
  if numCourses == 0 {
    return []
  }
  
  if numCourses == 1 {
    return [0]
  }
  
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
  var visitedNodes: [Int] = []
  while (!queue.isEmpty) {
    let node = queue.removeFirst()
    visitedNodes.append(node)
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
  
  if visitedNodes.count == numCourses {
    return visitedNodes
  } else {
    
    return []
  }
  
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

class TestCourseScheduleII: XCTestCase {
  
  func testCourseSchedule1() {
    let result = findOrder(2, [[1, 0]])
    XCTAssertEqual(result, [0, 1])
  }
  
  func testCourseSchedule2() {
    let result = findOrder(2, [[1, 0], [0, 1]])
    XCTAssertEqual(result, [])
  }
  
  
}

TestCourseScheduleII.defaultTestSuite.run()

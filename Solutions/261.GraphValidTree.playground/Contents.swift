/*:
 # 261. Graph Valid Tree
 
 Given n nodes labeled from 0 to n-1 and a list of undirected edges (each edge is a pair of nodes), write a function to check whether these edges make up a valid tree.
 
 Example 1:
 
 Input: n = 5, and edges = [[0,1], [0,2], [0,3], [1,4]]
 Output: true
 Example 2:
 
 Input: n = 5, and edges = [[0,1], [1,2], [2,3], [1,3], [1,4]]
 Output: false
 Note: you can assume that no duplicate edges will appear in edges. Since all edges are undirected, [0,1] is the same as [1,0] and thus will not appear together in edges.
 
 */


/*:
 **Time Complexity:** O(n)
 
 **Space Complexity:** O(n)
 */

func validTree(_ n: Int, _ edges: [[Int]]) -> Bool {
  
  guard n > 0 else {
    return false
  }
  // 判断条件：
  // 1. n 个点需要有 n - 1 条边
  guard n - 1 == edges.count else {
    return false
  }
  
  let graph = initializeGraph(n, edges)
  
  var queue: [Int] = []
  var visitedNode = Set<Int>()
  
  queue.append(0)
  visitedNode.insert(0)
  
  // 2. bfs 找graph 的连通性
  while (!queue.isEmpty) {
    
    let node = queue.removeFirst()
    
    if let edges = graph[node] {
      
      for neighbor in edges {
        if visitedNode.contains(neighbor) {
          // 此处不可以直接返回false, 因为图是undirected
          continue
        }
        visitedNode.insert(neighbor)
        queue.append(neighbor)
      }
    }
  }
  
  return visitedNode.count == n
  
}

func initializeGraph(_ n: Int, _ edges: [[Int]]) -> [Int : Set<Int>] {
  
  var graph: [Int : Set<Int>] = [:]
  
  for i in 0 ..< n {
    
    graph[i] = Set<Int>()
    
  }
  
  for i in 0 ..< edges.count {
    
    let u = edges[i][0]
    let v = edges[i][1]
    
    if var existingSet = graph[u] {
      existingSet.insert(v)
      graph[u] = existingSet
    } else {
      let newSet: Set<Int> = [v]
      graph[u] = newSet
    }
    
    if var existingSet = graph[v] {
      existingSet.insert(u)
      graph[v] = existingSet
    } else {
      let newSet: Set<Int> = [u]
      graph[v] = newSet
    }
  }
  
  return graph
  
}

/*:
 ## Test
 */
import XCTest

class TestValidTree: XCTestCase {
  
  func testValidTree1() {
    let result = validTree(5, [[0, 1], [0, 2], [0, 3], [1, 4]])
    XCTAssertTrue(result)
  }
  
  func testValidTree2() {
    let result = validTree(5, [[0, 1], [1, 2], [2, 3], [1, 3], [1, 4]])
      XCTAssertFalse(result)
  }
  
}

TestValidTree.defaultTestSuite.run()

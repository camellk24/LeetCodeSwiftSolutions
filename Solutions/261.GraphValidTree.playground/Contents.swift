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

class Solution_BFS {
  func validTree(_ n: Int, _ edges: [[Int]]) -> Bool {
    
    guard n > 0 else {
      return false
    }
    
    guard edges.count + 1 == n else {
      return false
    }
    
    let graph = initGraph(n, edges)
    
    // bfs
    var queue: [Int] = []
    var visited: Set<Int> = []
    
    queue.append(0)
    visited.insert(0)
    
    while (!queue.isEmpty) {
      
      let node = queue.removeFirst()
      
      for neighbor in graph[node]! {
        if visited.contains(neighbor) {
          continue
        }
        queue.append(neighbor)
        visited.insert(neighbor)
      }
    }
    
    return visited.count == n
  }
  
  private func initGraph(_ n: Int, _ edges: [[Int]]) -> [Int : Set<Int>] {
    
    var graph: [Int : Set<Int>] = [:]
    
    for i in 0 ..< n {
      graph[i] = Set<Int>()
    }
    
    for edge in edges {
      
      let u = edge[0]
      let v = edge[1]
      
      if graph[u] != nil {
        graph[u]!.insert(v)
      } else {
        
      }
      
      if graph[v] != nil {
        graph[v]!.insert(u)
      }
    }
    
    return graph
  }
}

class Solution_DFS {
  func validTree(_ n: Int, _ edges: [[Int]]) -> Bool {
    
    guard n > 0 else {
      return false
    }
    
    guard edges.count + 1 == n else {
      return false
    }
    
    let graph = initGraph(n, edges)
    
    // dfs
    var visited: Set<Int> = []
    dfs(graph, 0, &visited)
    return visited.count == n
  }
  
  private func dfs(_ graph: [Int : Set<Int>], _ node: Int, _ visited: inout Set<Int>) {
    
    if visited.contains(node) {
      return
    }
    
    visited.insert(node)
    
    for neighbor in graph[node]! {
      dfs(graph, neighbor, &visited)
    }
  }
  
  private func initGraph(_ n: Int, _ edges: [[Int]]) -> [Int : Set<Int>] {
    
    var graph: [Int : Set<Int>] = [:]
    
    for i in 0 ..< n {
      graph[i] = Set<Int>()
    }
    
    for edge in edges {
      
      let u = edge[0]
      let v = edge[1]
      
      if graph[u] != nil {
        graph[u]!.insert(v)
      } else {
        
      }
      
      if graph[v] != nil {
        graph[v]!.insert(u)
      }
    }
    
    return graph
  }
}

/*:
 ## Test
 */
import XCTest

class TestValidTree: XCTestCase {
  
  func testValidTree1() {
    let bfsSolution = Solution_BFS()
    let dfsSolution = Solution_DFS()
    let bfsResult = bfsSolution.validTree(5, [[0, 1], [0, 2], [0, 3], [1, 4]])
    let dfsResult = dfsSolution.validTree(5, [[0, 1], [0, 2], [0, 3], [1, 4]])
    XCTAssertTrue(bfsResult)
    XCTAssertTrue(dfsResult)
  }
  
  func testValidTree2() {
    let bfsSolution = Solution_BFS()
    let dfsSolution = Solution_DFS()
    let bfsResult = bfsSolution.validTree(5, [[0, 1], [1, 2], [2, 3], [1, 3], [1, 4]])
    let dfsResult = dfsSolution.validTree(5, [[0, 1], [1, 2], [2, 3], [1, 3], [1, 4]])
    XCTAssertFalse(bfsResult)
    XCTAssertFalse(dfsResult)
  }
  
}

TestValidTree.defaultTestSuite.run()

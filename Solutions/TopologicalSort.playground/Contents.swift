/*:
 # LintCode 127. Topological Sorting
 
 Question
 Given an directed graph, a topological order of the graph nodes is defined as follow:
 For each directed edge A -> B in graph, A must before B in the order list.
 The first node in the order can be any node in the graph with no nodes direct to it. Find any topological order for the given graph.
 Example
 For graph as follow:
 
 

 
 ![https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcThE9AgZZszyhwe0o9qpp3VyizdIj9kWwMY50HiQEysXvkSLsoZ](images.jpeg)
 
 
 The topological order can be:
 [0, 1, 2, 3, 4, 5] [0, 2, 3, 1, 5, 4] ...
 Challenge
 Can you do it in both BFS and DFS?
 
 
 
 **Implement below function**
 
 func postorderTraversal(_ root: TreeNode?) -> [Int] {
 
 }
 
 */


// Definition for undirected graph.
public class DirectedGraphNode {
  public var label: Int
  public var neighbors: [DirectedGraphNode]
  
  init(_ label: Int, _ neighbors: [DirectedGraphNode]) {
    self.label = label
    self.neighbors = neighbors
  }
}

extension DirectedGraphNode: Equatable {
  public static func ==(lhs: DirectedGraphNode, rhs: DirectedGraphNode) -> Bool {
    return lhs.label == rhs.label && lhs.neighbors == rhs.neighbors
  }
}


extension DirectedGraphNode: Hashable {
  public var hashValue: Int {
    var hash = label.hashValue
    for neighor in neighbors {
      hash = hash ^ neighor.label.hashValue
    }
    return hash
  }
}

/*:
 
 BFS
 
 **Time Complexity:** O(V+E), V is number of vertices, E is number of edges
 
 **Space Complexity:** O(V)
 */

class Solution {
  
  public func topSort(_ graph: [DirectedGraphNode]) -> [DirectedGraphNode] {
    
    // calculate ingree
    var indegree: [DirectedGraphNode : Int] = getIndegree(graph)
    
    // bfs
    let firstNode: DirectedGraphNode = findNodeWithZeroIndegree(indegree)!
    
    var queue: [DirectedGraphNode] = []
    var order: [DirectedGraphNode] = []
    
    queue.append(firstNode)
    order.append(firstNode)
    
    while (!queue.isEmpty) {
      
      let node = queue.removeFirst()
      
      for neighbor in node.neighbors {
        indegree[neighbor]! -= 1
        
        if indegree[neighbor]! == 0 {
          queue.append(neighbor)
          order.append(neighbor)
        }
      }
    }
    
    return order
  }
  
  private func findNodeWithZeroIndegree(_ indegree: [DirectedGraphNode : Int]) -> DirectedGraphNode? {
    for (node, indegree) in indegree {
      if indegree == 0 {
        return node
      }
    }
    return nil
  }
  
  private func getIndegree(_ graph: [DirectedGraphNode]) -> [DirectedGraphNode : Int] {
    
    var indegree: [DirectedGraphNode : Int] = [:]
    
    // init indegree
    for node in graph {
      indegree[node] = 0
    }
    
    // update indegree
    for node in graph {
      for neighbor in node.neighbors {
        indegree[neighbor]! += 1
      }
    }
    return indegree
  }
  
}


/*:
 ## Test
 */
import XCTest

class TestTopSort: XCTestCase {
  
  func testTopSort() {
    
    let node4 = DirectedGraphNode(4, [])
    let node5 = DirectedGraphNode(5, [])
    let node1 = DirectedGraphNode(1, [node4])
    let node2 = DirectedGraphNode(2, [node4, node5])
    let node3 = DirectedGraphNode(3, [node4, node5])
    let node0 = DirectedGraphNode(0, [node1, node2, node3])
    
    let graph = [node0, node1, node2, node3, node4, node5]
    
    let sorted = Solution().topSort(graph)
    
    let sortedArray = sorted.map({ $0.label })
    
    XCTAssertEqual(sortedArray, [0, 1, 2, 3, 4, 5])
  }
  
}

TestTopSort.defaultTestSuite.run()

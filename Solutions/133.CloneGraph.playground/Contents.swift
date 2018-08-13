/*:
 # 133. Clone Graph

 Clone an undirected graph. Each node in the graph contains a label and a list of its neighbors.
 
 
 OJ's undirected graph serialization:
 Nodes are labeled uniquely.
 
 We use # as a separator for each node, and , as a separator for node label and each neighbor of the node.
 As an example, consider the serialized graph {0,1,2#1,2#2,2}.
 
 The graph has a total of three nodes, and therefore contains three parts as separated by #.
 
 First node is labeled as 0. Connect node 0 to both nodes 1 and 2.
 Second node is labeled as 1. Connect node 1 to node 2.
 Third node is labeled as 2. Connect node 2 to node 2 (itself), thus forming a self-cycle.
 Visually, the graph looks like the following:
 
    1
   / \
  /   \
 0 --- 2
      / \
      \_/
 
 **Implement below function**
 
 /**
 * Definition for undirected graph
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.left = nil
 *         self.right = nil
 *     }
 * }
 */
 
 func postorderTraversal(_ root: TreeNode?) -> [Int] {
 
 }
 
 */


// Definition for undirected graph.
public class UndirectedGraphNode {
  public var label: Int
  public var neighbors: [UndirectedGraphNode]
  
  init(label: Int, neighbors: [UndirectedGraphNode]) {
    self.label = label
    self.neighbors = neighbors
  }
}

extension UndirectedGraphNode: Equatable {
  public static func ==(lhs: UndirectedGraphNode, rhs: UndirectedGraphNode) -> Bool {
    return lhs.label == rhs.label && lhs.neighbors == rhs.neighbors
  }
}
  
  
extension UndirectedGraphNode: Hashable {
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

  public func cloneGraph(_ node: UndirectedGraphNode) -> UndirectedGraphNode {

    // 1. extract all nodes from given node using bfs
    let nodes = getNode(node)

    // 2. copy nodes
    var mapping: [UndirectedGraphNode : UndirectedGraphNode] = [:]
    for node in nodes {
      // NOTE: here we don't want to pass neighbors to new node
      let newNode = UndirectedGraphNode(label: node.label, neighbors: [])
      mapping[node] = newNode
    }

    // 3. connect neighbors
    for node in nodes {
      let newNode = mapping[node]!
      for neighor in node.neighbors {
        let newNeighor = mapping[neighor]!
        newNode.neighbors.append(newNeighor)
      }
    }

    return mapping[node]!
  }


  // bfs helper
  func getNode(_ node: UndirectedGraphNode) -> Set<UndirectedGraphNode> {

    var queue: [UndirectedGraphNode] = []
    var set = Set<UndirectedGraphNode>()
    queue.append(node)
    set.insert(node)

    while !queue.isEmpty {
      let node = queue.removeFirst()
      for neighor in node.neighbors {
        if !set.contains(neighor) {
          queue.append(neighor)
          set.insert(neighor)
        }
      }
    }

    return set
  }
}
  

/*:
 ## Test
 */
import XCTest

class TestCloneGraph: XCTestCase {
  
  func getTestGraph() -> UndirectedGraphNode {
    
    // {0,1,2#1,2#2,2}
    
    /*
 
        1
       / \
      /   \
     0 --- 2
          / \
          \_/
 
    */
    
    let nodeZero = UndirectedGraphNode(label: 0, neighbors: [])
    let nodeOne = UndirectedGraphNode(label: 1, neighbors: [])
    let nodeTwo = UndirectedGraphNode(label: 2, neighbors: [])
    
    nodeZero.neighbors.append(nodeOne)
    nodeZero.neighbors.append(nodeTwo)
    
    nodeOne.neighbors.append(nodeTwo)
    nodeTwo.neighbors.append(nodeTwo)
    
    return nodeZero
  }
  
  func testCloneGraph() {
    
    let copyGraph = Solution().cloneGraph(getTestGraph())
    
    XCTAssertEqual(copyGraph.label, 0)
    XCTAssertEqual(copyGraph.neighbors.count, 2)
    
    let nodeOne = copyGraph.neighbors[0]
    XCTAssertEqual(nodeOne.label, 1)
    XCTAssertEqual(nodeOne.neighbors.count, 1)
    XCTAssertEqual(nodeOne.neighbors[0].label, 2)
    
    let nodeTwo = copyGraph.neighbors[1]
    XCTAssertEqual(nodeTwo.label, 2)
    XCTAssertEqual(nodeOne.neighbors.count, 1)
    XCTAssertEqual(nodeTwo.neighbors[0].label, 2)
  }
  
}

TestCloneGraph.defaultTestSuite.run()

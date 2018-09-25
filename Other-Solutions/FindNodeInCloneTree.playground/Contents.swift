/*:
 # Find Node in Clone Tree
 
You have a simple tree structure Ⓐ and its clone ⓐ. Each node in the tree has a pointer to it's parent as well as an array of its children. Given an original tree's node Ⓑ and cloned tree ⓐ,
 implement a method that returns ⓑ (the clone of Ⓑ). (Imagine finding the matching UIButton/UISlider/UIView in a separate cloned view controller.)
 
 Assume it's possible to have duplicate view in same tree
 
 Original:
 
        A
      / | \
     B  B  B
    /   |   \
   C    C    D
  /     |     \
 G      D      E
 
 Clone:
 
        a
      / | \
     b  b  b
    /   |   \
   c    c    d
  /     |     \
 g      d      e
 
 Find d
 
 
 
 Reference:
 https://www.glassdoor.com/Interview/given-an-array-of-words-how-to-eliminate-the-duplicates-You-have-a-simple-tree-structure-and-its-clone-Each-no-QTN_1341992.htm
 
 
 
 
 func findView(_ view: UIView, in cloneView: UIView) -> UIView {
 
 }
 
 */


/*:
 Find the path first, and then bfs to find target
 
 **Time Complexity:** O(nlogn)
 
 **Space Complexity:** O(1)
 */

class Solution {
  
  func findView(_ view: UIView, in cloneView: UIView) -> UIView {
    // tag paths
    var path: [Int] = []
    var testView: UIView? = view
    while testView != nil {
      path.append(testView!.tag)
      testView = testView?.superview
    }
    
    if path.count == 1 {
      return cloneView
    }
    
    return bfs(cloneView, path)
  }
  
  private func bfs(_ view: UIView, _ targetTagPath: [Int]) -> UIView {
    
    var queue = [(view: UIView, targetIndex: Int)]()
    
    // target index start from 1 because we will need to check subviews
    queue.append((view, targetTagPath.count - 2))
    
    while !queue.isEmpty {
      
      let popItem = queue.removeFirst()
      let popView = popItem.view
      let targetIndex = popItem.targetIndex
      let subviewTargetTag = targetTagPath[popItem.targetIndex]
      
      for subview in popView.subviews {
        if subview.tag == subviewTargetTag {
          // if reach end of target path, return subview is the clone view target
          if targetIndex == 0 {
            return subview
          }
          queue.append((subview, targetIndex - 1))
        }
      }
    }
    
    fatalError("invalid input.")
  }
  
}

/*:
 ## Test
 */
import XCTest

class TestFindViewInCloneView: XCTestCase {
  
  func getTestRootAndTarget() -> (root: UIView, target: UIView) {
    
    /*
     
     Original:
     
            A
          / | \
         B  B  B
        /   |   \
       C    C    D
      /     |     \
     G      D      E
 
     */
    
    
    let viewA = UIView()
    viewA.tag = 1
    
    let viewB1 = UIView()
    viewB1.tag = 2
    let viewB2 = UIView()
    viewB2.tag = 2
    let viewB3 = UIView()
    viewB3.tag = 2
    
    let viewC1 = UIView()
    viewC1.tag = 3
    let viewC2 = UIView()
    viewC2.tag = 3
    
    let viewD1 = UIView()
    viewD1.tag = 4
    let viewD2 = UIView()
    viewD2.tag = 4
    
    let viewG = UIView()
    viewG.tag = 5
    
    let viewE = UIView()
    viewE.tag = 6
    
    viewA.addSubview(viewB1)
    viewA.addSubview(viewB2)
    viewA.addSubview(viewB3)
    
    viewB1.addSubview(viewC1)
    viewB1.addSubview(viewC2)
    viewB1.addSubview(viewD1)
    
    viewC1.addSubview(viewG)
    viewC2.addSubview(viewD2)
    viewD1.addSubview(viewE)
    
    
    return (viewA, viewD1)
  }
  
  func testFIndViewInCloneView() {
    /*
     
     Original:
     
            A
          / | \
         B  B  B
        /   |   \
       C    C    D
      /     |     \
     G      D      E
     
     */
    
    
    let viewA = UIView()
    viewA.tag = 1
    
    let viewB1 = UIView()
    viewB1.tag = 2
    let viewB2 = UIView()
    viewB2.tag = 2
    let viewB3 = UIView()
    viewB3.tag = 2
    
    let viewC1 = UIView()
    viewC1.tag = 3
    let viewC2 = UIView()
    viewC2.tag = 3
    
    let viewD1 = UIView()
    viewD1.tag = 4
    let viewD2 = UIView()
    viewD2.tag = 4
    
    let viewG = UIView()
    viewG.tag = 5
    
    let viewE = UIView()
    viewE.tag = 6
    
    viewA.addSubview(viewB1)
    viewA.addSubview(viewB2)
    viewA.addSubview(viewB3)
    
    viewB1.addSubview(viewC1)
    viewB1.addSubview(viewC2)
    viewB1.addSubview(viewD1)
    
    viewC1.addSubview(viewG)
    viewC2.addSubview(viewD2)
    viewD1.addSubview(viewE)
    

    XCTAssertEqual(Solution().findView(viewA, in: viewA).tag, 1)
    XCTAssertEqual(Solution().findView(viewB1, in: viewA).tag, 2)
    XCTAssertEqual(Solution().findView(viewB2, in: viewA).tag, 2)
    XCTAssertEqual(Solution().findView(viewB3, in: viewA).tag, 2)
    XCTAssertEqual(Solution().findView(viewC1, in: viewA).tag, 3)
    XCTAssertEqual(Solution().findView(viewC2, in: viewA).tag, 3)
    XCTAssertEqual(Solution().findView(viewD1, in: viewA).tag, 4)
    XCTAssertEqual(Solution().findView(viewD2, in: viewA).tag, 4)
    XCTAssertEqual(Solution().findView(viewG, in: viewA).tag, 5)
    XCTAssertEqual(Solution().findView(viewE, in: viewA).tag, 6)
    
  }
  
}

TestFindViewInCloneView.defaultTestSuite.run()

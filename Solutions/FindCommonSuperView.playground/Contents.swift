/*:
 # Find Common Superview
 
 func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode, q: TreeNode) -> TreeNode? {
 
 }
 
 */

import UIKit

/*:
 
 **Time Complexity:** O(min(mh, nh))
 
 **Space Complexity:** O(min(mh, nh))
 */

func findCommonSuperView(_ view1: UIView, _ view2: UIView) -> UIView? {
  
  var set = Set<UIView>()
  var v1: UIView? = view1
  var v2: UIView? = view2
  
  while v1 != nil || v2 != nil {
    
    if let common = findCommonSuperView(&v1, in: &set) {
      return common
    }
    
    if let common = findCommonSuperView(&v2, in: &set) {
      return common
    }
    
  }
  
  return nil
}


private func findCommonSuperView(_ view: inout UIView?, in set: inout Set<UIView>) -> UIView? {
  
  guard let superview = view?.superview else {
    return nil
  }
  
  if set.contains(superview) {
    return superview
  } else {
    set.insert(superview)
    view = superview
    return nil
  }
}



/*:
 ## Test
 */
import XCTest

class TestFindCommonSuperView: XCTestCase {
  
  func testFindCommonSuperView() {
    
    let view1 = UIView()
    let view2 = UIView()
    let view3 = UIView()
    let view4 = UIView()
    let view5 = UIView()
    let view6 = UIView()
    
    view1.addSubview(view2)
    view2.addSubview(view3)
    view3.addSubview(view4)
    view4.addSubview(view5)
    view3.addSubview(view6)
    
    view1.tag = 1
    view2.tag = 2
    view3.tag = 3
    view4.tag = 4
    view5.tag = 5
    view6.tag = 6
    
    let commonView = findCommonSuperView(view5, view6)
    XCTAssertEqual(commonView?.tag, 3)
    
  }
  
}

TestFindCommonSuperView.defaultTestSuite.run()


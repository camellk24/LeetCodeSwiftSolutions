/*:
 # Find Common Superview
 
 func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode, q: TreeNode) -> TreeNode? {
 
 }
 
 */

import UIKit

/*:
 
 **Time Complexity:** O(min(m, n))
 
 **Space Complexity:** O(min(m, n))
 */

func findCommonSuperView(_ view1: UIView, _ view2: UIView) -> UIView? {
  var superViewSet = Set<UIView>()
  var testView1: UIView? = view1
  var testView2: UIView? = view2
  while testView1 != nil || testView2 != nil {
    print("hit here")
    if let foundSuperview = checkCommonSuperView(for: &testView1, in: &superViewSet) {
      return foundSuperview
    }
    if let foundSuperview = checkCommonSuperView(for: &testView2, in: &superViewSet) {
      return foundSuperview
    }
  }
  return .none
}

private func checkCommonSuperView(for view: inout UIView?, in superViewSet: inout Set<UIView>) -> UIView? {
  if let superview = view?.superview {
    if superViewSet.contains(superview) {
      return superview
    } else {
      superViewSet.insert(superview)
      view = superview
    }
  }
  
  return .none
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


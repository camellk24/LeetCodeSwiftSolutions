/*:
 # Draw Child Views Inside Parent View
 
 http://www.1point3acres.com/bbs/forum.php?mod=viewthread&tid=343623&highlight=ios
 
给一个parent view和一些childviews， view的structure和point的structure是已经定义好了的。把childview画到parentview里面，从第一列开始，从上往下画，第一列画不下了就从第二列开始，第一列的宽度是第一列里最宽的childview的宽度。然后返回所有childview的左上角坐标。 如果遇到不能fit的childview就返回之前所有childviews的坐标。 写完了follow up是，如果要把每列的childview居中对齐怎么改。
 
 */


/*:
 **Time Complexity:**
 
 **Space Complexity:**
 */

import UIKit
import PlaygroundSupport

class Solution {
  
  func draw(_ childViews: [UIView], in parentView: UIView) -> [CGPoint] {

    var childViewOrigins: [CGPoint] = []
    let width = parentView.frame.width
    let height = parentView.frame.height
    var maxWidthInCol: CGFloat = 0
    var cellOrigin: CGPoint = .zero
    
    var currCols: [UIView] = []
    
    for child in childViews {
      
      if viewCanFit(child, width - cellOrigin.x, height - cellOrigin.y) {
        addChild(child, to: parentView, at: &cellOrigin, &childViewOrigins, &maxWidthInCol)
        currCols.append(child)
      } else {
        
        // switch to new col
        cellOrigin = CGPoint(x: cellOrigin.x + maxWidthInCol, y: 0)
        
        // center current cols
        let centerX = cellOrigin.x - maxWidthInCol / 2
        centerCols(currCols, centerX)
        
        // reset
        maxWidthInCol = 0
        currCols = []
        
        // try after switching to new col, can child fit, it not return previous child views
        if !viewCanFit(child, width - cellOrigin.x, height) {
          return childViewOrigins
        } else {
          addChild(child, to: parentView, at: &cellOrigin, &childViewOrigins,  &maxWidthInCol)
          currCols.append(child)
        }
      }
    }
    
    centerCols(currCols, cellOrigin.x + maxWidthInCol / 2)
    
    return childViewOrigins
  }
  
  private func centerCols(_ cols: [UIView], _ centerX: CGFloat) {
    for view in cols {
      view.center.x = centerX
    }
  }
  
  private func addChild(_ child: UIView, to parent: UIView, at cellOrigin: inout CGPoint, _ childViewOrigins: inout [CGPoint], _ maxWidthInCol: inout CGFloat) {
    child.frame.origin = cellOrigin
    parent.addSubview(child)
    childViewOrigins.append(cellOrigin)
    // update status
    maxWidthInCol = max(maxWidthInCol, child.frame.width)
    cellOrigin = CGPoint(x: cellOrigin.x, y: cellOrigin.y + child.frame.height)
  }
  
  private func viewCanFit(_ view: UIView, _ width: CGFloat, _ height: CGFloat) -> Bool {
    return view.frame.width <= width && view.frame.height <= height
  }
  
}

let parentView = UIView(frame: CGRect(x: 0, y: 0, width: 500, height: 500))
parentView.backgroundColor = UIColor.white

let child1 = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
child1.backgroundColor = UIColor.blue

let child2 = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
child2.backgroundColor = UIColor.yellow

let child3 = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
child3.backgroundColor = UIColor.cyan

let child4 = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
child4.backgroundColor = UIColor.green

let child5 = UIView(frame: CGRect(x: 0, y: 0, width: 300, height: 300))
child5.backgroundColor = UIColor.black

let solution = Solution()
let result = solution.draw([child1, child2, child3, child4, child5], in: parentView)

print("result: \(result)")

PlaygroundPage.current.liveView = parentView


/*:
 ## Test
 */
import XCTest

class TestDrawChildViewsInsideParentView: XCTestCase {
  
  func testDrawChildViewsInsideParentView() {
    
  }
  
}

TestDrawChildViewsInsideParentView.defaultTestSuite.run()

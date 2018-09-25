
/*:
 # Print UIView Hierarchy
 
references:
https://www.glassdoor.com/Interview/print-hierarchy-of-a-uiview-QTN_1963734.htm
http://www.1point3acres.com/bbs/forum.php?mod=viewthread&tid=306760&highlight=ios,
http://www.1point3acres.com/bbs/forum.php?mod=viewthread&tid=435012&extra=page%3D1%26filter%3Dsortid%26sortid%3D311%26searchoption%5B3088%5D%5Bvalue%5D%3D10%26searchoption%5B3088%5D%5Btype%5D%3Dradio%26searchoption%5B3046%5D%5Bvalue%5D%3D1%26searchoption%5B3046%5D%5Btype%5D%3Dradio%26sortid%3D311,
http://www.1point3acres.com/bbs/forum.php?mod=viewthread&tid=433733&extra=page%3D1%26filter%3Dsortid%26sortid%3D311%26searchoption%5B3088%5D%5Bvalue%5D%3D10%26searchoption%5B3088%5D%5Btype%5D%3Dradio%26searchoption%5B3046%5D%5Bvalue%5D%3D1%26searchoption%5B3046%5D%5Btype%5D%3Dradio%26sortid%3D311

 
 **Implement below function**
 
 var recursiveDescription: String {
 
 }
 
 */

/*:
 **Time Complexity:** O(n^2)
 
 **Space Complexity:** O(n)
 */

import UIKit

extension UIView {
  
  var recursiveDescription: String {
    var result = ""
    viewHierarchy("", &result)
    return result
  }
  
  private func viewHierarchy(_ prefix: String, _ result: inout String) {
    let currentViewDesc = prefix + self.description + "\n"
    result.append(currentViewDesc)
    
    for subview in subviews {
      subview.viewHierarchy("\(prefix)  ", &result)
    }
  }
  
  var iterativeDescription: String {
    var result = ""
    var stack: [(UIView, String)] = [] // view and indents
    let firstItem = (self, "")
    stack.append(firstItem)
    while !stack.isEmpty {
      let popItem = stack.removeLast()
      let view = popItem.0
      let prevPrefix = popItem.1
      let newPrefix = "\(prevPrefix)  "
      result.append("\(newPrefix)\(view.description)\n" )
      for subview in view.subviews {
        stack.append((subview, newPrefix))
      }
    }
    return result
  }
  
}

/*:
 ## Test
 */
import XCTest

class TestPrintViewHierarchy: XCTestCase {
  
  func testReccursiveSolution() {
    print(getTestView().recursiveDescription)
  }
  
  func testIterativeSolution() {
    print(getTestView().iterativeDescription)
  }
  
  private func getTestView() -> UIView {
    
    let root = UIView()
    
    let view1 = UIView()
    
    let view1Label1 = UILabel()
    let view1Label2 = UILabel()
    let view1Label3 = UILabel()
    
    view1.addSubview(view1Label1)
    view1.addSubview(view1Label2)
    view1.addSubview(view1Label3)
    
    let label1 = UILabel()
    
    let label1Label1 = UILabel()
    let label1Label2 = UILabel()
    let label1Label3 = UILabel()
    
    label1.addSubview(label1Label1)
    label1.addSubview(label1Label2)
    label1.addSubview(label1Label3)
    
    let label2 = UILabel()
    
    root.addSubview(view1)
    root.addSubview(label1)
    root.addSubview(label2)
    
    return root
    
  }
  
}

TestPrintViewHierarchy.defaultTestSuite.run()






/*:
 # 278. First Bad Versionn
 
 You are a product manager and currently leading a team to develop a new product. Unfortunately, the latest version of your product fails the quality check. Since each version is developed based on the previous version, all the versions after a bad version are also bad.
 
 Suppose you have n versions [1, 2, ..., n] and you want to find out the first bad one, which causes all the following ones to be bad.
 
 You are given an API bool isBadVersion(version) which will return whether version is bad. Implement a function to find the first bad version. You should minimize the number of calls to the API.
 
 **Example:**
 
 Given n = 5
 
 call isBadVersion(3) -> false
 call isBadVersion(5) -> true
 call isBadVersion(4) -> true
 
 Then 4 is the first bad version.
 
 **Implement below function**
 
 func isBadVersion(_ version: Int) -> Bool
 
 func firstBadVersion(_ lastestVersionNumber: Int) -> Int {
 
 }
 
 */

/*:
 **Time Complexity:** O(nlogn)
 
 **Space Complexity:** O(1)
 */
func firstBadVersion(_ lastestVersionNumber: Int) -> Int {
  var start = 1
  var end = lastestVersionNumber
  
  while (start + 1 < end) {
    let mid = start + (end - start) / 2
    if isBadVersion(mid) {
      end = mid
    } else {
      start = mid
    }
  }
  
  if isBadVersion(start) {
    return start
  }

  return end
}

func isBadVersion(_ version: Int) -> Bool {
  return version >= 5
}


/*:
 ## Test
 */
import XCTest

class TestFirstBadVersion: XCTestCase {

  let versions: [Int] = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]
 
  func testFirstBadVersion() {
    let result = firstBadVersion(versions.last!)
    XCTAssertEqual(result, 5)
  }


}

TestFirstBadVersion.defaultTestSuite.run()





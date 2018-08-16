/*:
 # Custom Version
 
 http://www.1point3acres.com/bbs/forum.php?mod=viewthread&tid=423494&extra=page%3D1%26filter%3Dsortid%26sortid%3D311%26searchoption%5B3088%5D%5Bvalue%5D%3D10%26searchoption%5B3088%5D%5Btype%5D%3Dradio%26sortid%3D311
 
 
 */


/*:
 
 Time Complexity: O(nL)
 
 Space Complexity: O(n)
 
 */

class Version: Equatable, Comparable {
  
  let major: Int
  let minor: Int
  let patch: Int
  
  init(_ major: Int, _ minor: Int, _ patch: Int) {
    self.major = major
    self.minor = minor
    self.patch = patch
  }
  
  init(_ string: String) {
    let components = string.components(separatedBy: ".").compactMap({ Int($0) })
    
    if components.count >= 1 {
      self.major = components[0]
    } else {
      self.major = 0
    }
    
    if components.count >= 2 {
      self.minor = components[1]
    } else {
      self.minor = 0
    }
    
    if components.count >= 3 {
      self.patch = components[2]
    } else {
      self.patch = 0
    }
  }
  
  public func printVersion() {
    print("\(major).\(minor).\(patch)")
  }
  
  public static func < (lhs: Version, rhs: Version) -> Bool {
    
    if lhs.major < rhs.major {
      return true
    } else if lhs.major == rhs.major {
      if lhs.minor < rhs.minor {
        return true
      } else if lhs.minor == rhs.minor {
        if lhs.patch < rhs.patch {
          return true
        }
      }
    }
    
    return false
  }
  
  public static func ==(lhs: Version, rhs: Version) -> Bool {
    return lhs.major == rhs.major && lhs.minor == rhs.minor && lhs.patch == rhs.patch
  }
  
}



/*:
 ## Test
 */
import XCTest

class TestVersion: XCTestCase {
  
  func testVersionGreaterThan() {
    let version1 = Version(1, 2, 3)
    let version2 = Version(1, 2, 0)
    XCTAssertEqual(version1 > version2, true)
  }
  
  func testVersionLessThan() {
    let version1 = Version(1, 2, 3)
    let version2 = Version(1, 2, 0)
    XCTAssertEqual(version1 < version2, false)
  }
  
  func testVersionEqual() {
    let version1 = Version(1, 2, 3)
    let version2 = Version(1, 2, 3)
    XCTAssertEqual(version1 == version2, true)
  }
  
  func testInitializingWithString() {
    let version = Version("1.0.0")
    XCTAssertEqual(version.major, 1)
    XCTAssertEqual(version.minor, 0)
    XCTAssertEqual(version.patch, 0)
  }
  
  func testStringVersionEqual() {
    let version1 = Version("1.0.0")
    let version2 = Version("1.0.0.0")
    XCTAssertEqual(version1, version2)
  }
  
}

TestVersion.defaultTestSuite.run()

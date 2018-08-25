/*:
 # LintCode 612. K Closest Point
 
 Description
 Given some points and a point origin in two dimensional space, find k points out of the some points which are nearest to origin.
 Return these points sorted by distance, if they are same with distance, sorted by x-axis, otherwise sorted by y-axis.
 
 Have you met this question in a real interview?
 Example
 Given points = [[4,6],[4,7],[4,4],[2,5],[1,1]], origin = [0, 0], k = 3
 return [[1,1],[2,5],[4,4]]
 
 */


struct Point: Equatable {
  let x: Int
  let y: Int
  
  static func ==(lhs: Point, rhs: Point) -> Bool {
    return lhs.x == rhs.x && lhs.y == rhs.y
  }
}

/*:
 Solution using heap, there is no build in priority queue in Swift, use quick select to solve the issue.
 
 Otherwise, should try to choose another language
 
 **Time Complexity:** O(nlogk)
 
 **Space Complexity:** O(k)
 */


/*:
 Quick select solution
 
 **Time Complexity:** O(n) average, O(n + klogk) time if output is sorted;  O(n^2) worst case
 
 **Space Complexity:** O(1)
 */

class QuickSelectSolution {
  
  func kClosestPoints(_ points: [Point], _ origin: Point, _ k: Int) -> [Point] {
    
    var pts = points
    let kP = quickSelect(&pts, 0, pts.count - 1, origin, k)
    
    var result: [Point] = []
    for p in points {
      if result.count == k {
        return result
      }
      // can't include equal
      // 1, 2, 3, 4, 4, 4 when k = 4
      // it's possile that we add 4, 4, 4 if we include
      if compare(p, kP, origin) == .orderedAscending {
        result.append(p)
      }
    }
    
    for _ in 0 ..< k - result.count {
      result.append(kP)
    }
    
    return result
  }
  
  private func quickSelect(_ pts: inout [Point], _ left: Int, _ right: Int, _ origin: Point, _ k: Int) -> Point {
  
    var i = left
    var j = right
    let mid = (right - left) / 2 + left
    let pivot = pts[mid]
    
    while i <= j {
      while i <= j && compare(pts[i], pivot, origin) == .orderedDescending {
        i += 1
      }
      
      while i <= j && compare(pts[j], pivot, origin) == .orderedAscending {
        j -= 1
      }
      
      if i <= j {
        let temp = pts[j]
        pts[j] = pts[i]
        pts[i] = temp
        i += 1
        j -= 1
      }
    }
    
    if left + k - 1 <= j {
      return quickSelect(&pts, left, j, origin, k)
    }
    if left + k - 1 >= i {
      return quickSelect(&pts, i, right, origin, k - (i - left))
    }
    
    return pts[j+1]
  }
  
  private func compare(_ p1: Point, _ p2: Point, _ origin: Point) -> ComparisonResult {
    let d1 = getDistance(p1, origin)
    let d2 = getDistance(p2, origin)
    
    if d1 < d2 {
      return .orderedAscending
    } else if d1 > d2 {
      return .orderedDescending
    } else {
      if p1.x < p2.x {
        return .orderedAscending
      } else if p1.x > p2.x {
        return .orderedDescending
      } else {
        if p1.y < p2.y {
          return .orderedAscending
        } else if p1.y > p2.y {
          return .orderedDescending
        } else {
          return .orderedSame
        }
      }
    }
  }
  
  private func getDistance(_ p1: Point, _ p2: Point) -> Int {
    let dx = p1.x - p2.x
    let dy = p1.y - p2.y
    return dx * dx + dy * dy
  }
}

/// Helper method to get distance form point to origin
///
/// - Parameters:
///   - point:
///   - origin:
/// - Returns:
private func getDistance(_ point: Point, _ origin: Point) -> Int {
  let deltaX = point.x - origin.x
  let deltaY = point.y - origin.y
  return deltaX * deltaX + deltaY * deltaY
}

/*:
 ## Test
 */
import XCTest

class TestKClosestPoints: XCTestCase {
  
  func testKClosestPoints1() {
    let samplePoints = [Point(x: 4, y: 6),
                       Point(x: 4, y: 7),
                       Point(x: 4, y: 4),
                       Point(x: 2, y: 5),
                       Point(x: 1, y: 1)]
    
    let origin = Point(x: 0, y: 0)
    let k = 3
    
    let solution = QuickSelectSolution()
    let results = solution.kClosestPoints(samplePoints, origin, k)
    
    let expectedResult = [Point(x: 1, y: 1), Point(x: 2, y: 5), Point(x: 4, y: 4)]
    
    for result in results {
      XCTAssertTrue(expectedResult.contains(result))
    }
  }
  
  func testKClosestPoints2() {
    let samplePoints = [Point(x: 4, y: 6),
                        Point(x: 4, y: 7),
                        Point(x: 4, y: 10),
                        Point(x: 4, y: 4),
                        Point(x: 2, y: 5),
                        Point(x: 1, y: 1)]
    
    let origin = Point(x: 0, y: 0)
    let k = 3
    
    let solution = QuickSelectSolution()
    let results = solution.kClosestPoints(samplePoints, origin, k)
    let expectedResult = [Point(x: 1, y: 1), Point(x: 2, y: 5), Point(x: 4, y: 4)]
    for result in results {
      XCTAssertTrue(expectedResult.contains(result))
    }
  }
  
  func testKClosestPoints3() {
    let samplePoints = [Point(x: 4, y: 6),
                        Point(x: 4, y: 7),
                        Point(x: 4, y: 4),
                        Point(x: 4, y: 4),
                        Point(x: 2, y: 5),
                        Point(x: 1, y: 1)]

    let origin = Point(x: 0, y: 0)
    let k = 3

    let solution = QuickSelectSolution()
    let results = solution.kClosestPoints(samplePoints, origin, k)
    let expectedResult = [Point(x: 1, y: 1), Point(x: 2, y: 5), Point(x: 4, y: 4)]

    for result in results {
      XCTAssertTrue(expectedResult.contains(result))
    }
  }
  
  func testKClosestPoints4() {
    let samplePoints = [Point(x: 4, y: 4),
                        Point(x: 4, y: 4),
                        Point(x: 4, y: 4),
                        Point(x: 3, y: 3),
                        Point(x: 2, y: 2),
                        Point(x: 1, y: 1)]

    let origin = Point(x: 0, y: 0)
    let k = 4

    let solution = QuickSelectSolution()
    let results = solution.kClosestPoints(samplePoints, origin, k)
    let expectedResult = [Point(x: 1, y: 1), Point(x: 2, y: 2), Point(x: 3, y: 3), Point(x: 4, y: 4)]

    for result in results {
      XCTAssertTrue(expectedResult.contains(result))
    }
  }
  
}

TestKClosestPoints.defaultTestSuite.run()

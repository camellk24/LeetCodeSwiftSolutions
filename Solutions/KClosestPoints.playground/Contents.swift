/*:
 # LintCode 612. K Closest Point
 
 Description
 Given some points and a point origin in two dimensional space, find k points out of the some points which are nearest to origin.
 Return these points sorted by distance

 
 Example
 Given points = [[4,6],[4,7],[4,4],[2,5],[1,1]], origin = [0, 0], k = 3
 return [[1,1],[2,5],[4,4]]
 
 
 func kClosestPoints(_ points: [Point], _ origin: Point, _ k: Int) -> [Point] {
 
 }
 
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
    
    let kthLargetPoint = findKthLargest(points, origin, k)
    
    // find kth largest
    // e.g. k = 3
    
    print("kth largest point: \(kthLargetPoint)")
    var result: [Point] = []
    for i in 0 ..< points.count {
      if result.count == k {
        break
      }
      let distKthLargestPoint = getDistance(kthLargetPoint, origin)
      let pointDist = getDistance(points[i], origin)
      if pointDist < distKthLargestPoint {
        result.append(points[i])
      }
    }
    
    if result.count < k {
      for _ in 0 ..< k - result.count {
        result.append(kthLargetPoint)
      }
    }
    return result
  }
  
  func findKthLargest(_ points: [Point], _ origin: Point, _ k: Int) -> Point {
    var mutablePoints = points
    return quickSelect(&mutablePoints, origin, 0, points.count - 1, k)
  }
  
  // use quick select
  // take nums, left bound, right bound, k
  // return k largest
  func quickSelect(_ points: inout [Point], _ origin: Point, _ left: Int, _ right: Int, _ k: Int) -> Point {
    
    var i = left
    var j = right
    let pivot = points[(left + right) / 2] // take middle point as pivot
    
    // partition
    while (i <= j) {
      
      // move i if nums[i] > pivot
      
      let distP = getDistance(pivot, origin)
      
      while (i <= j && getDistance(points[i], origin) > distP) {
        i += 1
      }
    
      // move j if nums[j] < pivot
      while (i <= j && getDistance(points[j], origin) < distP) {
        j -= 1
      }
      
      if i <= j {
        let temp = points[i]
        points[i] = points[j]
        points[j] = temp
        i += 1
        j -= 1
      }
    }
    
    // quick select left partition, if k is within left partition
    if (left + k - 1 <= j) {
      return quickSelect(&points, origin, left, j, k)
    }
    
    // quick select right partition, if k is within right partition
    if (left + k - 1 >= i) {
      return quickSelect(&points, origin, i, right, (k - (i - left)))
    }
    
    return points[j+1]
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
    
    print("test 2 results: \(results)")
    
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
    
    print("test 2 results: \(results)")
    
    let expectedResult = [Point(x: 1, y: 1), Point(x: 2, y: 5), Point(x: 4, y: 4)]
    
    for result in results {
      XCTAssertTrue(expectedResult.contains(result))
    }
  }
  
}

TestKClosestPoints.defaultTestSuite.run()

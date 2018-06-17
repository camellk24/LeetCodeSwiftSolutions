/*:
 Find Intersection of Two NSRange
 
 NOTE: NSRange ->   lowerBound <= range < upperBound
 
 func intersection(_ range1: NSRange, _ range2: NSRange) -> NSRange? {
 }
 
 */

func intersection(_ range1: NSRange, _ range2: NSRange) -> NSRange? {
  
  let range1LowerBound = range1.lowerBound
  let range1UpperBound = range1.upperBound
  let range2LowerBound = range2.lowerBound
  let range2UpperBound = range2.upperBound
  
  let maxLowerBound = max(range1LowerBound, range2LowerBound)
  let minUpperBound = min(range1UpperBound, range2UpperBound)
  
  //NOTE: lowerBound <= range < upperBound
  
  if maxLowerBound < minUpperBound {
    let length = minUpperBound - maxLowerBound
    return NSRange(location: maxLowerBound, length: length)
  } else {
    return nil
  }
}

func intersection(_ r1: Range<Int>, _ r2: Range<Int>) -> Range<Int>? {
  
  let lb1 = r1.lowerBound
  let lb2 = r2.lowerBound
  let ub1 = r1.upperBound
  let ub2 = r2.upperBound
  
  let maxLb = max(lb1, lb2)
  let minUb = min(ub1, ub2)
  
  if maxLb < minUb {
    return maxLb ..< minUb
  } else {
    return .none
  }
}



/*:
 ## Test
 */
import XCTest

class TestNSRangeIntersection: XCTestCase {
  
  func testNSRangeIntersectionOverlay() {
    let range1 = NSRange(location: 0, length: 5)
    let range2 = NSRange(location: 3, length: 7)
    let result = intersection(range1, range2)
    let expected = range1.intersection(range2)
    XCTAssertEqual(result, expected)
  }
  
  func testRangeIntersectionOverlay() {
    let range1: Range<Int> = 0 ..< 5
    let range2: Range<Int> = 3 ..< 10
    let result = intersection(range1, range2)
    let expected: Range<Int> = 3 ..< 5
    XCTAssertEqual(result, expected)
  }
  
  func testNSRangeIntersectionNoOverlay() {
    let range1 = NSRange(location: 0, length: 5)
    let range2 = NSRange(location: 7, length: 10)
    let result = intersection(range1, range2)
    let expected = range1.intersection(range2)
    XCTAssertEqual(result, expected)
  }
  
  func testRangeIntersectionNoOverlay() {
    let range1: Range<Int> = 0 ..< 5
    let range2: Range<Int> = 7 ..< 10
    let result = intersection(range1, range2)
    XCTAssertEqual(result, nil)
  }
  
  func testNSRangeIntersectionNoOverlayOnEdge() {
    let range1 = NSRange(location: 0, length: 5)
    let range2 = NSRange(location: 5, length: 7)
    let result = intersection(range1, range2)
    let expected = range1.intersection(range2)
    XCTAssertEqual(result, expected)
  }
  
  func testRangeIntersectionNoOverlayOnEdge() {
    let range1: Range<Int> = 0 ..< 5
    let range2: Range<Int> = 5 ..< 7
    let result = intersection(range1, range2)
    XCTAssertEqual(result, nil)
  }
  
  func testNSRangeIntersectionNoOverlaySubset() {
    let range1 = NSRange(location: 0, length: 5)
    let range2 = NSRange(location: -10, length: 10)
    let result = intersection(range1, range2)
    let expected = range1.intersection(range2)
    XCTAssertEqual(result, expected)
  }
  
  func testNSRangeIntersectionSameRange() {
    let range1 = NSRange(location: 0, length: 5)
    let range2 = NSRange(location: 0, length: 5)
    let result = intersection(range1, range2)
    let expected = range1.intersection(range2)
    XCTAssertEqual(result, expected)
  }
  
  func testRangeIntersectionSameRange() {
    let range1: Range<Int> = 0 ..< 5
    let range2: Range<Int> = 0 ..< 5
    let result = intersection(range1, range2)
    let expected: Range<Int> = 0 ..< 5
    XCTAssertEqual(result, expected)
  }
  
}

TestNSRangeIntersection.defaultTestSuite.run()


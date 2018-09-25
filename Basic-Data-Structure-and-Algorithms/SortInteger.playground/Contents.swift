/*:
 # Merge Sort
 
 Given an integer array, sort it in ascending order. Use selection sort, bubble sort, insertion sort or any O(n2) algorithm.
 
 
 Example
 Given [3, 2, 1, 4, 5], return [1, 2, 3, 4, 5].
 
 func sortIntegers(_ nums: inout [Int]) {
 
 }
 
 */

/*:
 Merge Sort
 
 **Time Complexity:** O(nlogn)
 
 **Space Complexity: O(n)
 */

class Solution_Merge_Sort {
  func sortIntegers(_ nums: inout [Int]) {
    nums = mergeSort(nums)
  }
  
  private func mergeSort<T: Comparable>(_ a: [T]) -> [T] {
    guard a.count > 1 else {
      return a
    }
    
    let n = a.count
    let mid = n / 2
    let left = mergeSort(Array(a[0 ..< mid]))
    let right = mergeSort(Array(a[mid ..< n]))
    return merge(left, right)
  }
  
  private func merge<T: Comparable>(_ leftPile: [T], _ rightPile: [T]) -> [T] {
    
    var leftIndex = 0
    var rightIndex = 0
    
    var orderedPile = [T]()
    
    while leftIndex < leftPile.count && rightIndex < rightPile.count {
      
      let left = leftPile[leftIndex]
      let right = rightPile[rightIndex]
      
      if left < right {
        orderedPile.append(left)
        leftIndex += 1
      } else if left > right {
        orderedPile.append(right)
        rightIndex += 1
      } else {
        orderedPile.append(left)
        orderedPile.append(right)
        leftIndex += 1
        rightIndex += 1
      }
    }
    
    while leftIndex < leftPile.count {
      orderedPile.append(leftPile[leftIndex])
      leftIndex += 1
    }
    
    while rightIndex < rightPile.count {
      orderedPile.append(rightPile[rightIndex])
      rightIndex += 1
    }
    
    return orderedPile
  }
}

/*:
 Quick Sort
 
 **Time Complexity:** O(nlogn)
 
 **Space Complexity: O(logn)
 */
class Solution_Quick_Sort {
  
  func sortIntegers(_ nums: inout [Int]) {
    quickSort(&nums, 0, nums.count - 1)
  }
  
  func quickSort<T: Comparable>(_ a: inout [T], _ start: Int, _ end: Int) {
    guard start < end else {
      return
    }
    
    var left = start
    var right = end
    let mid = (end - start) / 2 + start
    let pivot = a[mid]
    
    while left <= right {
      
      while (left <= right && a[left] < pivot) {
        left += 1
      }
      
      while (left <= right && a[right] > pivot) {
        right -= 1
      }
      
      if left <= right {
        let temp = a[left]
        a[left] = a[right]
        a[right] = temp
        left += 1
        right -= 1
      }
      
      quickSort(&a, start, right)
      quickSort(&a, left, end)
    }
  }
  
}


/*:
 ## Test
 */
import XCTest

class TestSortIntegers: XCTestCase {
  
  func testSortIntegersMergeSort() {
    var input = [3, 2, 1, 4, 5]
    let solution = Solution_Merge_Sort()
    solution.sortIntegers(&input)
    XCTAssertEqual(input, [1, 2, 3, 4, 5])
  }
  
  func testSortIntegersMergeSort1() {
    var input = [3, 2, 1, 4, 5, 7, 1, 3]
    let solution = Solution_Merge_Sort()
    solution.sortIntegers(&input)
    XCTAssertEqual(input, [1, 1, 2, 3, 3, 4, 5, 7])
  }
  
  func testSortIntegersQuickSort() {
    var input = [3, 2, 1, 4, 5]
    let solution = Solution_Quick_Sort()
    solution.sortIntegers(&input)
    XCTAssertEqual(input, [1, 2, 3, 4, 5])
  }
  
  func testSortIntegersQuickSort1() {
    var input = [3, 2, 1, 4, 5, 7, 1, 3]
    let solution = Solution_Quick_Sort()
    solution.sortIntegers(&input)
    XCTAssertEqual(input, [1, 1, 2, 3, 3, 4, 5, 7])
  }
  
}

TestSortIntegers.defaultTestSuite.run()

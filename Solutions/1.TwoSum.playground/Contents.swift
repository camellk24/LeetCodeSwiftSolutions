
/*:
 # 1. Two Sum
 
 Given an array of integers, return indices of the two numbers such that they add up to a specific target.
 
 You may assume that each input would have exactly one solution, and you may not use the same element twice.
 
 **Example:**
 
 Given nums = [2, 7, 11, 15], target = 9,
 
 Because nums[0] + nums[1] = 2 + 7 = 9,
 return [0, 1].
 
 **Implement below function**
 
 func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
 
 }
 
 */

/*:
 ## One Passes dictionary solution (Best Solution)
 
 **Time Complexity:** O(n). We traverse the list containing nn elements only once. Each look up in the table costs only O(1) time.
 
 **Space Complexity:** O(n). The extra space required depends on the number of items stored in the hash table, which stores at most nn elements.
 */
func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    var complementDict: [Int : Int] = [:]
    for i in 0 ..< nums.count {
        let num = nums[i]
        let complement = target - num
        if let matchIndex = complementDict[complement], matchIndex != i {
            return [matchIndex, i]
        }
        complementDict[num] = i
    }
    fatalError("invalid input")
}


/*:
 ## Test
 */
import XCTest

class TestTwoSum: XCTestCase {
  
  let testArray: [Int] = [2, 7, 11, 15, 1, 100, 13, 12]
  let target = 101
  
  func testTwoPassSolution() {
    let result = twoSum(testArray, target)
    XCTAssertEqual(testArray[result[0]] + testArray[result[1]], target)
  }
  
  
}

TestTwoSum.defaultTestSuite.run()





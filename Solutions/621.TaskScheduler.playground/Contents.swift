/*:
 # 621. Task Scheduler
 
 Given a char array representing tasks CPU need to do. It contains capital letters A to Z where different letters represent different tasks.Tasks could be done without original order. Each task could be done in one interval. For each interval, CPU could finish one task or just be idle.
 
 However, there is a non-negative cooling interval n that means between two same tasks, there must be at least n intervals that CPU are doing different tasks or just be idle.
 
 You need to return the least number of intervals the CPU will take to finish all the given tasks.
 
 Example 1:
 Input: tasks = ["A","A","A","B","B","B"], n = 2
 Output: 8
 Explanation: A -> B -> idle -> A -> B -> idle -> A -> B.
 Note:
 The number of tasks is in the range [1, 10000].
 The integer n is in the range [0, 100].
 
 
 func leastInterval(_ tasks: [Character], _ n: Int) -> Int {
 
 }
 
 */


/*:
 Greedy Solution
 
 **Time Complexity:** O(n)
 
 **Space Complexity:** O(1)
 */

class Solution {
  func leastInterval(_ tasks: [Character], _ n: Int) -> Int {
    
    // count the frequency of each tasks
    
    var taskCount: [Character : Int] = [:]
    var maxCount = 0
    var numberOfHighestFrequencyCharacter = 0
    
    for task in tasks {
      let newCount: Int
      if let existingCount = taskCount[task] {
        newCount = existingCount + 1
        taskCount[task] = newCount
      } else {
        newCount = 1
        taskCount[task] = newCount
      }
      
      // update numberOfHighestFrequencyCharacte
      if newCount > maxCount {
        numberOfHighestFrequencyCharacter = 1
      } else if newCount == maxCount {
        numberOfHighestFrequencyCharacter += 1
      }
      
      maxCount = max(maxCount, newCount)
    }
    
    // A ... A ... A A same frequency
    //    n
    // (n+1) * (k - 1) + number of element with same frequency
    
    let result = (n + 1) * (maxCount - 1) + numberOfHighestFrequencyCharacter
    
    // there could be a special case
    // where we don't need to insert any idle state
    // n = 2
    // A B C A B C A B D A B D E F G H I
    // thus we also need to check max of original tasks
    
    return max(result, tasks.count)
  }
}

/*:
 ## Test
 */
import XCTest

class TestTaskScheduler: XCTestCase {
  
  func testTaskScheduler() {
    let solution = Solution()
    let result = solution.leastInterval(["A", "A", "A", "B", "B", "B"], 2)
    XCTAssertEqual(result, 8)
  }
  
  func testNoIdleInsertionNeeded() {
    let solution = Solution()
    let result = solution.leastInterval(["A", "A", "A", "A", "B", "B", "B", "C", "C", "D", "D", "F", "F", "G"], 2)
    XCTAssertEqual(result, 14)
  }
  
}

TestTaskScheduler.defaultTestSuite.run()

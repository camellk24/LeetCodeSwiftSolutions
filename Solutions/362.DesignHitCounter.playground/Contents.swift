/*:
 # 362. Design Hit Counter
 
 Design a hit counter which counts the number of hits received in the past 5 minutes.
 
 Each function accepts a timestamp parameter (in seconds granularity) and you may assume that calls are being made to the system in chronological order (ie, the timestamp is monotonically increasing). You may assume that the earliest timestamp starts at 1.
 
 It is possible that several hits arrive roughly at the same time.
 
 Example:
 
 HitCounter counter = new HitCounter();
 
 // hit at timestamp 1.
 counter.hit(1);
 
 // hit at timestamp 2.
 counter.hit(2);
 
 // hit at timestamp 3.
 counter.hit(3);
 
 // get hits at timestamp 4, should return 3.
 counter.getHits(4);
 
 // hit at timestamp 300.
 counter.hit(300);
 
 // get hits at timestamp 300, should return 4.
 counter.getHits(300);
 
 // get hits at timestamp 301, should return 3.
 counter.getHits(301);
 Follow up:
 What if the number of hits per second could be very large? Does your design scale?
 
 */

/*:
 
 **Time Complexity:**
 
 **Space Complexity:**
 
 */

class HitCounter {
  
  var queue: [Date] = []
  
  func getHits(_ timestamp: Date) -> Int {
    updateQueue(timestamp)
    return queue.count
  }
  
  func hit(_ timestamp: Date) {
    updateQueue(timestamp)
    queue.append(timestamp)
  }
  
  func updateQueue(_ timestamp: Date) {
    while let first = queue.first, timestamp.timeIntervalSince(first) >= 300 {
      queue.removeFirst()
    }
  }
}

/*:
 ## Test
 */
import XCTest

class TestHitCounter: XCTestCase {
  
  func testHitCounter() {
    let hitCounter = HitCounter()
    let currentDate = Date()
    hitCounter.hit(currentDate.addingTimeInterval(1))
    hitCounter.hit(currentDate.addingTimeInterval(2))
    hitCounter.hit(currentDate.addingTimeInterval(3))
    hitCounter.hit(currentDate.addingTimeInterval(4))
    hitCounter.hit(currentDate.addingTimeInterval(5))
    
    XCTAssertEqual(hitCounter.getHits(currentDate.addingTimeInterval(6)), 5)
    XCTAssertEqual(hitCounter.getHits(currentDate.addingTimeInterval(301)), 4)
  }
  
}

TestHitCounter.defaultTestSuite.run()

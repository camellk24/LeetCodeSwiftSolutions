/*:
 # Implement Cancellable DispatchAsyncAfter
 
 iOS developers have a "dispatch_after(when, queue, block )" Grand Central Dispatch (GCD) function they can utilize but once it's set up, these calls can not be easily cancelled. Describe how you might implement a more convenient version of this named "cancellable_dispatch_after"
 
 
 https://www.glassdoor.com/Interview/iOS-developers-have-a-dispatch-after-when-queue-block-Grand-Central-Dispatch-GCD-function-they-can-utilize-but-once-QTN_1341994.htm
 
 */

import Foundation

class DispatchWorkItemSolution {

  func cancellable_dispatch_async_after(_ execution: @escaping () -> ()) -> DispatchWorkItem {
    let workItem = DispatchWorkItem(block: execution)
    let queue = DispatchQueue(label: "cancellable_dispatch_async_after")
    queue.asyncAfter(deadline: DispatchTime.now() + .milliseconds(200), execute: workItem)
    return workItem
  }
  
}


//item.cancel()

// Custom Work Item

class CustomDispatchWorkItemSolution {

  func customCancellableDispatchAsyncAfter(_ queue: DispatchQueue, _ dispatchTime: DispatchTime, _ execution: @escaping () -> ()) -> CancellableExecutionItem {
    let customWorkItem = CancellableExecutionItem(queue, dispatchTime)
    customWorkItem.execute(execution)
    return customWorkItem
  }
  
}

class CancellableExecutionItem {
  
  let queue: DispatchQueue
  let dispatchTime: DispatchTime
  var isCancelled: Bool = false
  
  init(_ dispatchQueue: DispatchQueue, _ dispatchTime: DispatchTime) {
    self.queue = dispatchQueue
    self.dispatchTime = dispatchTime
  }
  
  func execute(_ block: @escaping () -> ()) {
      queue.asyncAfter(deadline: dispatchTime, execute: { [weak self] in
        guard let _self = self else {
          return
        }
        if !_self.isCancelled {
          block()
        }
      })
  }
  
  func cancel() {
    isCancelled = true
  }
}



/*:
 ## Test
 */
import XCTest

class TestCancellableDispatchAsyncAfter: XCTestCase {
  
  func testCustomDispatchWorkItemSolution() {
    
    let workItem = DispatchWorkItemSolution().cancellable_dispatch_async_after {
      print("process canellable async after.")
    }
    
    workItem.cancel()
  }
  
  
  func testCustomCancellableSolution() {
    let customCancalleableItem = CustomDispatchWorkItemSolution().customCancellableDispatchAsyncAfter(DispatchQueue.main, DispatchTime.now() + .milliseconds(200)) {
      print("test custom cancallable item.")
    }
    
    customCancalleableItem.cancel()
  }
  
}

TestCancellableDispatchAsyncAfter.defaultTestSuite.run()

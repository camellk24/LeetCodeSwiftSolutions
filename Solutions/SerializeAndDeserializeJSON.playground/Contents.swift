
/*:
 # Serialize and Deserialize JSON
 */

/*:
 **Time Complexity:**
 
 **Space Complexity:**
 */

class Solution {
  
  func toString(_ obj: Any) -> String {
    var result = ""
    toString(obj, &result)
    return result
  }
  
  private func toString(_ obj: Any, _ result: inout String) {
    switch obj {
    case let dict as [String : Any]:
      result.append("{")
      var commaCount = dict.count - 1
      for (_key, value) in dict {
        result.append("\"\(_key)\": ")
        toString(value, &result)
        if commaCount > 0 {
          result.append(", ")
        }
        commaCount -= 1
      }
      result.append("}")
    case let array as [Any]:
      result.append("[")
      var commaCount = array.count - 1
      for item in array {
        toString(item, &result)
        if commaCount > 0 {
          result.append(", \n")
        }
        commaCount -= 1
      }
      result.append("]")
    case let stringValue as String:
      result.append("\"\(stringValue)\"")
    case let intValue as Int:
      result.append("\(intValue)")
    case let doubleValue as Double:
      result.append("\(doubleValue)")
    case let boolValue as Bool:
      result.append("\(boolValue)")
    default:
      break
    }
  }
  
}





/*:
 ## Test
 */
import XCTest

class TestSerializeAndDeserializeJSON: XCTestCase {
  
  func testDeserializeJSON() {
    let json: Any = ["person" : ["name": "Jason"]]
    let solution = Solution()
    let result = solution.toString(json)
    print("json to string: \(result)")
  }
  
  func testDeserializeJSON1() {
    let json: Any = ["person" : ["name": "Jason", "age": 19]]
    let solution = Solution()
    let result = solution.toString(json)
    print("json to string: \(result)")
  }
  
  func testDeserializeJSON2() {
    let json: Any = ["person" : ["name": "Jason", "age": 19, "bank balance": 100.50]]
    let solution = Solution()
    let result = solution.toString(json)
    print("json to string: \(result)")
  }
  
  func testDeserializeJSON3() {
    let json: Any = ["person" : ["name": "Jason", "age": 19, "bank balance": 100.50, "married": false]]
    let solution = Solution()
    let result = solution.toString(json)
    print("json to string: \(result)")
  }
  
  func testDeserializeJSON4() {
    let json: Any = [["person1" : ["name": "Jason", "age": 19, "bank balance": 100.50, "married": false]], ["person2" : ["name": "Terry", "age": 15, "bank balance": 0.3, "married": true]]]
    let solution = Solution()
    let result = solution.toString(json)
    print("json to string: \(result)")
  }
  
}

TestSerializeAndDeserializeJSON.defaultTestSuite.run()




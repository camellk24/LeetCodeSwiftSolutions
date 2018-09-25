/*:
 # Image Loader with Cache
 
 Reference: https://www.youtube.com/watch?v=XFvs6eraBXM
 
 Implement a singleton photo downloader class. Users may ask for the same URL again while the photo is still downloading, but it's required that each photo only be downloaded once.

 https://www.glassdoor.com/Interview/Dropbox-IOS-Developer-Interview-Questions-EI_IE415350.0,7_KO8,21.htm
 
 */


/*:
 **Time Complexity:**
 
 **Space Complexity:**
 */

import UIKit
import PlaygroundSupport

class ImageDownloader {
  
  var cache: [String : UIImage] = [:]
  
  func downloadImage(_ url: URL, _ completion: (_ image: UIImage?) -> ()) {
    
    if let cachedImage = cache[url.absoluteString] {
      completion(cachedImage)
      return
    }
    
    URLSession.shared.dataTask(with: url) { (data, _, error) in
      if let data = data, let image = UIImage(data: data) {
        dict[url.absoluteString] = image
      }
    
    
      
    }.resume()
    
  }
  
}



//PlaygroundPage.current.liveView = parentView


/*:
 ## Test
 */
import XCTest

class TestDrawChildViewsInsideParentView: XCTestCase {
  
  func testDrawChildViewsInsideParentView() {
    
  }
  
}

TestDrawChildViewsInsideParentView.defaultTestSuite.run()

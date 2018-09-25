
/*:
 # Retain Best Cache
 
 https://www.cnblogs.com/apanda009/p/7945036.html
 http://www.1point3acres.com/bbs/thread-279704-1-1.html
 http://www.1point3acres.com/bbs/thread-436560-1-1.html
 
 Constructor with a data source (assumed to be slow) and a cache size
 * Gets some data. If possible, retrieves it from cache to be fast. If the data is not cached,
 * retrieves it from the data source. If the cache is full, attempt to cache the returned data,
 * evicting the T with lowest rank among the ones that it has available. From 1point 3acres bbs
 * If there is a tie, the cache may choose any T with lowest rank to evict.
 
 public class RetainBestCache<K, T extends Rankable> {
 /* Constructor with a data source (assumed to be slow) and a cache size */.本文原创自1point3acres论坛
 public RetainBestCache(DataSource<K,T> ds, int entriesToRetain) {
 // implement here.本文原创自1point3acres论坛
 }
 
 /* Gets some data. If possible, retrieves it from cache to be fast. If the data is not cached,. 牛人云集,一亩三分地
 * retrieves it from the data source. If the cache is full, attempt to cache the returned data,. from: 1point3acres
 * evicting the T with lowest rank among the ones that it has available. 留学申请论坛-一亩三分地
 * If there is a tie, the cache may choose any T with lowest rank to evict.
 */
 public T get(K key) {
 // implement here
 }
 }
 
 /*
 * For reference, here are the Rankable and DataSource interfaces.
 * You do not need to implement them, and should not make assumptions
 * about their implementations.
 */. Waral 博客有更多文章,
 
 public interface Rankable {
 /**
 * Returns the Rank of this object, using some algorithm and potentially
 * the internal state of the Rankable.
 */
 long getRank();
 }
 
 public interface DataSource<K, T extends Rankable> {
 T get (K key);
 }
 
 */

/*:
 **Time Complexity:**
 
 **Space Complexity:**
 */

protocol Rankable {
  var rank: Int { get }
}

struct Ranking: Rankable {
  let rank: Int
}

class DataSource<Key: Hashable, Rank: Rankable> {
  
  var ranks: [Key : Rank] = [:]
  
  func get(_ key: Key) -> Rank? {
    return ranks[key]
  }
}

class RetainBestCache<Key: Hashable, Rank: Rankable> {
  
  var cache: [Key : Rank]
  var dataSource: DataSource<Key, Rank>
  var rankingOfObject: [Int : Set<Key>] // tree map, black and red tree
  let maxSizeOfCache: Int
  
  init(dataSource: DataSource<Key, Rank>, maxSizeOfCache: Int) {
    self.cache = [:]
    self.dataSource = dataSource
    self.rankingOfObject = [:]
    self.maxSizeOfCache = maxSizeOfCache
  }
  
  func get(_ key: Key) -> Rank? {
    if let cached = cache[key] {
      return cached
    }
    return fetchDataSource(key)
  }
  
  private func fetchDataSource(_ key: Key) -> Rank? {
    
    if cache.count == maxSizeOfCache {
      evictElement()
    }
    
    if let rank = dataSource.get(key) {
      
    }
    
    return nil
  }
  
  private func evictElement() {
    
  }
  
}



/*:
 ## Test
 */
import XCTest

class TestRetainBestCache: XCTestCase {
  
  
  
}

TestRetainBestCache.defaultTestSuite.run()





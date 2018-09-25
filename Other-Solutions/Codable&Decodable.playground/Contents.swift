
import Foundation
import PlaygroundSupport

let jsonString = """
{
"meta": {
"page": 1,
"total_pages": 4,
"per_page": 10,
"total_records": 38
},
"breweries": [
{
"id": 1234,
"name": "Saint Arnold"
},
{
"id": 52892,
"name": "Buffalo Bayou"
}
]
}
"""

struct Meta: Codable {
  let page: Int
  let totalPages: Int
  let perPage: Int
  let totalRecords: Int
  
  enum CodingKeys: String, CodingKey {
    case page
    case totalPages = "total_pages"
    case perPage = "per_page"
    case totalRecords = "total_records"
  }
}

struct Brewery: Codable {
  let id: Int
  let name: String
}

struct BreweryPage: Codable {
  let meta: Meta
  let breweries: [Brewery]
}




do {
  let jsonData = jsonString.data(using: .utf8)!
  let beerPage = try JSONDecoder().decode(BreweryPage.self, from: jsonData)
  print(beerPage)
} catch {
  print("error: \(error.localizedDescription)")
}

// Date

struct Birthday: Encodable {
  let date: Date
}

let date = Birthday(date: Date())


do {
  let birthdayEncoder = JSONEncoder()
  birthdayEncoder.dateEncodingStrategy = .iso8601
  let data = try birthdayEncoder.encode(date)
  print("date data: \(String(data: data, encoding: .utf8)!)")
}


// Handling Float



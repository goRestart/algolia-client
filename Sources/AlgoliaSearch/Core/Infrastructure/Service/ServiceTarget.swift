import Foundation

enum Method: String {
  case get
  case post
  case put
  case delete
}

protocol ServiceTarget {
  var path: String { get }
  var headers: [String: String]? { get }
  var json: [String: Any]? { get }
  var method: Method { get }
}

extension ServiceTarget {
  var headers: [String: String]? {
    return nil
  }
  var json: [String: Any]? {
    return nil
  }
}


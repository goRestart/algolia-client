import Foundation

enum IndexService {
  case add(object: [String: Any], index: Index)
}

// MARK: IndexService + ServiceTarget

extension IndexService: ServiceTarget {
  var path: String {
    switch self {
    case let .add(object: _, index: index):
      return Api.v1("/indexes/\(index.name)")
    }
  }
  
  var method: Method {
    switch self {
    case .add(_ , _):
      return .post
    }
  }
  
  var json: [String: Any]? {
    switch self {
      case let .add(object: object, index: _):
        return object
    }
  }
}

import Foundation

struct Api {
  static func v1(_ path: String) -> String {
    return "/1\(path)"
  }
}

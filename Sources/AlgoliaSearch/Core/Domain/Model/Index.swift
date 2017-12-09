import Foundation

public struct Index {
  
  public let name: String
  private let client: Client<IndexService>
  
  internal init(name: String, client: Client<IndexService>) {
    self.name = name
    self.client = client
  }
  
  /// Add an object to the index, automatically assigning it an object ID.
  ///
  /// - Parameter objects: objects to be added
  /// - Throws: AlgoliaError
  func add(object: [String: Any]) throws {
    try client.run(.add(object: object, index: self))
  }
}

import Foundation

public struct AlgoliaSearch {
  
  private let config: Configuration
  private let clientFactory: ClientFactory
  
  public init(_ config: Configuration) throws {
    try self.init(config, clientFactory: resolver.clientFactory)
  }
  
  internal init(_ config: Configuration,
                clientFactory: ClientFactory) throws
  {
    self.config = config
    self.clientFactory = clientFactory
  }
  
  @discardableResult
  public func index(named: String) throws -> Index {
    let indexClient = try clientFactory.with(config, for: IndexService.self)
    return Index(name: named, client: indexClient)
  }
}

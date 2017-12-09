import Foundation

struct ClientFactory {
  
  private let clientProvider: ClientProvider
  
  init(clientProvider: ClientProvider) {
    self.clientProvider = clientProvider
  }
  
  func with<Service: ServiceTarget>(_ config: Configuration, `for` service: Service.Type) throws -> Client<Service> {
    let client = try clientProvider.make(
      hostname(with: config)
    )
    return Client<Service>(
      client: client,
      configuration: config
    )
  }
  
  private func hostname(with config: Configuration) -> String {
    return "\(config.applicationId).algolia.net"
  }
}

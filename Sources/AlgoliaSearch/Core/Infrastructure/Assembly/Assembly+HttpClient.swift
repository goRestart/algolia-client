import Vapor
import TLS

// MARK: - Client Factory

extension Assembly {
  var clientFactory: ClientFactory {
    return ClientFactory(
      clientProvider: self
    )
  }
}

// MARK: - ClientProvider

extension Assembly: ClientProvider {
  func make(_ hostname: String) throws -> ClientProtocol {
    let context = try TLS.Context(.client)
    return try EngineClient.factory.makeClient(
      hostname: hostname,
      port: 443,
      securityLayer: .tls(context),
      proxy: nil
    )
  }
}

import Vapor
import HTTP
import JSON

struct Client<Service: ServiceTarget> {
 
  private let client: ClientProtocol
  private let configuration: Configuration
  
  init(client: ClientProtocol,
       configuration: Configuration)
  {
    self.client = client
    self.configuration = configuration
  }
  
  @discardableResult
  func run(_ service: Service) throws -> JSON? {
    switch service.method {
    case .get:
      return try handle(service, .get)
    case .post:
      return try handle(service, .post)
    case .put:
      return try handle(service, .put)
    case .delete:
      return try handle(service, .delete)
    }
  }
  
  // MARK: - Handler

  private func handle(_ service: Service, _ method: HTTP.Method) throws -> JSON? {
    let response = try client.request(method, service.path, query: [:], headers(for: service), body(for: service))
    
    guard !response.isSuccessStatus else {
      return response.json
    }
    guard let json = response.json else {
      throw AlgoliaError.unknown
    }
    guard let error = json["message"]?.string else {
      throw AlgoliaError.unknown
    }
    throw AlgoliaError.error(error)
  }
  
  // MARK: - Helpers
  
  private func headers(`for` service: Service) -> [HeaderKey: String] {
    let apiKeyHeader = HeaderKey("X-Algolia-API-Key")
    let applicationIdHeader = HeaderKey("X-Algolia-Application-Id")
    return [
      apiKeyHeader: configuration.apiKey,
      applicationIdHeader: configuration.applicationId
    ]
  }
  
  private func body(`for` service: Service) throws -> Body? {
    guard let json = service.json else { return nil }
    return try Body(
      try JSON(json.makeNode(in: nil))
    )
  }
}

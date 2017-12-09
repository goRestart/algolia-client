import Vapor

protocol ClientProvider {
  func make(_ hostname: String) throws -> ClientProtocol
}

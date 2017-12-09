import HTTP

extension Response {
  var isSuccessStatus: Bool {
    return (status.statusCode >= 200 && status.statusCode < 300)
  }
}

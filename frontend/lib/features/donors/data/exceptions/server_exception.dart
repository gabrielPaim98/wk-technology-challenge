class ServerException implements Exception {
  final int statusCode;
  final String message;
  final String url;
  final String responseBody;

  ServerException({
    required this.statusCode,
    required this.message,
    required this.url,
    required this.responseBody,
  });

  @override
  String toString() {
    return 'ServerException: $message (Status Code: $statusCode, URL: $url, Response: $responseBody)';
  }
}

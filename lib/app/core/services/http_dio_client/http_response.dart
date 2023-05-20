class HttpDioResponse<T> {
  final T data;
  final List<dynamic> cookies;
  final int statusCode;

  const HttpDioResponse(
    this.data, {
    required this.statusCode,
    this.cookies = const [],
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'data': data,
      'statusCode': statusCode,
      'cookies': cookies,
    };
  }
}

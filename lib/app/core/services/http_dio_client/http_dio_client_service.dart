import 'package:marvel_characters/app/core/services/http_dio_client/http_response.dart';

abstract class IHttpDioClientService {
  Future<HttpDioResponse> get(
    String url, {
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParams,
  });

  Future<HttpDioResponse> post(
    String url, {
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? body,
  });

  Future<HttpDioResponse> delete(
    String url, {
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? body,
  });

  Future<HttpDioResponse> put(
    String url, {
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? body,
  });
}

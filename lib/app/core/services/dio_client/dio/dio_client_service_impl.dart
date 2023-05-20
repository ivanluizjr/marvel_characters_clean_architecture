import 'package:dio/dio.dart';
import 'package:marvel_characters/app/core/services/dio_client/http_response.dart';

import '../dio_client_service.dart';
import '../dio_failure.dart';

class DioClientServiceImpl implements IDioClientService {
  final Dio dio;

  const DioClientServiceImpl({
    required this.dio,
  });

  @override
  Future<HttpDioResponse> get(
    final String url, {
    final Map<String, dynamic>? headers,
    final Map<String, dynamic>? queryParams,
  }) async {
    try {
      final response = await dio.get(
        url,
        queryParameters: queryParams,
        options: Options(
          headers: headers,
        ),
      );
      final data = response.data;

      if (data is Map && data.containsKey('error')) {
        throw const HttpFailure(
          statusCode: 500,
        );
      }

      return HttpDioResponse(
        response.data,
        statusCode: response.statusCode ?? 500,
      );
    } on DioError catch (error) {
      throw HttpFailure(
        statusCode: error.response?.statusCode ?? 500,
      );
    }
  }

  @override
  Future<HttpDioResponse> delete(
    final String url, {
    final Map<String, dynamic>? headers,
    final Map<String, dynamic>? queryParams,
    final Map<String, dynamic>? body,
  }) async {
    try {
      final response = await dio.delete(
        url,
        queryParameters: queryParams,
        options: Options(
          headers: headers,
        ),
        data: body,
      );

      final data = response.data;

      if (data is Map && data.containsKey('error')) {
        throw const HttpFailure(
          statusCode: 500,
        );
      }
      return HttpDioResponse(
        data,
        statusCode: response.statusCode ?? 500,
      );
    } on DioError catch (error) {
      throw HttpFailure(
        statusCode: error.response?.statusCode ?? 500,
      );
    }
  }

  @override
  Future<HttpDioResponse> post(
    final String url, {
    final Map<String, dynamic>? headers,
    final Map<String, dynamic>? queryParams,
    final Map<String, dynamic>? body,
  }) async {
    try {
      final response = await dio.post(
        url,
        queryParameters: queryParams,
        options: Options(
          headers: headers,
        ),
        data: body,
      );

      final data = response.data;

      if (data is Map && data.containsKey('error')) {
        throw const HttpFailure(
          statusCode: 500,
        );
      }

      return HttpDioResponse(
        data,
        statusCode: response.statusCode ?? 500,
        cookies: response.headers.map["set-cookie"] ?? [],
      );
    } on DioError catch (error) {
      throw HttpFailure(
        statusCode: error.response?.statusCode ?? 500,
      );
    }
  }

  @override
  Future<HttpDioResponse> put(
    final String url, {
    final Map<String, dynamic>? headers,
    final Map<String, dynamic>? queryParams,
    final Map<String, dynamic>? body,
  }) async {
    try {
      final response = await dio.put(
        url,
        queryParameters: queryParams,
        options: Options(
          headers: headers,
        ),
        data: body,
      );
      final data = response.data;

      if (data is Map && data.containsKey('error')) {
        throw const HttpFailure(
          statusCode: 500,
        );
      }
      return HttpDioResponse(
        data,
        statusCode: response.statusCode ?? 500,
      );
    } on DioError catch (error) {
      throw HttpFailure(
        statusCode: error.response?.statusCode ?? 500,
      );
    }
  }
}

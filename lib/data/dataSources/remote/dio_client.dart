import 'package:deals_and_business/core/constants/api.dart';
import 'package:deals_and_business/core/error/dio_exceptions.dart';
import 'package:dio/dio.dart';

class DioClient {
  final Dio _dio = Dio();

  DioClient() {
    // Set up base options (e.g., base URL, headers)
    _dio.options.baseUrl = baseUrl;
    _dio.options.headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'X-AppApiToken': 'T0NlRzBVSE1OcWNVREhRcDAwaWgxMlVjcVh3bUlZc1o=', 

    };

    // Add interceptors for logging and error handling
    _dio.interceptors.add(LogInterceptor(
      request: true,
      responseBody: true,
      requestBody: true,
      error: true,
    ));
  }

  // Generic GET request
  Future<Response> get(String endpoint) async {
    try {
      final response = await _dio.get(endpoint);
      return response;
    } on DioException catch (e) {
      _handleDioError(e);
      rethrow; // Rethrow the error after handling
    }
  }

  // Generic POST request
  Future<Response> post(String endpoint, dynamic data) async {
    try {
      final response = await _dio.post(endpoint, data: data);
      return response;
    } on DioException catch (e) {
      _handleDioError(e);
      rethrow; // Rethrow the error after handling
    }
  }

  // Handle Dio errors
  void _handleDioError(DioException e) {
    if (e.response != null) {
      // The request was made and the server responded with a status code
      final statusCode = e.response!.statusCode;
      final responseData = e.response!.data;

      switch (statusCode) {
        case 400:
          throw BadRequestException(responseData.toString());
        case 401:
          throw UnauthorizedException(responseData.toString());
        case 403:
          throw ForbiddenException(responseData.toString());
        case 404:
          throw NotFoundException(responseData.toString());
        case 422:
          throw ValidationException(responseData.toString());
        case 500:
          throw InternalServerErrorException(responseData.toString());
        default:
          throw ApiException(
              'Received invalid status code: $statusCode', statusCode!);
      }
    } else {
      // Something happened in setting up or sending the request
      throw ApiException('No internet connection or server unreachable', 0);
    }
  }
}
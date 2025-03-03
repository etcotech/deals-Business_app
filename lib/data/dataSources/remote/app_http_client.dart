import 'dart:convert';
import 'package:http/http.dart' as http;

class HttpException implements Exception {
  final String message;
  final int statusCode;

  HttpException(this.message, this.statusCode);

  @override
  String toString() => 'HttpException: $message (Status Code: $statusCode)';
}




class ApiClient {
  final String baseUrl;

  ApiClient(this.baseUrl);

  Future<dynamic> get(String endpoint) async {
    final response = await http.get(Uri.parse('$baseUrl/$endpoint'));

    return _handleResponse(response);
  }

  Future<dynamic> post(String endpoint, {Map<String, dynamic>? body}) async {
    final response = await http.post(
      Uri.parse('$baseUrl/$endpoint'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(body),
    );

    return _handleResponse(response);
  }

  dynamic _handleResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
      case 201:
        return jsonDecode(response.body);
      case 400:
        throw HttpException('Bad Request', 400);
      case 401:
        throw HttpException('Unauthorized', 401);
      case 403:
        throw HttpException('Forbidden', 403);
      case 404:
        throw HttpException('Not Found', 404);
      case 422:
       final errors = json.decode(response.body)['errors'] as Map<String, dynamic>;
      throw HttpException('Validation Error: $errors', 422);
      case 500:
        throw HttpException('Internal Server Error', 500);
      default:
        throw HttpException('Unknown Error', response.statusCode);
    }
  }
}
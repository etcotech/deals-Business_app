import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:deals_and_business/core/constants/strings.dart';
import 'package:deals_and_business/core/error/dio_exceptions.dart';
import 'package:deals_and_business/core/error/exceptions.dart';
import 'package:deals_and_business/main.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
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
      Uri.parse('$baseUrl$endpoint'),
      headers: { 

        'Content-Type': 'application/json',
          'X-AppApiToken': 'T0NlRzBVSE1OcWNVREhRcDAwaWgxMlVjcVh3bUlZc1o=',
      'Content-Language': globalSharedPrefs.getString(Strings.currentLanguage)??'ar'
      },
      body: jsonEncode(body),
    );

    return _handleResponse(response);
  }
   Future<dynamic> postFormData(String endpoint, 
   
   
   {Map<String, dynamic>? body, 
   String? fileParam,
   List<File>? files 
   
   }) async {
     var request = http.MultipartRequest(
    'POST',
    Uri.parse('$baseUrl$endpoint'),
  );
    
     // Add text fields

  for (var key in body!.keys) {
    request.fields[key] = body[key].toString();
  }
  request.fields['email'] = globalSharedPrefs.getString(Strings.userEmail)??'';
 if (files!=null ) {
   for (var file in files) {
       final fileStream = http.ByteStream(file.openRead());
      final fileLength = await file.length();
      final multipartFile = http.MultipartFile(
       fileParam!, // Field name for the files
        fileStream,
        fileLength,
        filename: file.path.split('/').last, // File name
      );
      request.files.add(multipartFile);

   }
 }
  // Add first file

request.headers.addAll({
        'Content-Type': 'application/json',
          'X-AppApiToken': 'T0NlRzBVSE1OcWNVREhRcDAwaWgxMlVjcVh3bUlZc1o=',
      'Content-Language': globalSharedPrefs.getString(Strings.currentLanguage)??'ar'
      ,'Authorization':"Bearer ${globalSharedPrefs.getString(Strings.token)??''}"
      
      
      });

   var res = await request.send();
    
    // final response = await http.post(
    //   Uri.parse('$baseUrl/$endpoint'),
    //   headers: {'Content-Type': 'application/json'},
    //   body: jsonEncode(body),
    // );
var response = await http.Response.fromStream(res);
    return _handleResponse( response);
  }
  

  dynamic _handleResponse(http.Response response) {
    var message  = json.decode(response.body)['message'];
    switch (response.statusCode) {
      case 200:
      case 201:
        return jsonDecode(response.body);
      case 400:
      log(response.body);
        throw BadRequestException(json.decode(response.body)['message']);
      case 401:
        throw UnauthorizedException(message);
      case 403:
        throw ForbiddenException(message);
      case 404:
        throw NotFoundException(message);
      case 422:
       final errors = json.decode(response.body)['errors'] as Map<String, dynamic>;
      throw ValidationException(json.encode(errors));
      case 500:
        throw ServerException(message: message);
      default:
        throw ApiException('Unknown Error', response.statusCode);
    }
  }
}
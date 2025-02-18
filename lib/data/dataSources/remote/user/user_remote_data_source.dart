
import 'dart:convert';
import 'dart:developer';

import 'package:deals_and_business/core/constants/api.dart';
import 'package:deals_and_business/core/error/exceptions.dart';
import 'package:deals_and_business/core/error/failure.dart';
import 'package:deals_and_business/data/models/user/login_response.dart';
import 'package:http/http.dart' as http;


abstract class UserRemoteDataSource {
  Future<LoginResponseModel> signIn(String email, String password);
  // Future<AuthenticationResponseModel> signUp(SignUpParams params);
}

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final http.Client client;
  UserRemoteDataSourceImpl({required this.client});
  
  @override
  Future<LoginResponseModel> signIn(String email, String password) async{
   final response =
        await client.post(Uri.parse('$baseUrl/api/auth/login'),
            headers: {
              'Content-Type': 'application/json',
              'X-AppApiToken': 'T0NlRzBVSE1OcWNVREhRcDAwaWgxMlVjcVh3bUlZc1o='
            },
            body: json.encode({
              'email': email,
              'password': password,
            }));
    if (response.statusCode == 200) {
      log(response.body);
      return authenticationResponseModelFromJson(response.body);
    } else if (response.statusCode == 400 || response.statusCode == 401) {
      throw CredentialFailure(
        message: 'Wrong email/password'
      );
    } else {
      throw ServerException();
    }
  }




}

import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:deals_and_business/core/constants/api.dart';
import 'package:deals_and_business/core/constants/strings.dart';
import 'package:deals_and_business/core/error/exceptions.dart';
import 'package:deals_and_business/core/error/failure.dart';
import 'package:deals_and_business/data/dataSources/remote/app_http_client.dart';
import 'package:deals_and_business/data/dataSources/remote/dio_client.dart';
import 'package:deals_and_business/data/models/user/login_response.dart';
import 'package:deals_and_business/data/models/user/profile_response_model.dart';
import 'package:deals_and_business/data/models/user/signup_response_model.dart';
import 'package:deals_and_business/data/models/user/stats_response_model.dart';
import 'package:http/http.dart' as http;


abstract class UserRemoteDataSource {
  Future<LoginResponseModel> signIn(String email, String password);
    Future<String?> signOut(String? token ,  int userId);

  Future<SignupResponseModel> signUp(String userName,String email, String password);

    Future<void> forgotPassword(String email);
    Future<void> deleteAccount(String email);

  Future<ProfileResponseModel> getUserprofile(String userId,String? token,  {String? lang='ar'});

  Future<StatsResponseModel> getUserStats(String userId,
  String? token,  {String? lang='ar'});
  Future<void> updateUser(
    String token,
   { String? userId,
    File? photo, 
    String? name, 
    String? userName, 
    String? email ,
    String? countryCode,
    String? phone
    ,
    
           int? gender_id, 
           int? type_id
    
    }
  );


}

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final http.Client client;
  final ApiClient? httpClient;
  UserRemoteDataSourceImpl(this.httpClient, {required this.client});
  
  @override
  Future<LoginResponseModel> signIn(String email, String password) async{
  
  try {
    var response = await httpClient!.post('/api/auth/login', 
  body: 
  {
    
              'email': email,
              'password': password,
  }     
  
  );
  // log(response.body)
      return authenticationResponseModelFromJson(response);
  }
  
  
   catch (e) {
    rethrow;
  }
  
/*
  
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
*/

  }
  
  @override
  Future<String?> signOut(String? token, int userId) async{




  try {
      final response =
        await client.get(Uri.parse('$baseUrl$logoutApi$userId'),
            headers: {
              'Content-Type': 'application/json',
              'X-AppApiToken': 'T0NlRzBVSE1OcWNVREhRcDAwaWgxMlVjcVh3bUlZc1o=', 
              'Authorization': token!
            },
            
            );
    if (response.statusCode == 200) {
      log(response.body);
      return response.body;
    } else if (response.statusCode == 400 || response.statusCode == 401) {
      throw CredentialFailure(
        message: 'Wrong email/password'
      );
    } else {
      log(response.statusCode.toString());
      throw ServerException();
    }
  } catch (e) {
    log(e.toString());
    rethrow;
  }
  }
  
  @override
  Future<SignupResponseModel> signUp(String userName, String email, String password)async{
   
   try {
    var response = await httpClient!.post('/api/users', 
  body: 
  {
    
        
              'name':userName,
              'auth_field':'email',
              'email': email,
              'password': password,
              'password_confirmation':password,
              'accept_terms':1.toString()
            
  }     
  
  );
  // log(response.body)
      return signupResponseModelFromJson(response);
  }
  
  
   catch (e) {
    rethrow;
  }
  
   /*
   
     final response =
        await client.post(Uri.parse('$baseUrl/api/users'),
            headers: {
              'Content-Type': 'application/json',
              'X-AppApiToken': 'T0NlRzBVSE1OcWNVREhRcDAwaWgxMlVjcVh3bUlZc1o='
            },
            body: json.encode({
              'name':userName,
              'auth_field':'email',
              'email': email,
              'password': password,
              'password_confirmation':password,
              'accept_terms':1.toString()
            }));

   log(response.statusCode.toString());
    if (response.statusCode == 200) {
      log(response.body);
      return signupResponseModelFromJson(response.body);
    }

    
     else if (response.statusCode == 422 ) {
      throw CredentialFailure(
        message: 'email_already_exists'
      );
    } else {
      throw NetworkFailure();
    }
  */

  }
  
  @override
  Future<ProfileResponseModel> getUserprofile(String userId, String? token, {String? lang = 'ar'})async {
  var response2 = await httpClient!.get("$userApi/$userId?embed=null");

  return profileResponseModelFromJson(response2);
  
  
  //  try {
  //     final response =
  //       await client.get(Uri.parse('$baseUrl$userApi/$userId?embed=null'),
  //           headers: {
  //             'Content-Type': 'application/json',
  //             'X-AppApiToken': 'T0NlRzBVSE1OcWNVREhRcDAwaWgxMlVjcVh3bUlZc1o=', 
  //             'Authorization':'Bearer ${token!}', 
  //             Strings.contentLang:
  //             lang!
  //           },
            
  //           );
  //   if (response.statusCode == 200) {
  //     log(response.body);
  //     return profileResponseModelFromJson(response.body);
  //   } else if (response.statusCode == 400 || response.statusCode == 401) {
  //     throw CredentialFailure(
  //       message: 'expire,token'
  //     );
  //   } else {
  //     log(response.statusCode.toString());
  //     throw ServerException();
  //   }
  // } catch (e) {
  //   log(e.toString());
  //   throw ServerFailure();
  // }
  }
  
  @override
  Future<StatsResponseModel> getUserStats(String userId, String? token, {String? lang = 'ar'})async {


       

      final response =
        await client.get(Uri.parse('$baseUrl$userApi/$userId/stats'),
            headers: {
              'Content-Type': 'application/json',
              'X-AppApiToken': 'T0NlRzBVSE1OcWNVREhRcDAwaWgxMlVjcVh3bUlZc1o=', 
              'Authorization':'Bearer $token', 
              Strings.contentLang:
              lang!
            },
            
            );
         
    if (response.statusCode == 200) {
     
      return statsResponseModelFromJson(response.body);
    } else if (response.statusCode == 400 || response.statusCode == 401) {
      
      log('SERVER FAILUDUFSDU');
      throw CredentialFailure(
        message: 'expired,token'
      );
    } else {
      log(response.statusCode.toString());
      throw ServerException();
    }
  
  }
  
  @override
  Future<void> updateUser(String token, { String? userId,
    File? photo, 
    String? name,     String? countryCode,

    String? userName, 
    String? email ,
    String? phone,
    
           int? gender_id, 
           int? type_id})async {

Map<String,dynamic> body = {

  'auth_field':'email', 
  'email':email , 
  'name':name,
  'username':userName, 
  '_method':"PUT"

};
if (gender_id!=null) {
  body['gender_id']= gender_id.toString();
}
if (type_id!=null) {
  body['user_type_id']= type_id.toString();
}

if (phone!=null) {
          body['phone'] =phone;
         body['phone_country'] =countryCode.toString();

}

if (userName!=null) {
          body['username'] =userName;

}

log(body.toString());
var response =  await httpClient!.postFormData("/api/users/$userId", 
fileParam: 'photo',
files:

photo!=null?
 [
  photo
]:null,
method: 'POST', 
body: body, 

);

return;
 var request = http.MultipartRequest('PUT',
  Uri.parse("$baseUrl/api/users/$userId"));

if (photo!=null) {
  final fileStream = http.ByteStream(photo.openRead());
      final fileLength = await photo.length();
      final multipartFile = http.MultipartFile(
        'photo', // Field name for the files
        fileStream,
        fileLength,
        filename: photo.path.split('/').last, // File name
      );
      request.files.add(multipartFile);
}
request.headers.addAll({
         'Accept': 'application/json',
                       'Content-Type':'multipart/form-data',

              'X-AppApiToken': 'T0NlRzBVSE1OcWNVREhRcDAwaWgxMlVjcVh3bUlZc1o=', 
              'Authorization':'Bearer $token', 
              
            });
request.fields['auth_field']= 'email';
if (email!=null) {
          request.fields['email'] =email;

}
if (phone!=null) {
          request.fields['phone'] =phone;
          request.fields['phone_country'] =countryCode.toString();

}
if (userName!=null) {
          request.fields['username'] =userName;

}
if (email!=null) {
          request.fields['email'] =email;

}

log(request.fields.toString());
  var res = await request.send();
 final responseBody = await res.stream.bytesToString();
log(responseBody);
log(res.statusCode.toString());


    if (res.statusCode == 200) {
      // log(response.body);
      return json.decode(responseBody);
    }
    if (res.statusCode==422) {
      throw ServerException(message: json.decode(responseBody)['errors'].toString());

    }
    
     else if (res.statusCode == 400 || res.statusCode == 401) {
      throw CredentialFailure(
        message: 'token'
      );
    } else {
      throw ServerException(message: res.reasonPhrase);
    }


  }
  
  @override
  Future<void> forgotPassword(String email)async {
    var response =await httpClient!.post('/api/auth/password/email',

    body: {
      'email':email, 
      'auth_field':'email'
    }
    );
    log(response.toString());
    // return;
  }
  
  @override
  Future<void> deleteAccount(String userId)async {
   var response =await httpClient!.delete('/api/users/${userId}',

    body: {
     
    }
    );
    log(response.toString());
    //
  }




}
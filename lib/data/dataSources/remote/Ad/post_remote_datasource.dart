import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:deals_and_business/core/constants/api.dart';
import 'package:deals_and_business/core/constants/strings.dart';
import 'package:deals_and_business/core/error/exceptions.dart';
import 'package:deals_and_business/core/error/failure.dart';
import 'package:deals_and_business/data/dataSources/remote/app_http_client.dart';
import 'package:deals_and_business/data/models/post/favorite_post_list_response_model.dart';
import 'package:deals_and_business/data/models/post/message_list_response_model.dart';
import 'package:deals_and_business/data/models/post/new_post_model.dart';
import 'package:deals_and_business/data/models/post/post_details_response_model.dart';
import 'package:deals_and_business/data/models/post/post_list_response_model.dart';
import 'package:deals_and_business/data/models/post/thread_message_list_response.dart';
import 'package:deals_and_business/data/models/post/user_post_list_response_model.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart'; // For MediaType

abstract class PostRemoteDatasource {
    Future<PostListResponseModel> getPosts(String token , {String? lang ='ar' , int currentPage=1});
    Future<UserPostListResponseModel> getUserPosts(
      
      String userId,
      String token , {String? lang ='ar'});

        Future<PostListResponseModel> getMorePosts(
         String url,
         {String? lang ='ar'});

    Future<Map<String,dynamic>> addPost(NewPostModel newPostModel, String token);
    Future<PostDetailsResponseModel> getPost(int postId,String token , {String? lang ='ar'});
    Future<String> addPostToFavourite(String postId,String token, {String lang='ar'} );
    Future<FavoritePostListResponseModel> getFavouritePosts(String token , {String? lang ='ar'});
    Future<void> reportPost(String postId, 
    String reportType, 
String email,

    String msg,
    String token
     , {String? lang ='ar'});

      Future<void> deletePost(String postId, 
   );
  Future<void> sendMessage(String postId, 
  String name,
String email,

    String msg,
    String token
     , {String? lang ='ar'});
  Future<void> sendMessageToManagement(String firstName, 
  String lastName,
String email,

    String msg,

    String  countryCode , 
    String countryName , 
    
    String token
     , {String? lang ='ar'});

         Future<MessageListResponseModel> getMessages(String token ,
          {String? lang ='ar'});
    Future<ThreadMessageListResponse> getThreadMessages(
      String threadId,
      String token , {String? lang ='ar'});

}

class PostRemoteDatasourceImpl implements PostRemoteDatasource {
  final http.Client client;
  final ApiClient? apiClient;
  PostRemoteDatasourceImpl({
     required this.apiClient,
    
    required this.client});
  
  @override
  Future<PostListResponseModel> getPosts(String token, {String? lang ='ar' , int currentPage=1}) async{


    //&belongLoggedUser=1
  var response2 = await apiClient!.get("$postsApi?op=search,latest&embed=user,category,parent,postType,city,currency,savedByLoggedUser,pictures,payment,package&sort=created_at&perPage=10&page=$currentPage");
 
 log(response2.runtimeType.toString());
  return postListResponseModelFromJson(response2);
  //  final response =
  //       await client.get(Uri.parse('$baseUrl$postsApi?op=latest&archived=1&embed=null&belongLoggedUser=1&sort=created_at&perPage=10'),
  //           headers: {
  //             'Content-Type': 'application/json',
  //             'Authorization': 'Bearer $token',
  //             'X-AppApiToken': 'T0NlRzBVSE1OcWNVREhRcDAwaWgxMlVjcVh3bUlZc1o=', 
  //             Strings.contentLang: lang.toString()
  //           },
          
            
  //           );
  //   if (response.statusCode == 200) {
  //     log(response.body);
  //     return postListResponseModelFromJson(response.body);
  //   } else if (response.statusCode == 400 || response.statusCode == 401) {
  //     throw CredentialFailure(
  //       message: 'token'
  //     );
  //   } else {
  //     throw ServerException(message: 'server');
  //   }
  }
  
  @override
  Future<Map<String, dynamic>> addPost(NewPostModel newPostModel , String token,)async {
    // final response =
        // await client.get(Uri.parse('$baseUrl$postsApi'),
        //     headers: {
        //       'Content-Type': 'application/json',
        //       'Authorization': token,
        //       'X-AppApiToken': 'T0NlRzBVSE1OcWNVREhRcDAwaWgxMlVjcVh3bUlZc1o=', 
        //     },
          
            
        //     );

var response= await apiClient!.postFormData(postsApi,
body: newPostModel.toJson(), 
fileParam: 'pictures[]' , 
files: newPostModel.pictures
 );



// var request = http.MultipartRequest('POST',
//  Uri.parse(baseUrl+ postsApi));

     
//         for (var file in newPostModel.pictures!) {
//       final fileStream = http.ByteStream(file.openRead());
//       final fileLength = await file.length();
//       final multipartFile = http.MultipartFile(
//         'pictures[]', // Field name for the files
//         fileStream,
//         fileLength,
//         filename: file.path.split('/').last, // File name
//       );
//       // http.MultipartFile.
//   //     var multipartFile = await http.MultipartFile.fromPath(
//   //   'pictures', // Field name in the form
//   //  file.path, // Path to the file
//   //   // contentType: MediaType('image', ''), // Optional: specify the content type
//   // );
//       request.files.add(multipartFile);
//     }

//         request.fields['category_id'] = newPostModel.category_id.toString();
//         request.fields['title'] = newPostModel.title.toString();
//         request.fields['description'] = newPostModel.description.toString();
//         request.fields['contact_name'] = newPostModel.contact_name.toString();
//         // request.fields['auth_field'] = 'email';
//         request.fields['email'] = newPostModel.email.toString();
// // request.fields['country_code']= 'US';
//         request.fields['city_id'] = newPostModel.city_id.toString();
//         request.fields['accept_terms'] = newPostModel.accept_terms!.toString();

                 
//         request.fields['price'] =newPostModel.price.toString();
// request.headers.addAll({
//          'Accept': 'application/json',
//          'Content-Type':'multipart/form-data',
//           Strings.contentLang: 'en',
//               'Authorization': token,
//               'X-AppApiToken': 'T0NlRzBVSE1OcWNVREhRcDAwaWgxMlVjcVh3bUlZc1o=',
// });

//   var res = await request.send();

//  final responseBody = await res.stream.bytesToString();
// log(responseBody);



  return response;
  }
  
  @override
  Future<PostDetailsResponseModel> getPost(int postId, String token, {String? lang = 'ar'})async {
    var response  = await apiClient!.get("$postsApi/$postId?detailed=true&embed=user,category,parent,postType,city,currency,savedByLoggedUser,pictures,payment,package,fieldsValues");
    return postDetailsResponseFromJson(response);
    
  
  }
  
  @override
  Future<String> addPostToFavourite(String postId, String token ,{String lang='ar'}) async{
         
         try{
           final response =
        await client.post(Uri.parse('$baseUrl$savedPostAPi'),
            headers: {
              'Content-Type': 'application/json',
              'Accept': 'application/json',
              'Authorization': 'Bearer $token',
              'Content-Language':lang,
              'X-AppApiToken': 
              'T0NlRzBVSE1OcWNVREhRcDAwaWgxMlVjcVh3bUlZc1o=', 
            },
          body: json.encode({
            "post_id":postId
          })
            
            );
            log(response.body);
    if (response.statusCode == 200) {
      log(response.body);
      return response.body;
    }
    
     else if (response.statusCode == 400 || response.statusCode == 401) {
      throw TokenExpiredException(
      
      );
    } else {
      throw ServerException();
    }
    } 
    on SocketException{
      throw SocketException('socket');
    }
    catch (e) {
      rethrow;
    }
  }
  
  @override
  Future<FavoritePostListResponseModel> getFavouritePosts(String token, {String? lang = 'ar'})async {
     var response2 = await apiClient!.get("$savedPostAPi?embed=null&sort=created_at&perPage=20");
    return favPostListResponseModelFromJson(response2);
     
     
    //    final response =
    //     await client.get(Uri.parse('$baseUrl$savedPostAPi''?embed=null&sort=created_at&perPage=20'),
    //         headers: {
    //           'Content-Type': 'application/json',
    //           'Authorization':'Bearer $token' ,
    //           'Content-Language':lang!,
    //           'X-AppApiToken': 'T0NlRzBVSE1OcWNVREhRcDAwaWgxMlVjcVh3bUlZc1o=', 
    //           Strings.contentLang: lang
    //         },
          
            
    //         );
    //         log(token);
    // if (response.statusCode == 200) {
    //   log(response.body);
    //   return favPostListResponseModelFromJson(response.body);
    // }
    
    //  else if (response.statusCode == 400 || response.statusCode == 401) {
    //   throw CredentialFailure(
    //   message: 'token'
    //   );
    // } else {
    //   throw ServerException();
    // }
   
  }
  
  @override
  Future<void> reportPost(String postId, 
  
    String reportType, 
String email,
    String msg
  ,
  String token,
  {String? lang = 'ar'})async {
       
var response2 = await apiClient!.post("$postsApi/$postId/report", 

body: {
              'report_type_id':reportType , 
              'email':email, 
              'message':msg
            }
);

return;
      final response =
        await client.post(Uri.parse('$baseUrl$postsApi/$postId/report'),
            headers: {
              'Content-Type': 'application/json',
              'X-AppApiToken': 'T0NlRzBVSE1OcWNVREhRcDAwaWgxMlVjcVh3bUlZc1o=', 
              'Authorization':'Bearer $token', 
              Strings.contentLang:
              lang!
            },

            body: json.encode({
              'report_type_id':reportType , 
              'email':email, 
              'message':msg
            })
            );

            log({
              'report_type_id':reportType , 
              'email':email, 
              'message':msg
            }.toString());
         log(response.body);
    if (response.statusCode == 200) {
     
      return ;
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
  Future<void> sendMessage(String postId, String name, String email, String msg, String token, {String? lang = 'ar'}) async{
   
   var response2 = await apiClient!.postFormData("/api/threads", 
   
   body: {
'auth_field': 'email',
      'email': email,
         'body': msg,
      'post_id':  postId,
          'name': name


   }
   );
   return;
   var request = http.MultipartRequest(
    'POST',
    Uri.parse('$baseUrl/api/threads'),
  );


     request.fields['auth_field'] = 'email';
       request.fields['email'] = email;
          request.fields['body'] = msg;
       request.fields['post_id'] = postId;
            request.fields['name'] = name;



request.headers.addAll({
              'Content-Type': 'application/json',
              'X-AppApiToken': 'T0NlRzBVSE1OcWNVREhRcDAwaWgxMlVjcVh3bUlZc1o=', 
              'Authorization':'Bearer $token', 
              Strings.contentLang:
              lang!
            });
   
     var response = await request.send();

  
    if (response.statusCode == 200 || response.statusCode == 201) {
     
      return ;
    } else if (response.statusCode == 400 || response.statusCode == 401) {
      
      log('SERVER FAILUDUFSDU');
      throw CredentialFailure(
        message: 'expired,token'
      );
    } else {
 final responseBody = await response.stream.bytesToString();
log(responseBody);

      throw ServerException();
    }
  }
  
  @override
  Future<MessageListResponseModel> getMessages(String token, {String? lang = 'ar'})async {
   var response2 = await apiClient!.get("/api/threads");
    return messageListResponseModelFromJson(response2);
   
   
    // final response =
    //     await client.get(Uri.parse('$baseUrl/api/threads'),
    //         headers: {
    //           'Content-Type': 'application/json',
    //           'Authorization': 'Bearer $token',
    //           'X-AppApiToken': 'T0NlRzBVSE1OcWNVREhRcDAwaWgxMlVjcVh3bUlZc1o=', 
    //           Strings.contentLang: lang!, 
    //         },
          
            
    //         );
    // if (response.statusCode == 200) {
    //   return messageListResponseModelFromJson(response.body);
    // } else if ( response.statusCode == 401) {
    //   throw CredentialFailure(
    //     message: 'token'
    //   );
    // } else {
    //   throw ServerException(message: 'server');
    // }
  }
  
  @override
  Future<ThreadMessageListResponse> getThreadMessages(String threadId, String token, {String? lang = 'ar'}) async{
   var response2 = await apiClient!.get("/api/threads/$threadId/messages?embed=user,messages&sort=created_at&perPage=10");
    return threadMessagesListResponseModelFromJson(response2);
  
  }
  
  @override
  Future<void> sendMessageToManagement(String firstName, String lastName, String email, String msg, String countryCode, String countryName, String token, {String? lang = 'ar'})async {
   var response2 = await apiClient!.post("/api/contact", 

body: {
              'first_name':firstName ,
              'last_name':lastName , 
              'country_code':countryCode , 
              'country_name':countryName, 
              'email':email, 
              'message':msg, 
              
            }


);

return;
  }
  
  @override
  Future<PostListResponseModel> getMorePosts(String url, {String? lang = 'ar'})async {
  var response2 = await apiClient!.getPaginate(url);

  return postListResponseModelFromJson(response2);
  }
  
  @override
  Future<UserPostListResponseModel> getUserPosts(String userId, String token, {String? lang = 'ar'})async {
  //&belongLoggedUser=1
  var response2 = await apiClient!.get("$userApi/$userId/posts?op=search&detailed=true&embed=user,category,parent,postType,city,currency,savedByLoggedUser,pictures,payment,package&sort=created_at");
 
 
  return userPostListResponseModelFromJson(response2 );
  }
  
  @override
  Future<void> deletePost(String postId) async{
    var response2 = await apiClient!.delete("/api/posts/$postId", 
    body: {}
    );
 return;
  }



}
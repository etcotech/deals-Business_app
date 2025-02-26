import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:deals_and_business/core/constants/api.dart';
import 'package:deals_and_business/core/constants/strings.dart';
import 'package:deals_and_business/core/error/exceptions.dart';
import 'package:deals_and_business/data/models/post/new_post_model.dart';
import 'package:deals_and_business/data/models/post/post_details_response_model.dart';
import 'package:deals_and_business/data/models/post/post_list_response_model.dart';
import 'package:http/http.dart' as http;

abstract class PostRemoteDatasource {
    Future<PostListResponseModel> getPosts(String token , {String? lang ='ar'});
    Future<Map<String,dynamic>> addPost(NewPostModel newPostModel, String token);
    Future<PostDetailsResponseModel> getPost(int postId,String token , {String? lang ='ar'});

}

class PostRemoteDatasourceImpl implements PostRemoteDatasource {
  final http.Client client;
  PostRemoteDatasourceImpl({required this.client});
  
  @override
  Future<PostListResponseModel> getPosts(String token, {String? lang ='ar'}) async{
   final response =
        await client.get(Uri.parse('$baseUrl$postsApi?op=search&archived=1&embed=null&sort=created_at&perPage=10'),
            headers: {
              'Content-Type': 'application/json',
              'Authorization': token,
              'X-AppApiToken': 'T0NlRzBVSE1OcWNVREhRcDAwaWgxMlVjcVh3bUlZc1o=', 
              Strings.contentLang: lang!
            },
          
            
            );
    if (response.statusCode == 200) {
      log(response.body);
      return postListResponseModelFromJson(response.body);
    } else if (response.statusCode == 400 || response.statusCode == 401) {
      throw TokenExpiredException(
      );
    } else {
      throw ServerException();
    }
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

var request = http.MultipartRequest('POST', Uri.parse(baseUrl+ postsApi));
        

        
          

  request.files.addAll(
        

        newPostModel.pictures!.map((file)=>
        http.MultipartFile(
        

        
          

      'pictures',
        

        
              File(file.path).readAsBytes().asStream(),
        

        
          

      File(file.path).lengthSync(),
        

        
          

      filename: file.path.split("/").last  

    )
        
        ).toList()
          

    
        

        
          

  );
        

        request.fields['category_id'] = newPostModel.category_id!;
                request.fields['title'] = newPostModel.title!;
        request.fields['description'] = newPostModel.description!;
        request.fields['contact_name'] = newPostModel.contact_name!;
        request.fields['city_id'] = newPostModel.city_id!;
        request.fields['accept_terms'] = newPostModel.accept_terms!.toString();

                 
        request.fields['price'] = newPostModel.price!.toString();


  var res = await request.send();





    if (res.statusCode == 200) {
      // log(response.body);
      return json.decode(res.headers.toString());
    } else if (res.statusCode == 400 || res.statusCode == 401) {
      throw TokenExpiredException(
      );
    } else {
      throw ServerException();
    }
  }
  
  @override
  Future<PostDetailsResponseModel> getPost(int postId, String token, {String? lang = 'ar'})async {
    try {
       final response =
        await client.get(Uri.parse('$baseUrl$postsApi/$postId'),
            headers: {
              'Content-Type': 'application/json',
              'Authorization': token,
              'X-AppApiToken': 'T0NlRzBVSE1OcWNVREhRcDAwaWgxMlVjcVh3bUlZc1o=', 
              Strings.contentLang: lang!
            },
          
            
            );
    if (response.statusCode == 200) {
      log(response.body);
      return postDetailsResponseFromJson(response.body);
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



}
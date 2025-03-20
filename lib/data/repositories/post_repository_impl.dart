import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:deals_and_business/core/error/dio_exceptions.dart';
import 'package:deals_and_business/core/error/failure.dart';
import 'package:deals_and_business/core/network/network_info.dart';
import 'package:deals_and_business/data/dataSources/local/locale_local_data_source.dart';
import 'package:deals_and_business/data/dataSources/local/user/user_local_data_source.dart';
import 'package:deals_and_business/data/dataSources/remote/Ad/post_remote_datasource.dart';
import 'package:deals_and_business/data/models/post/favorite_post_list_response_model.dart';
import 'package:deals_and_business/data/models/post/message_list_response_model.dart';
import 'package:deals_and_business/data/models/post/new_post_model.dart';
import 'package:deals_and_business/data/models/post/post_details_response_model.dart';
import 'package:deals_and_business/data/models/post/post_list_response_model.dart';
import 'package:deals_and_business/data/models/post/thread_message_list_response.dart';
import 'package:deals_and_business/data/models/post/user_post_list_response_model.dart';
import 'package:deals_and_business/domain/repositories/post_repository.dart';
typedef _PostDetailsDataSource = Future<PostDetailsResponseModel> Function();
typedef _AddToFavouriteDataSource = Future<String> Function();
typedef _FavoritePostChooser = Future<FavoritePostListResponseModel> Function();
typedef _UserPostsDataSourceChooser = Future<UserPostListResponseModel> Function();

typedef _DataSourceChooser = Future<PostListResponseModel> Function();
typedef _AddPost = Future<Map<String ,dynamic>> Function();

class PostRepositoryImpl implements PostRepository {
  final PostRemoteDatasource postRemoteDatasource;
  final UserLocalDataSource localDataSource;
  final LocaleLocalDataSource localeLocalDatasource;
  final NetworkInfo networkInfo;

  PostRepositoryImpl({
    required this.postRemoteDatasource,
    required this.localDataSource,
    required this.localeLocalDatasource,
    required this.networkInfo,
  });

  @override
  Future<Either<ApiException, PostListResponseModel>> getPosts() async{
    return  await _postListProvider((){

        return    postRemoteDatasource.getPosts(
          localDataSource.getToken().toString(), 
        
        lang: localeLocalDatasource.getCurrentLocale()
        );
    });
  }


  Future<Either<Failure, FavoritePostListResponseModel>> _favoritePostListProvider(
   _FavoritePostChooser getDataSource,
      ) async {
    // if (await networkInfo.isConnected) {
      try {
        final remoteResponse = await getDataSource();
        // localDataSource.saveToken(remoteResponse.token);
        // localDataSource.saveUser(remoteResponse.user);
       
        return Right(remoteResponse);
      } 
      
      on SocketException{
        return Left(NetworkFailure(message: 'network'));
      }
      on CredentialFailure{
                return Left(CredentialFailure(message: 'token'));

      }
      
      on Failure catch (failure) {
        return Left(failure);
      }
    // } else {
    //   return Left(NetworkFailure());
    // }
  }
Future<Either<ApiException, PostListResponseModel>> _postListProvider(
   _DataSourceChooser getDataSource,
      ) async {
    // if (await networkInfo.isConnected) {
      try {
        final remoteResponse = await getDataSource();
        // localDataSource.saveToken(remoteResponse.token);
        // localDataSource.saveUser(remoteResponse.user);
       
        return Right(remoteResponse);
      } 
      
        on ApiException catch (failure) {
        return Left(failure);
      }
    // } else {
    //   return Left(NetworkFailure());
    // }
  }
Future<Either<ApiException, UserPostListResponseModel>> _userPostListProvider(
   _UserPostsDataSourceChooser getDataSource,
      ) async {
    // if (await networkInfo.isConnected) {
      try {
        final remoteResponse = await getDataSource();
        // localDataSource.saveToken(remoteResponse.token);
        // localDataSource.saveUser(remoteResponse.user);
       
        return Right(remoteResponse);
      } 
      
        on ApiException catch (failure) {
        return Left(failure);
      }
    // } else {
    //   return Left(NetworkFailure());
    // }
  }


Future<Either<ApiException, Map<String,dynamic>>> _addPostProvider(
   _AddPost getDataSource,
      ) async {
    // if (await networkInfo.isConnected) {
      try {
        final remoteResponse = await getDataSource();
        // localDataSource.saveToken(remoteResponse.token);
        // localDataSource.saveUser(remoteResponse.user);
       
        return Right(remoteResponse);
      } 
       
   
      
      on ApiException catch (failure) {
        return Left(failure);
      }
    
  }
 
 Future<Either<ApiException, PostDetailsResponseModel>> _getPostProvider(
   _PostDetailsDataSource getDataSource,
      ) async {
    // if (await networkInfo.isConnected) {
      try {
        final remoteResponse = await getDataSource();
        // localDataSource.saveToken(remoteResponse.token);
        // localDataSource.saveUser(remoteResponse.user);
       
        return Right(remoteResponse);
      }
       on ApiException catch (failure) {
        return Left(failure);
      }
    // } else {
    //   return Left(NetworkFailure());
    // }
  }
 Future<Either<Failure, String>> _addPostToFavouriteProvider(
   _AddToFavouriteDataSource getDataSource,
      ) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteResponse = await getDataSource();
        // localDataSource.saveToken(remoteResponse.token);
        // localDataSource.saveUser(remoteResponse.user);
       
        return Right(remoteResponse);
      } on Failure catch (failure) {
        return Left(failure);
      }
    } else {
      return Left(NetworkFailure());
    }
  }
  @override
  Future<Either<ApiException, Map<String, dynamic>>> addPost(NewPostModel newPostModel) async{
    return  await _addPostProvider((){

        return    postRemoteDatasource.addPost(newPostModel, localDataSource.getToken()??'');
    });
  }
  
  @override
  Future<Either<ApiException, PostDetailsResponseModel>> getPost(String token, String postId)async {
 return  await _getPostProvider((){

        return    postRemoteDatasource.getPost(int.parse(postId), localDataSource.getToken()??'');
    });
  }
  
  @override
  Future<Either<Failure, String>> addPostFavourite(String token, String postId) async{
    return  await _addPostToFavouriteProvider((){

        return    postRemoteDatasource.addPostToFavourite(postId, 
        localDataSource.getToken()??'' , lang: localeLocalDatasource.getCurrentLocale());
    });
  }
  
  @override
  Future<Either<Failure, FavoritePostListResponseModel>> getFavouritePosts()async {
    return  await _favoritePostListProvider((){

        return    postRemoteDatasource.getFavouritePosts(localDataSource.getToken().toString(), 
        
        lang: localeLocalDatasource.getCurrentLocale()
        );
    });
  }
  
  @override
  Future<Either<ApiException, void>> reportPost(String postId, String reportType, 
  String email,

  String msg)async {
        try {
        final remoteResponse = await postRemoteDatasource.reportPost(postId, 
        reportType, email,msg,
        
         localDataSource.getToken()??'');
        // localDataSource.saveToken(remoteResponse.token);
        // localDataSource.saveUser(remoteResponse.user);
       
        return Right(remoteResponse);
      } 
        on ApiException catch (failure) {
        return Left(failure);
      }
    
  }
  
  @override
  Future<Either<ApiException, void>> sendMessage(String postId, String name, String email, String msg)async {
      try {
        final remoteResponse = await postRemoteDatasource.
        sendMessage(postId, 
        name, email,msg,
        
         localDataSource.getToken()??'');
        // localDataSource.saveToken(remoteResponse.token);
        // localDataSource.saveUser(remoteResponse.user);
       
        return Right(remoteResponse);
      } 
       on ApiException catch (failure) {
        return Left(failure);
      }
  }

  @override
  Future<Either<ApiException, MessageListResponseModel>> getMessages()async {
   try {
        final remoteResponse = await postRemoteDatasource.
        getMessages(

localDataSource.getToken()??'', 
lang: localeLocalDatasource.getCurrentLocale()

        );
        // localDataSource.saveToken(remoteResponse.token);
        // localDataSource.saveUser(remoteResponse.user);
       
        return Right(remoteResponse);
      } 
     on ApiException catch (failure) {
        return Left(failure);
      }
  }

  @override
  Future<Either<Failure, ThreadMessageListResponse>> getThreadMessages(String threadId)async {
   try {
        final remoteResponse = await postRemoteDatasource.
        getThreadMessages(threadId, 
       
        
         localDataSource.getToken()??'');
        // localDataSource.saveToken(remoteResponse.token);
        // localDataSource.saveUser(remoteResponse.user);
       
        return Right(remoteResponse);
      } 
          on TimeoutException{
        return Left(TimeoutFailure());
  }
  on SocketException{
    log('SPOCLe');
        return Left(NetworkFailure());
  }
   
      
      on Failure catch (failure) {
        return Left(failure);
      }
  }
  
  @override
  Future<Either<ApiException, void>> sendMessageToManagement({String? firstName, String? lastName,
   String? email, String? msg, String? countryCode, String? countryName})async {
    try {
        final remoteResponse = await postRemoteDatasource.sendMessageToManagement(
          
          firstName!, 
        lastName!, 
        email!, msg!, countryCode!, countryName!,
        
         localDataSource.getToken()??'');
        // localDataSource.saveToken(remoteResponse.token);
        // localDataSource.saveUser(remoteResponse.user);
       
        return Right(remoteResponse);
      } 
        on ApiException catch (failure) {
        return Left(failure);
      }
  }
  
  @override
  Future<Either<ApiException, PostListResponseModel>> getMorePosts(String url) async{
   return  await _postListProvider((){

        return    postRemoteDatasource.getMorePosts(
          url, 
        
        lang: localeLocalDatasource.getCurrentLocale()
        );
    });
  }
  
  @override
  Future<Either<ApiException, UserPostListResponseModel>> getUserPosts(String userId) async{
 
  return  await _userPostListProvider((){

        return    postRemoteDatasource.getUserPosts(
          userId,
          localDataSource.getToken().toString(), 
        
        lang: localeLocalDatasource.getCurrentLocale()
        );
    });
 

  }



}
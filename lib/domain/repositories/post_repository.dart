import 'package:dartz/dartz.dart';
import 'package:deals_and_business/core/error/dio_exceptions.dart';
import 'package:deals_and_business/core/error/failure.dart';
import 'package:deals_and_business/data/models/post/favorite_post_list_response_model.dart';
import 'package:deals_and_business/data/models/post/message_list_response_model.dart';
import 'package:deals_and_business/data/models/post/new_post_model.dart';
import 'package:deals_and_business/data/models/post/post_details_response_model.dart';
import 'package:deals_and_business/data/models/post/post_list_response_model.dart';
import 'package:deals_and_business/data/models/post/thread_message_list_response.dart';
import 'package:deals_and_business/data/models/post/user_post_list_response_model.dart';
import 'package:deals_and_business/features/posts/views/add_post_screen.dart';

abstract class PostRepository {
  Future<Either<ApiException, PostListResponseModel>> getPosts( {int currentPage=1});
    Future<Either<ApiException, UserPostListResponseModel>> getUserPosts(String userId);

  Future<Either<ApiException, PostListResponseModel>> getMorePosts(String url);

    Future<Either<ApiException, FavoritePostListResponseModel>> getFavouritePosts();

  Future<Either<ApiException, Map<String,dynamic>>> addPost(
    NewPostModel newPostModel 
  );
  Future<Either<ApiException, PostDetailsResponseModel>> getPost(
    String token,
    String postId
  );
Future<Either<Failure, String>> addPostFavourite(
    String token,
    String postId
  );

  Future<Either<ApiException, void>> reportPost(
   String postId, 
  
    String reportType, 
String email,

    String msg
  ,
  );
 Future<Either<ApiException, void>> deletePost(
   String postId, 
  
  
  
  );
  Future<Either<ApiException, void>> sendMessage(
  String postId, 
  
    String name, 
String email,
    String msg
  ,
  );
  Future<Either<ApiException, void>> sendMessageToManagement({
    String firstName, 
  String lastName,
String email,

    String msg,

    String  countryCode , 
    String countryName , 
  });
  // Future<Either<Failure, NoParams>> signOut();
  // Future<Either<Failure, User>> getCachedUser();

  Future<Either<ApiException, MessageListResponseModel>> getMessages();
  Future<Either<Failure, ThreadMessageListResponse>> getThreadMessages(String threadId);

}
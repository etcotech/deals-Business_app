import 'package:dartz/dartz.dart';
import 'package:deals_and_business/core/error/failure.dart';
import 'package:deals_and_business/data/models/post/favorite_post_list_response_model.dart';
import 'package:deals_and_business/data/models/post/message_list_response_model.dart';
import 'package:deals_and_business/data/models/post/new_post_model.dart';
import 'package:deals_and_business/data/models/post/post_details_response_model.dart';
import 'package:deals_and_business/data/models/post/post_list_response_model.dart';
import 'package:deals_and_business/data/models/post/thread_message_list_response.dart';
import 'package:deals_and_business/features/posts/views/add_post_screen.dart';

abstract class PostRepository {
  Future<Either<Failure, PostListResponseModel>> getPosts();

    Future<Either<Failure, FavoritePostListResponseModel>> getFavouritePosts();

  Future<Either<Failure, Map<String,dynamic>>> addPost(
    NewPostModel new_post_model 
  );
  Future<Either<Failure, PostDetailsResponseModel>> getPost(
    String token,
    String postId
  );
Future<Either<Failure, String>> addPostFavourite(
    String token,
    String postId
  );

  Future<Either<Failure, void>> reportPost(
   String postId, 
  
    String reportType, 
String email,

    String msg
  ,
  );

  Future<Either<Failure, void>> sendMessage(
  String postId, 
  
    String name, 
String email,
    String msg
  ,
  );
  // Future<Either<Failure, User>> signUp(SignUpParams params);
  // Future<Either<Failure, NoParams>> signOut();
  // Future<Either<Failure, User>> getCachedUser();

  Future<Either<Failure, MessageListResponseModel>> getMessages();
  Future<Either<Failure, ThreadMessageListResponse>> getThreadMessages(String threadId);

}
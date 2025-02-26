import 'package:dartz/dartz.dart';
import 'package:deals_and_business/core/error/failure.dart';
import 'package:deals_and_business/core/network/network_info.dart';
import 'package:deals_and_business/data/dataSources/local/locale_local_data_source.dart';
import 'package:deals_and_business/data/dataSources/local/user/user_local_data_source.dart';
import 'package:deals_and_business/data/dataSources/remote/Ad/post_remote_datasource.dart';
import 'package:deals_and_business/data/models/post/new_post_model.dart';
import 'package:deals_and_business/data/models/post/post_details_response_model.dart';
import 'package:deals_and_business/data/models/post/post_list_response_model.dart';
import 'package:deals_and_business/domain/repositories/post_repository.dart';
typedef _PostDetailsDataSource = Future<PostDetailsResponseModel> Function();

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
  Future<Either<Failure, PostListResponseModel>> getPosts() async{
    return  await _postListProvider((){

        return    postRemoteDatasource.getPosts(localDataSource.getToken()!.toString(), 
        
        lang: localeLocalDatasource.getCurrentLocale()
        );
    });
  }


  
Future<Either<Failure, PostListResponseModel>> _postListProvider(
   _DataSourceChooser getDataSource,
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
Future<Either<Failure, Map<String,dynamic>>> _addPostProvider(
   _AddPost getDataSource,
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
 
 Future<Either<Failure, PostDetailsResponseModel>> _getPostProvider(
   _PostDetailsDataSource getDataSource,
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
  Future<Either<Failure, Map<String, dynamic>>> addPost(NewPostModel new_post_model) async{
    return  await _addPostProvider((){

        return    postRemoteDatasource.addPost(new_post_model, localDataSource.getToken()??'');
    });
  }
  
  @override
  Future<Either<Failure, PostDetailsResponseModel>> getPost(String token, String postId)async {
 return  await _getPostProvider((){

        return    postRemoteDatasource.getPost(int.parse(postId), localDataSource.getToken()??'');
    });
  }



}
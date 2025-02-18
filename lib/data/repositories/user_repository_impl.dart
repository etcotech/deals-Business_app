
import 'package:dartz/dartz.dart';
import 'package:deals_and_business/core/error/failure.dart';
import 'package:deals_and_business/core/network/network_info.dart';
import 'package:deals_and_business/data/dataSources/local/user/user_local_data_source.dart';
import 'package:deals_and_business/data/dataSources/remote/user/user_remote_data_source.dart';
import 'package:deals_and_business/data/models/user/login_response.dart';
import 'package:deals_and_business/domain/repositories/user_repository.dart';


typedef _DataSourceChooser = Future<LoginResponseModel> Function();
class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource remoteDataSource;
  final UserLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  UserRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, LoginResponseModel>> signIn(String email,  String password) async {
    return await _authenticate(() {
      return remoteDataSource.signIn(email,password);
    });
  }

  // @override
  // Future<Either<Failure, User>> signUp(params) async {
  //   return await _authenticate(() {
  //     return remoteDataSource.signUp(params);
  //   });
  // }

  // @override
  // Future<Either<Failure, User>> getCachedUser() async {
  //   try {
  //     final user = await localDataSource.getUser();
  //     return Right(user);
  //   } on CacheFailure {
  //     return Left(CacheFailure());
  //   }
  // }

  // @override
  // Future<Either<Failure, NoParams>> signOut() async {
  //   try {
  //     await localDataSource.clearCache();
  //     return Right(NoParams());
  //   } on CacheFailure {
  //     return Left(CacheFailure());
  //   }
  // }

  // Future<Either<Failure, User>> _authenticate(
  //     _DataSourceChooser getDataSource,
  //     ) async {
  //   if (await networkInfo.isConnected) {
  //     try {
  //       final remoteResponse = await getDataSource();
  //       localDataSource.saveToken(remoteResponse.token);
  //       localDataSource.saveUser(remoteResponse.user);
  //       return Right(remoteResponse.user);
  //     } on Failure catch (failure) {
  //       return Left(failure);
  //     }
  //   } else {
  //     return Left(NetworkFailure());
  //   }
  // }

  Future<Either<Failure, LoginResponseModel>> _authenticate(
   _DataSourceChooser getDataSource,
      ) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteResponse = await getDataSource();
        // localDataSource.saveToken(remoteResponse.token);
        // localDataSource.saveUser(remoteResponse.user);
        localDataSource.saveLoggedInStatus(true);
        
        return Right(remoteResponse);
      } on Failure catch (failure) {
        return Left(failure);
      }
    } else {
      return Left(NetworkFailure());
    }
  }

}
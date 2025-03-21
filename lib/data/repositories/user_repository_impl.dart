
import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:deals_and_business/core/error/dio_exceptions.dart';
import 'package:deals_and_business/core/error/failure.dart';
import 'package:deals_and_business/core/network/network_info.dart';
import 'package:deals_and_business/data/dataSources/local/locale_local_data_source.dart';
import 'package:deals_and_business/data/dataSources/local/user/user_local_data_source.dart';
import 'package:deals_and_business/data/dataSources/remote/user/user_remote_data_source.dart';
import 'package:deals_and_business/data/models/user/login_response.dart';
import 'package:deals_and_business/data/models/user/profile_response_model.dart';
import 'package:deals_and_business/data/models/user/signup_response_model.dart';
import 'package:deals_and_business/data/models/user/stats_response_model.dart';
import 'package:deals_and_business/domain/repositories/user_repository.dart';

typedef _SignupDataSourceChooser = Future<SignupResponseModel> Function();

typedef _DataSourceChooser = Future<LoginResponseModel> Function();
class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource remoteDataSource;
  final UserLocalDataSource localDataSource;
  final LocaleLocalDataSource? localeLocalDataSource;
  final NetworkInfo networkInfo;

  UserRepositoryImpl({
    required this.remoteDataSource,
        required this.localeLocalDataSource,

    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<ApiException, LoginResponseModel>> signIn(   
String email,  String password) async {
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

  Future<Either<ApiException, LoginResponseModel>> _authenticate(
   _DataSourceChooser getDataSource,
      ) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteResponse = await getDataSource();
        // localDataSource.saveToken(remoteResponse.token);
        // localDataSource.saveUser(remoteResponse.user);
        localDataSource.saveLoggedInStatus(true);
        localDataSource.saveToken(remoteResponse.extraAuthModel.authToken!);
        localDataSource.saveUserId(remoteResponse.user.id!);
                localDataSource.saveUserName(remoteResponse.user.name!);
localDataSource.saveUserEmail(remoteResponse.user.email!);
localDataSource.savePhoto(remoteResponse.user.photoUrl!);

        return Right(remoteResponse);
      } on ApiException catch (failure) {
        return Left(failure);
      }
    } else {
      return Left(ApiException('Failed to fetch api',696));
    }

    
  }
  Future<Either<ApiException, SignupResponseModel>> _signup(
_SignupDataSourceChooser   getDataSource   ) async {
    // if (await networkInfo.isConnected) {
      try {
        final remoteResponse = await getDataSource();
        // localDataSource.saveToken(remoteResponse.token);
        // localDataSource.saveUser(remoteResponse.user);
        // localDataSource.saveLoggedInStatus(true);
        // localDataSource.saveToken(remoteResponse.extraAuthModel.authToken!);
        // localDataSource.saveUserId(remoteResponse.user.id!);
        //         localDataSource.saveUserName(remoteResponse.user.name!);

        return Right(remoteResponse);
      } 
      
   
      
      on ApiException catch (failure) {
        return Left(failure);
      }
    
    // } else {
    //   return Left(NetworkFailure());
    // }
      }
  @override
  Future<Either<Failure, String?>> signOut()async {
    if (await networkInfo.isConnected) {
      try {
        final remoteResponse = await remoteDataSource.signOut(
          localDataSource.getToken(), 
          localDataSource.getUserId()!
        );
        // localDataSource.saveToken(remoteResponse.token);
        // localDataSource.saveUser(remoteResponse.user);
      localDataSource.clearCache();
        return Right(remoteResponse);
      } on Failure catch (failure) {
        return Left(failure);
      }
    } else {
      return Left(NetworkFailure());
    }
  }
  
  @override
  String getUserName() {
    return localDataSource.getUserName()??'';
  }
  
  @override
  Future<Either<ApiException, SignupResponseModel>> signUp(String name, String email, String password)async {
   return await _signup(() {
      return remoteDataSource.signUp(name,email,password);
    });
  }

  @override
  Future<Either<Failure, ProfileResponseModel>> getUserProfile()async {
         try {
        final remoteResponse = await  remoteDataSource.getUserprofile(
          localDataSource.getUserId().toString()
          
          
          ,
         localDataSource.getToken() ,
        //  lang: localDataSource.
         );
        // localDataSource.saveToken(remoteResponse.token);
        // localDataSource.saveUser(remoteResponse.user);
        // localDataSource.saveLoggedInStatus(true);
        // localDataSource.saveToken(remoteResponse.extraAuthModel.authToken!);
        // localDataSource.saveUserId(remoteResponse.user.id!);
        //         localDataSource.saveUserName(remoteResponse.user.name!);

        return Right(remoteResponse);
      } 
      
          on TimeoutException{
        return Left(TimeoutFailure());
  }
  on SocketException{
        return Left(NetworkFailure());
  }
   
      
      on Failure catch (failure) {
        return Left(failure);
      }
  }

  @override
  Future<Either<Failure, StatsResponseModel>> getUserStats()async {
     try {
        final remoteResponse = await  remoteDataSource.
        getUserStats(         
           localDataSource.getUserId().toString()
,
         localDataSource.getToken() ,
         lang: localeLocalDataSource!.getCurrentLocale()
         );
        // localDataSource.saveToken(remoteResponse.token);
        // localDataSource.saveUser(remoteResponse.user);
        // localDataSource.saveLoggedInStatus(true);
        // localDataSource.saveToken(remoteResponse.extraAuthModel.authToken!);
        // localDataSource.saveUserId(remoteResponse.user.id!);
        //         localDataSource.saveUserName(remoteResponse.user.name!);

        return Right(remoteResponse);
      } 
      
          on TimeoutException{
        return Left(TimeoutFailure(message: 'timeout'));
  }
  on SocketException{
        return Left(NetworkFailure(message: 'internet'));
  }
   
      
      on Failure catch (failure) {
        log(failure.toString());
        return Left(failure);
      }
  }
  
  @override
  (String, String, String ,String ) getCountryData() {
  return  (localDataSource.getPhoneCode(), 
  localDataSource.getCountryCode() , 
    localDataSource.getCountryFlag() , 
localDataSource.getCounryName()
  
  );
   }
   
     @override
     void logout() {
  localDataSource.clearCache();

     }
     
       @override
       String getUserId() {
         // TODO: implement getUserId
      return localDataSource.getUserId().toString();
       }
      @override
       String getUserEmail() {
         // TODO: implement getUserId
      return localDataSource.getUserEmail().toString();
       }
       @override
       bool isLoggedIn() {
         // TODO: implement isLoggedIn
             return localDataSource.getUserId()!=null;

       }
       
         @override
         String getUserPhoto() {
           // TODO: implement getUserPhoto
           return localDataSource.getPhoto()??'';
         }
         
           @override
           Future<Either<ApiException, void>> updateUser({String? userId, 
           File? photo, String? name, String? userName, 
           String? email, String? countryCode, String? phone, 
           
           
           int? gender_id, 
           int? type_id
           
           })async {
             try {
        final remoteResponse = await  remoteDataSource.
        updateUser(localDataSource.getToken()??'',

        userId: localDataSource.getUserId().toString(),
        userName: userName , 
        name: name,
        email: email,
        phone: phone , 
        photo: photo , 
        countryCode: countryCode , 
        gender_id: gender_id , 
        type_id: type_id
        
      );
        // localDataSource.saveToken(remoteResponse.token);
        // localDataSource.saveUser(remoteResponse.user);
        // localDataSource.saveLoggedInStatus(true);
        // localDataSource.saveToken(remoteResponse.extraAuthModel.authToken!);
        // localDataSource.saveUserId(remoteResponse.user.id!);
        //         localDataSource.saveUserName(remoteResponse.user.name!);

        return Right(remoteResponse);
      } 
      
      
   
      
      on ApiException catch (failure) {
        log(failure.toString());
        return Left(failure);
      }
           }
           
             @override
             void setCountryCode(String code) {
               localDataSource.saveCountryCode(code);
             }
           
             @override
             void setCountryFlag(String flag) {
             localDataSource.saveCounryFlag(flag);
             }
           
             @override
             void setCountryName(String name) {
            localDataSource.saveCounryName(name);
             }
           
             @override
             void setCountryPhoneCode(String code) {
              localDataSource.savePhoneCode(code);
             }
             
               @override
               void setUserPhoto(String photo) {
               localDataSource.savePhoto(photo);
               }
               
                 @override
                 Future<Either<ApiException, void>> forgotPassword(String email)async {
                  try {
                  var response = await remoteDataSource.forgotPassword(email);
                  return Right(response);
                  }
                   on ApiException catch (failure) {
        log(failure.message.toString());
        return Left(failure);
      }
                 }

}
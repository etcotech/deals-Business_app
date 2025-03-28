import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:deals_and_business/core/error/dio_exceptions.dart';
import 'package:deals_and_business/core/error/failure.dart';
import 'package:deals_and_business/data/models/user/login_response.dart';
import 'package:deals_and_business/data/models/user/profile_response_model.dart';
import 'package:deals_and_business/data/models/user/signup_response_model.dart';
import 'package:deals_and_business/data/models/user/stats_response_model.dart';


abstract class UserRepository {
  Future<Either<ApiException, LoginResponseModel>> signIn(
    
    String email , String password);
        Future<Either<ApiException, void>> forgotPassword(String email);
        Future<Either<ApiException, void>> deleteAccount(String userId);

  Future<Either<ApiException, SignupResponseModel>> signUp(String name, String email  ,String password );
  // Future<Either<Failure, NoParams>> signOut();
  // Future<Either<Failure, User>> getCachedUser();

    Future<Either<Failure, String?>> signOut();
    String getUserName();
    String getUserEmail();

void setCountryPhoneCode(String code);
void setCountryCode(String code);
void setCountryFlag(String flag);
void setCountryName(String name);
void setUserPhoto(String flag);





      Future<Either<Failure, ProfileResponseModel>> getUserProfile(
      );
    String getUserId();

        String getUserPhoto();

    bool isLoggedIn();

 Future<Either<Failure, StatsResponseModel>> getUserStats(
        );

(String, String , String , String)  getCountryData();

void logout();
  Future<Either<ApiException, void>> updateUser(
     { String? userId,
    File? photo, 
    String? name, 
    String? userName, 
    String? email ,
    String? countryCode,
    String? phone,
    
           int? gender_id, 
           int? type_id
    });

}
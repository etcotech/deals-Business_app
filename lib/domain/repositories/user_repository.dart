import 'package:dartz/dartz.dart';
import 'package:deals_and_business/core/error/failure.dart';
import 'package:deals_and_business/data/models/user/login_response.dart';


abstract class UserRepository {
  Future<Either<Failure, LoginResponseModel>> signIn(String email , String password);
  // Future<Either<Failure, User>> signUp(SignUpParams params);
  // Future<Either<Failure, NoParams>> signOut();
  // Future<Either<Failure, User>> getCachedUser();

    Future<Either<Failure, String?>> signOut();
    String getUserName();

}
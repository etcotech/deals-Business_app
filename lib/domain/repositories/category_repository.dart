import 'package:dartz/dartz.dart';
import 'package:deals_and_business/core/error/failure.dart';
import 'package:deals_and_business/data/models/category/category_list_response_model.dart';
import 'package:deals_and_business/data/models/category/category_sub_category_list_response_model.dart';

abstract class CategoryRepository {
  Future<Either<Failure, CategoryListResponseModel>> getCategories();
  Future<Either<Failure, CategorySubCategoryListResponseModel>> getCategoriesDetailed();

  // Future<Either<Failure, User>> signUp(SignUpParams params);
  // Future<Either<Failure, NoParams>> signOut();
  // Future<Either<Failure, User>> getCachedUser();


}
import 'package:dartz/dartz.dart';
import 'package:deals_and_business/core/error/dio_exceptions.dart';
import 'package:deals_and_business/core/error/failure.dart';
import 'package:deals_and_business/data/models/category/category_list_response_model.dart';
import 'package:deals_and_business/data/models/category/category_sub_category_list_response_model.dart';
import 'package:deals_and_business/data/models/post/category_post_response.dart';
import 'package:deals_and_business/data/models/post/post_list_response_model.dart';
import 'package:deals_and_business/data/models/post/subcategory_post_response.dart';

abstract class CategoryRepository {
  Future<Either<ApiException, CategorySubCategoryListResponseModel>> getCategories();
  Future<Either<Failure, CategorySubCategoryListResponseModel>> getCategoriesDetailed();
    Future<Either<ApiException, CategoryPostResponse>> getCategoryPosts(
      String? categoryId,
      
      {String? lang ='ar'});
       Future<Either<ApiException, SubcategoryPostResponse>> getSubCategoryPosts(
      String? categoryId,
      
      {String? lang ='ar'});
  // Future<Either<Failure, User>> signUp(SignUpParams params);
  // Future<Either<Failure, NoParams>> signOut();
  // Future<Either<Failure, User>> getCachedUser();


}
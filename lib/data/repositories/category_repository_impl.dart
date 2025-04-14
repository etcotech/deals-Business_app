import 'dart:async';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:deals_and_business/core/error/dio_exceptions.dart';
import 'package:deals_and_business/core/error/failure.dart';
import 'package:deals_and_business/core/network/network_info.dart';
import 'package:deals_and_business/data/dataSources/local/locale_local_data_source.dart';
import 'package:deals_and_business/data/dataSources/remote/category/category_remote_data_source.dart';
import 'package:deals_and_business/data/models/category/category_list_response_model.dart';
import 'package:deals_and_business/data/models/category/category_sub_category_list_response_model.dart';
import 'package:deals_and_business/data/models/post/category_post_response.dart';
import 'package:deals_and_business/data/models/post/post_list_response_model.dart';
import 'package:deals_and_business/data/models/post/subcategory_post_response.dart';
import 'package:deals_and_business/domain/repositories/category_repository.dart';

typedef _DataSourceChooser = Future<CategorySubCategoryListResponseModel> Function();
class CategoryRepositoryImpl implements CategoryRepository {
  final CategoryRemoteDataSource categoryRemoteDataSource;
    final LocaleLocalDataSource localeLocalDatasource;

  final NetworkInfo networkInfo;

  CategoryRepositoryImpl({
    required this.categoryRemoteDataSource,
        required this.localeLocalDatasource,

    required this.networkInfo,
  });

  @override
  Future<Either<ApiException, CategorySubCategoryListResponseModel>> getCategories() async{
    
    return  await _categoryListProvider((){

        return    categoryRemoteDataSource.getCategories(

          lang: localeLocalDatasource.getCurrentLocale()
        );
        
    });
  }


  
Future<Either<ApiException, CategorySubCategoryListResponseModel>> _categoryListProvider(
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

  @override
  Future<Either<Failure, CategorySubCategoryListResponseModel>> getCategoriesDetailed()async {
   try {
        final remoteResponse = await categoryRemoteDataSource.getCategoriesDetailed();
        
        // localDataSource.saveToken(remoteResponse.token);
        // localDataSource.saveUser(remoteResponse.user);
       
        return Right(remoteResponse);
      }  on TimeoutException{
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
  Future<Either<ApiException, CategoryPostResponse>> getCategoryPosts(String? categoryId, {String? lang = 'ar'}) async{
   try {
        final remoteResponse = await categoryRemoteDataSource.getCategoryPosts(categoryId);
        
        // localDataSource.saveToken(remoteResponse.token);
        // localDataSource.saveUser(remoteResponse.user);
       
        return Right(remoteResponse);
      } 
   
      
      on ApiException catch (failure) {
        return Left(failure);
      }
  }
  
  @override
  Future<Either<ApiException, SubcategoryPostResponse>> getSubCategoryPosts(String? categoryId, {String? lang = 'ar'}) async{
   try {
        final remoteResponse = await categoryRemoteDataSource.getSubCategoryPosts(categoryId);
        
        // localDataSource.saveToken(remoteResponse.token);
        // localDataSource.saveUser(remoteResponse.user);
       
        return Right(remoteResponse);
      }  
   
      
      on ApiException catch (failure) {
        return Left(failure);
      }
  }



}
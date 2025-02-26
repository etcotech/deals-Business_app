import 'package:dartz/dartz.dart';
import 'package:deals_and_business/core/error/failure.dart';
import 'package:deals_and_business/core/network/network_info.dart';
import 'package:deals_and_business/data/dataSources/local/locale_local_data_source.dart';
import 'package:deals_and_business/data/dataSources/remote/category/category_remote_data_source.dart';
import 'package:deals_and_business/data/models/category/category_list_response_model.dart';
import 'package:deals_and_business/domain/repositories/category_repository.dart';

typedef _DataSourceChooser = Future<CategoryListResponseModel> Function();
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
  Future<Either<Failure, CategoryListResponseModel>> getCategories() async{
    return  await _categoryListProvider((){

        return    categoryRemoteDataSource.getCategories(

          lang: localeLocalDatasource.getCurrentLocale()
        );
        
    });
  }


  
Future<Either<Failure, CategoryListResponseModel>> _categoryListProvider(
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



}
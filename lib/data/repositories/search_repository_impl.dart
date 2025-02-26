
import 'package:dartz/dartz.dart';
import 'package:deals_and_business/core/error/failure.dart';
import 'package:deals_and_business/core/network/network_info.dart';
import 'package:deals_and_business/data/dataSources/local/locale_local_data_source.dart';
import 'package:deals_and_business/data/dataSources/local/user/user_local_data_source.dart';
import 'package:deals_and_business/data/dataSources/remote/search/search_remote_data_source.dart';
import 'package:deals_and_business/data/models/search/search_response_model.dart';
import 'package:deals_and_business/domain/repositories/search_repository.dart';

typedef _SearchResponse = Future<SearchResponseModel> Function();

class SearchRepositoryImpl implements SearchRepository{
final SearchRemoteDataSource searchRemoteDataSource;
  final UserLocalDataSource localDataSource;
  final LocaleLocalDataSource localeLocalDatasource;
  final NetworkInfo networkInfo;

  SearchRepositoryImpl({
    required this.searchRemoteDataSource,
    required this.localDataSource,
    required this.localeLocalDatasource,
    required this.networkInfo,
  });






  @override
  Future<Either<Failure, SearchResponseModel>> search(String token, {String keyword = '',
   String? lang = 'ar', double price_from = 0.0, double price_to = 0.0, 
   String? category_id , String sort_by = 'price', String sort_order = 'desc'})async {
    return  await _searchDataProvider((){

        return   searchRemoteDataSource.search(
          localDataSource.getToken()??'',
          
        lang: localDataSource.getCountryCode(),
        price_from: price_from,
        price_to: price_to,
        sort_by: sort_by , 
        sort_order: sort_order ,
keyword: keyword, 

category_id: category_id
        );
    });
  }

  @override
  Future<Either<Failure, SearchResponseModel>> searchNexPage(String token, String url)async {
     return  await _searchDataProvider((){

        return    searchRemoteDataSource.searchNextPage(localDataSource.getToken()??'',
         url);
    });
  }
  



    
Future<Either<Failure, SearchResponseModel>> _searchDataProvider(
   _SearchResponse getDataSource,
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
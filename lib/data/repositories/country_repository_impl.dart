import 'package:dartz/dartz.dart';
import 'package:deals_and_business/core/error/failure.dart';
import 'package:deals_and_business/core/network/network_info.dart';
import 'package:deals_and_business/data/dataSources/local/locale_local_data_source.dart';
import 'package:deals_and_business/data/dataSources/local/user/user_local_data_source.dart';
import 'package:deals_and_business/data/dataSources/remote/country/country_remote_data_source.dart';
import 'package:deals_and_business/data/models/country/city_list_response_model.dart';
import 'package:deals_and_business/data/models/country/country_list_reponse_model.dart';
import 'package:deals_and_business/domain/repositories/country_repositories.dart';

typedef _DataSourceChooser = Future<CountryListResponseModel> Function();
typedef _CityDataSource= Future<CityListResponseModel> Function();

class CountryRepositoryImpl implements CountryRepository {
  final CountryRemoteDataSource countryRemoteDataSource;
  final UserLocalDataSource userLocalDataSource;
      final LocaleLocalDataSource localeLocalDatasource;

  final NetworkInfo networkInfo;

  CountryRepositoryImpl({
    required this.countryRemoteDataSource,
        required this.localeLocalDatasource,

        required this.userLocalDataSource,

    required this.networkInfo,
  });

  @override
  Future<Either<Failure, CountryListResponseModel>> getCountries() async{
    return  await _countryListProvider((){

        return    countryRemoteDataSource.getCountries(
          lang: localeLocalDatasource.getCurrentLocale()
        );
        
    });
  }


  

  
  @override
  Future<Either<Failure, CityListResponseModel>> getCities() async{
     return  await _cityListProvider((){

        return    countryRemoteDataSource.getCities(
          code: userLocalDataSource.getCountryCode()
        );
        
    });
  }
Future<Either<Failure, CountryListResponseModel>> _countryListProvider(
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


  Future<Either<Failure, CityListResponseModel>> _cityListProvider(
   _CityDataSource getDataSource,
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
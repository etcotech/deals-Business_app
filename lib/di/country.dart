import 'package:deals_and_business/data/dataSources/local/user/user_local_data_source.dart';
import 'package:deals_and_business/data/dataSources/remote/country/country_remote_data_source.dart';
import 'package:deals_and_business/data/repositories/country_repository_impl.dart';
import 'package:deals_and_business/di/di.dart';
import 'package:deals_and_business/domain/repositories/country_repositories.dart';
import 'package:deals_and_business/main.dart';

void registerCountryFeature(){


// Repository
  sl.registerLazySingleton<CountryRepository>(
        () =>CountryRepositoryImpl(

          countryRemoteDataSource: sl(),
          userLocalDataSource: sl(),
          localeLocalDatasource: sl(),
     networkInfo: sl()
    ),
  );
 
  // Data sources
  sl.registerLazySingleton<CountryRemoteDataSource>(
        () =>CountryRemoteDataSourceImpl(client: sl()),
  );

  // sl.registerLazySingleton<UserLocalDataSource>(
  //       () =>UserLocalDataSourceImpl(sharedPreferences: globalSharedPrefs),
  // );
}



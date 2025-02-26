import 'package:deals_and_business/data/dataSources/remote/search/search_remote_data_source.dart';
import 'package:deals_and_business/data/repositories/search_repository_impl.dart';
import 'package:deals_and_business/di/di.dart';
import 'package:deals_and_business/domain/repositories/search_repository.dart';
import 'package:deals_and_business/features/search/providers/search_provider.dart';

void registerSearchFeature(){
//provider
sl.registerFactory(()=>
SearchProvider(
  searchRepository: sl()
)

);

 // repo

  sl.registerLazySingleton<SearchRepository>(()=> 
  
  SearchRepositoryImpl(
searchRemoteDataSource: sl(), 
localDataSource: sl(),
localeLocalDatasource: sl(),
networkInfo: sl(),

    
  )
  );


  //data source
  sl.registerLazySingleton<SearchRemoteDataSource>(()=> 
  
  SearchRemoteDataSourceImpl(client: sl())
  );

}
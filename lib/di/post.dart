
import 'package:deals_and_business/data/dataSources/local/user/user_local_data_source.dart';
import 'package:deals_and_business/data/dataSources/remote/Ad/post_remote_datasource.dart';
import 'package:deals_and_business/data/repositories/post_repository_impl.dart';
import 'package:deals_and_business/di/di.dart';
import 'package:deals_and_business/domain/repositories/post_repository.dart';
import 'package:deals_and_business/main.dart';
import 'package:deals_and_business/shared/providers/post_provider.dart';

void registerPostFeature(){


//provider
 sl.registerFactory(
        () => PostProvider(postRepository:sl(),
        
        userRepository: sl()
        ),
  );

// Repository
  sl.registerLazySingleton<PostRepository>(
        () => PostRepositoryImpl(
          localeLocalDatasource: sl(),
          localDataSource: sl(),
    postRemoteDatasource: sl(), 
     networkInfo: sl()
    ),
  );

  // Data sources
  sl.registerLazySingleton<PostRemoteDatasource>(
        () => PostRemoteDatasourceImpl(client: sl()),
  );
  //
   sl.registerLazySingleton<UserLocalDataSource>(
        () => UserLocalDataSourceImpl(sharedPreferences: globalSharedPrefs)
  );
}
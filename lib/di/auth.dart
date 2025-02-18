import 'package:deals_and_business/data/dataSources/local/user/user_local_data_source.dart';
import 'package:deals_and_business/data/dataSources/remote/user/user_remote_data_source.dart';
import 'package:deals_and_business/data/repositories/user_repository_impl.dart';
import 'package:deals_and_business/di/di.dart';
import 'package:deals_and_business/domain/repositories/user_repository.dart';
import 'package:deals_and_business/features/auth/providers/auth_provider.dart';

void registerAuthFeature(){


//provider
 sl.registerFactory(
        () => AuthProvider(userRepository:sl()),
  );

// Repository
  sl.registerLazySingleton<UserRepository>(
        () => UserRepositoryImpl(
          localDataSource: sl(),
    remoteDataSource: sl(), 
     networkInfo: sl()
    ),
  );

  // Data sources
  sl.registerLazySingleton<UserRemoteDataSource>(
        () => UserRemoteDataSourceImpl(client: sl()),
  );
   sl.registerLazySingleton<UserLocalDataSource>(
        () => UserLocalDataSourceImpl(sharedPreferences: sl())
  );
}
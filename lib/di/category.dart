import 'package:deals_and_business/data/dataSources/local/user/user_local_data_source.dart';
import 'package:deals_and_business/data/dataSources/remote/category/category_remote_data_source.dart';
import 'package:deals_and_business/data/repositories/category_repository_impl.dart';
import 'package:deals_and_business/di/di.dart';
import 'package:deals_and_business/domain/repositories/category_repository.dart';
import 'package:deals_and_business/features/category/providers/category_provider.dart';

void registerCategoryFeature(){

//provider
sl.registerFactory<CategoryProvider>(()=> CategoryProvider(categoryRepository: sl()));


// Repository
  sl.registerLazySingleton<CategoryRepository>(
        () => CategoryRepositoryImpl(
          categoryRemoteDataSource: sl(),
          localeLocalDatasource: sl(),
     networkInfo: sl()
    ),
  );

  // Data sources
  sl.registerLazySingleton<CategoryRemoteDataSource>(
        () =>CategoryRemoteDataSourceImpl(client: sl(), 
        
        apiClient: sl()
        ),
  );
  //
  //  sl.registerLazySingleton<UserLocalDataSource>(
  //       () => UserLocalDataSourceImpl(sharedPreferences: sl())
  // );

}



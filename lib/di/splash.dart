import 'package:deals_and_business/data/dataSources/local/splash_local_data_source.dart';
import 'package:deals_and_business/di/di.dart';
import 'package:deals_and_business/features/splash/providers/splash_provider.dart';
import 'package:deals_and_business/main.dart';

void regiserSplashFeature(){
//provider
 sl.registerFactory(
        () => SplashProvider(splashLocalDataSource:sl()),
  );




//data source

  sl.registerLazySingleton<SplashLocalDataSource>(
        () => SplashLocalDataSourceImpl(sharedPreferences: globalSharedPrefs)
  );


  
}
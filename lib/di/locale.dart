import 'package:deals_and_business/data/dataSources/local/locale_local_data_source.dart';
import 'package:deals_and_business/di/di.dart';
import 'package:deals_and_business/features/language/providers/language_provider.dart';
import 'package:deals_and_business/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

void registerLocaleFeature(){


//provider
 sl.registerFactory(
        () => LanguageProvider(localeLocalDataSource:sl()),
  );


//data source

  sl.registerLazySingleton<LocaleLocalDataSource>(
        () => LocaleLocalDataSourceImpl(sharedPreferences:globalSharedPrefs)
  );

  

}

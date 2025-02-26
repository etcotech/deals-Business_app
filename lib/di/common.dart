import 'package:deals_and_business/core/network/network_info.dart';
import 'package:deals_and_business/di/di.dart';
import 'package:deals_and_business/main.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
 registerCommonDependencies() async {
  // final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(()=>globalSharedPrefs);
    // sl.registerSingleton(sharedPreferences);
    sl.registerLazySingleton(() => InternetConnectionChecker.createInstance());
   sl.registerLazySingleton(() => http.Client());
  // sl.registerLazySingleton(() => HttpClient(baseUrl: "baseUrl"));




  // Register NetworkInfo
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));
 
}
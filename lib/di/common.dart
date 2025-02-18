import 'package:deals_and_business/core/network/network_info.dart';
import 'package:deals_and_business/di/di.dart';

import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
 registerCommonDependencies() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerSingleton<SharedPreferences>(sharedPreferences);
    sl.registerLazySingleton(() => InternetConnectionChecker.createInstance());
   sl.registerLazySingleton(() => http.Client());
  // sl.registerLazySingleton(() => HttpClient(baseUrl: "baseUrl"));




  // Register NetworkInfo
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));
}
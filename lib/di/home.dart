import 'package:deals_and_business/data/dataSources/local/user/user_local_data_source.dart';
import 'package:deals_and_business/data/dataSources/remote/country/country_remote_data_source.dart';
import 'package:deals_and_business/di/category.dart';
import 'package:deals_and_business/di/di.dart';
import 'package:deals_and_business/di/post.dart';
import 'package:deals_and_business/features/home/providers/home_provider.dart';
import 'package:deals_and_business/main.dart';

void registerHomeFeature(){


//provider
 sl.registerFactory(
        () => HomeProvider(
          countryRepository: sl(),
          postRepository:sl(),
          categoryRepository: sl()
          ),
  );



}
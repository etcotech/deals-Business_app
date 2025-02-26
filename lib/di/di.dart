
import 'package:deals_and_business/di/auth.dart';
import 'package:deals_and_business/di/category.dart';
import 'package:deals_and_business/di/common.dart';
import 'package:deals_and_business/di/country.dart';
import 'package:deals_and_business/di/home.dart';
import 'package:deals_and_business/di/locale.dart';
import 'package:deals_and_business/di/post.dart';
import 'package:deals_and_business/di/search.dart';
import 'package:deals_and_business/di/splash.dart';
import 'package:get_it/get_it.dart';

final  sl = GetIt.instance;

// Main Initialization
Future<void> init() async {
  // // Register features
  registerCommonDependencies();
  registerHomeFeature();
  registerLocaleFeature();
  registerSearchFeature();

  regiserSplashFeature();

  registerAuthFeature();

registerCountryFeature();

registerCategoryFeature();

  registerPostFeature();
// registerLocaleFeature();





// registerLocaleFeature();



  // // Register common dependencies
  registerCommonDependencies();
}
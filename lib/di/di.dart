
import 'package:deals_and_business/di/auth.dart';
import 'package:deals_and_business/di/common.dart';
import 'package:deals_and_business/di/locale.dart';
import 'package:deals_and_business/di/splash.dart';
import 'package:get_it/get_it.dart';

GetIt sl = GetIt.instance;

// Main Initialization
Future<void> init() async {
  // // Register features
registerAuthFeature();
regiserSplashFeature();
registerLocaleFeature();




  // // Register common dependencies
  registerCommonDependencies();
}
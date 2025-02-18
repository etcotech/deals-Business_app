import 'package:deals_and_business/data/dataSources/local/splash_local_data_source.dart';
import 'package:flutter/material.dart';

class SplashProvider extends ChangeNotifier {
  final  SplashLocalDataSource splashLocalDataSource;

  SplashProvider({required this.splashLocalDataSource});
  
  bool isLoggedIn()=> splashLocalDataSource.isLoggedIn();

  bool isFirstTime()=> splashLocalDataSource.isFirstTime();
  void setISFistTime(bool value)=> splashLocalDataSource.setFirstTime(value);
}

import 'package:deals_and_business/core/error/exceptions.dart';
import 'package:deals_and_business/features/splash/view/splash_screen.dart';
import 'package:flutter/material.dart';
class AppRouter{
  
    static const String splash = '/';

static Route<dynamic> onGenerateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case splash:
      return MaterialPageRoute(builder: (_) => const SplashScreen());
     
        default:
        throw const RouteException('Route not found!');
  }

 }

}
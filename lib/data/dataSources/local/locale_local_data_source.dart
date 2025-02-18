import 'package:deals_and_business/core/constants/strings.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class LocaleLocalDataSource {
  
  String getCurrentLocale(BuildContext context);
  void setCurrentLocale(String key);

  List<Map<String,dynamic>> getLanguages();



}

class LocaleLocalDataSourceImpl implements LocaleLocalDataSource {
  final SharedPreferences sharedPreferences;

  LocaleLocalDataSourceImpl({required this.sharedPreferences});
  @override
  String getCurrentLocale(BuildContext context) {
    return sharedPreferences.getString(Strings.currentLanguage)??'ar';
  }

  @override
  List<Map<String, dynamic>> getLanguages() {
    return [

      {
        "key":"ar",
        "translate":"arabic", 
      },
       {
        "key":"en",
        "translate":"english", 
      },
      
    ];
  }

  @override
  void setCurrentLocale(String key) {
   sharedPreferences.setString(Strings.currentLanguage, key);
  }
  
}
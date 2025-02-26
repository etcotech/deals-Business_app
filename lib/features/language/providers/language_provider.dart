import 'package:deals_and_business/data/dataSources/local/locale_local_data_source.dart';
import 'package:flutter/material.dart';

class LanguageProvider extends ChangeNotifier {
  final  LocaleLocalDataSource localeLocalDataSource;

  LanguageProvider({required this.localeLocalDataSource});
  

String loadCurrentLocal(BuildContext context)=>   localeLocalDataSource.getCurrentLocale();

List<Map<String, dynamic>> getLanguages()=> localeLocalDataSource.getLanguages();



  void setCurrentLocale(String key)=> localeLocalDataSource.setCurrentLocale(key);

  


}
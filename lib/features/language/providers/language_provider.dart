import 'package:deals_and_business/data/dataSources/local/locale_local_data_source.dart';
import 'package:flutter/material.dart';

class LanguageProvider extends ChangeNotifier {
  final  LocaleLocalDataSource localeLocalDataSource;

  LanguageProvider({required this.localeLocalDataSource});
   Locale locale = Locale('ar');

  
String loadCurrentLocal(BuildContext context)  {
  var locale = localeLocalDataSource.getCurrentLocale();
  // locale= Locale(locale);
  // notifyListeners();
  return  locale;
}

List<Map<String, dynamic>> getLanguages()=> localeLocalDataSource.getLanguages();



 void setCurrentLocale(String key)  {
   locale = Locale(key);
   notifyListeners();
   localeLocalDataSource.setCurrentLocale(key);
 }

  


}
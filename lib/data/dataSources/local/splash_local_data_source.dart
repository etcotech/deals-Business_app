import 'package:deals_and_business/core/constants/strings.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class SplashLocalDataSource {
  
  bool isFirstTime();
  bool isGuestMode();
  bool isLoggedIn();

void setFirstTime(bool value);
void setGuestMode(bool value);
void setLoggedInStatus(bool value);

}
class SplashLocalDataSourceImpl implements SplashLocalDataSource {

  final SharedPreferences sharedPreferences;

  SplashLocalDataSourceImpl({required this.sharedPreferences});
  @override
  bool isFirstTime() {
    return sharedPreferences.getBool(Strings.isFirstTime)?? true;
  }

  @override
  bool isGuestMode() {
      return sharedPreferences.getBool(Strings.isGuestMode)?? false;

  }

  @override
  bool isLoggedIn() {
       return sharedPreferences.getBool(Strings.isLoggedIn)?? false;

  }

  @override
  void setFirstTime(bool value) {
   sharedPreferences.setBool(Strings.isFirstTime, value);
  }

  @override
  void setGuestMode(bool value) {
   sharedPreferences.setBool(Strings.isGuestMode, value);
  }

  @override
  void setLoggedInStatus(bool value) {
   sharedPreferences.setBool(Strings.isLoggedIn, value);
  }
  
}
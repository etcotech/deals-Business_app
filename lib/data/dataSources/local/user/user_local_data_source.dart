

import 'package:deals_and_business/core/constants/strings.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class UserLocalDataSource {
 String? getToken();

  // Future<UserModel> getUser();

  Future<void> saveToken(String token);

  // Future<void> saveUser(UserModel user);

  Future<void> clearCache();
void saveLoggedInStatus(bool value);
 bool isTokenAvailable();

  int? getUserId();
void saveUserId(int userId);

void saveCountryCode(String code);
void saveCounryFlag(String flag);
void saveUserName(String name);
String? getUserName();

String getCountryCode();
String getCountryFlag();
}
const cachedToken = 'TOKEN';
const cachedUser = 'USER';



class UserLocalDataSourceImpl implements UserLocalDataSource {
  final SharedPreferences sharedPreferences;
  UserLocalDataSourceImpl(
      {required this.sharedPreferences,});

  @override
String? getToken()  {
   return sharedPreferences.getString(Strings.token) ;
  }

  @override
  Future<void> saveToken(String token) async {
   sharedPreferences.setString(Strings.token, token);
  }

 



  @override
  bool isTokenAvailable()  {
    // String? token = await secureStorage.read(key: cachedToken);
    // return Future.value((token != null));
    return false;
  }

  @override
  Future<void> clearCache() async {
    // await secureStorage.deleteAll();
  //  await sharedPreferences.remove(cachedCart);
  await sharedPreferences.remove(Strings.isLoggedIn);
  await sharedPreferences.remove(Strings.isGuestMode);
    await sharedPreferences.remove(cachedUser);
  }
  
  @override
  void saveLoggedInStatus(bool value) {
   sharedPreferences.setBool(Strings.isLoggedIn, value);
  }
  
  @override
  int? getUserId() {
    return sharedPreferences.getInt(Strings.userId);
  }
  
  @override
  void saveUserId(int userId) {
    sharedPreferences.setInt(Strings.userId, userId);
  }
  
  @override
  String getCountryCode() {
    return  sharedPreferences.getString(Strings.countryCode)??'sa';
  }
  
  @override
  String getCountryFlag() {
   return sharedPreferences.getString(Strings.countryFlag)??'';
  }
  
  @override
  void saveCounryFlag(String flag) {
    sharedPreferences.setString(Strings.countryFlag, flag);
  }
  
  @override
  void saveCountryCode(String code) {
    sharedPreferences.setString(Strings.countryCode, code);
  }
  
  @override
  String? getUserName() {
    return sharedPreferences.getString(Strings.userName)??'';
  }
  
  @override
  void saveUserName(String name) {
    sharedPreferences.setString(Strings.userName, name);
  }
}
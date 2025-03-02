import 'dart:developer';
import 'dart:io';

import 'package:deals_and_business/core/constants/translate.dart';
import 'package:deals_and_business/core/error/error_handler.dart';
import 'package:deals_and_business/core/error/failure.dart';
import 'package:deals_and_business/data/models/error_data.dart';
import 'package:deals_and_business/data/models/user/profile_model.dart';
import 'package:deals_and_business/data/models/user/user_stats_model.dart';
import 'package:deals_and_business/domain/repositories/user_repository.dart';
import 'package:deals_and_business/features/auth/views/login_screen.dart';
import 'package:deals_and_business/features/splash/view/splash_screen.dart';
import 'package:deals_and_business/main.dart';
import 'package:deals_and_business/shared/widgets/toasts.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
typedef CountryData=(String, String);
class ProfileProvider extends ChangeNotifier{
  final UserRepository? userRepository;

  ProfileProvider({required this.userRepository});
   ProfileModel? profileModel;
      StatsModel? statsModel;

   bool isLoading = false;
   ErrorData? errorData;
String getUserName(){
  return userRepository!.getUserName();
}
String getUserEmail(){
  return userRepository!.getUserEmail();
}

CountryData? countryData ; 

void setcountryData(String flag, String code){
countryData = (flag,code);
notifyListeners();
}


   Future<void> getUserProfile()async{
isLoading = true;
errorData = null;
notifyListeners();
    try {
      var result = await userRepository!.getUserProfile();
result.fold((failure){
log("FAILRE${failure.runtimeType}");
  errorData = ErrorData(
    message: getErrorMessage(failure.message.toString()), 
    icon: getErrorIcon(failure.message.toString())
  );
  isLoading= false;
  notifyListeners();
if (failure is CredentialFailure) {
  log("FAILURE");
  //logout
logout();
  
}

}, (success){
profileModel= success.user;
notifyListeners();



});

    } catch (e) {


  log("FAILURE$e");

      errorData = ErrorData(
    message: getErrorMessage(e.toString()), 
    icon: getErrorIcon(e.toString())
  );
  notifyListeners();
  
    }
    isLoading = false;
notifyListeners();
   }
 
String? getUserPhoto()=> userRepository!.getUserPhoto();
String? getUserId()=> userRepository!.getUserId();


   Future<void> getUserStats()async{
isLoading = true;
errorData = null;
notifyListeners();
    try {
      var result = await userRepository!.getUserStats();
result.fold((failure){
  errorData = ErrorData(
    message: getErrorMessage(failure.message.toString()), 
    icon: getErrorIcon(failure.message.toString())
  );
  
  notifyListeners();
showErrorMessage(navigatorKey.currentContext!,
 getTranslated(
  getErrorMessage(failure.message.toString())
  , navigatorKey.currentContext!));
if (failure is CredentialFailure) {
  //logout
logout();

}

}, (success){
      log("SUSSUU");

statsModel= success.statsModel;
notifyListeners();



});

    } catch (e) {

  log("FAILURE$e");
showErrorMessage(navigatorKey.currentContext!,
 getTranslated(
  getErrorMessage(e.toString())
  , navigatorKey.currentContext!));
      errorData = ErrorData(
    message: getErrorMessage(e.toString()), 
    icon: getErrorIcon(e.toString())
  );
  notifyListeners();
  
    }
    isLoading = false;
notifyListeners();
   }
 Future<void> updateProfile(  { File? photo, String? name, String? userName, 
           String? email, String? countryCode, String? phone})async{
isLoading = true;
errorData = null;
notifyListeners();
    try {
      var result = await userRepository!.updateUser(

        phone: phone ,
         countryCode: countryData!.$2, 
        email: email , 
        name: name , 
        userName: userName, 
        photo: photo

      );
result.fold((failure){
  errorData = ErrorData(
    message: getErrorMessage(failure.message.toString()), 
    icon: getErrorIcon(failure.message.toString())
  );
  
  notifyListeners();
showErrorMessage(navigatorKey.currentContext!,
 getTranslated(
  getErrorMessage(failure.message.toString())
  , navigatorKey.currentContext!));
if (failure is CredentialFailure) {
  //logout
logout();

}

}, (success){
      log("SUSSUU");

// statsModel= success.statsModel;
notifyListeners();
showSuccessMessage(navigatorKey.currentContext!, 'Profile updated');

Navigator.of(navigatorKey.currentContext!).pop();

});

    } catch (e) {

  log("FAILURE$e");
showErrorMessage(navigatorKey.currentContext!,
 getTranslated(
  getErrorMessage(e.toString())
  , navigatorKey.currentContext!));
      errorData = ErrorData(
    message: getErrorMessage(e.toString()), 
    icon: getErrorIcon(e.toString())
  );
  notifyListeners();
  
    }
    isLoading = false;
notifyListeners();

 }

 logout(){
  userRepository!.logout();
  Navigator.of(navigatorKey.currentContext!).pushAndRemoveUntil(

    PageTransition(type: 
    PageTransitionType.leftToRight ,

    child: SplashScreen()
    ), 
    (v)=> false
  );
 }


}
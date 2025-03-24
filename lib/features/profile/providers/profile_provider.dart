import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:deals_and_business/core/constants/translate.dart';
import 'package:deals_and_business/core/error/dio_exceptions.dart';
import 'package:deals_and_business/core/error/error_handler.dart';
import 'package:deals_and_business/core/error/failure.dart';
import 'package:deals_and_business/data/models/error_data.dart';
import 'package:deals_and_business/data/models/post/post_model.dart';
import 'package:deals_and_business/data/models/user/profile_model.dart';
import 'package:deals_and_business/data/models/user/user_stats_model.dart';
import 'package:deals_and_business/domain/repositories/post_repository.dart';
import 'package:deals_and_business/domain/repositories/user_repository.dart';
import 'package:deals_and_business/features/auth/views/login_screen.dart';
import 'package:deals_and_business/features/splash/view/splash_screen.dart';
import 'package:deals_and_business/main.dart';
import 'package:deals_and_business/shared/widgets/toasts.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
typedef CountryData=(String, String , String);
class ProfileProvider extends ChangeNotifier{
  final UserRepository? userRepository;
final PostRepository? postRepository;


List<PostModel> posts =[];
String? userNameError;
String? phoneError;
String? emailError;
String? nameError;
String? photoError;

bool isDeleteLoading = false;


clearErrors(){
  emailError = null;
  photoError=null;
  nameError= null;
  userNameError= null;
  phoneError= null;
  notifyListeners();
}
void setNameError(String? err){
  nameError= err;
  notifyListeners();
}
void setPhotoError(String? err){
  photoError= err;
  notifyListeners();
}
void setUserNameError(String? err){
  userNameError= err;
  notifyListeners();
}
void setPhoneError(String? err){
  phoneError= err;
  notifyListeners();
}

void setEmailError(String? err){
  emailError= err;
  notifyListeners();
}
  ProfileProvider({required this.userRepository , required this.postRepository});
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

void setcountryData(String flag, String code , String countryCode){
countryData = (flag,code , countryCode);
notifyListeners();
}


   Future<void> getUserProfile({Function(ProfileModel?)? userData})async{
isLoading = true;
errorData = null;
notifyListeners();
    try {
      var result = await userRepository!.getUserProfile();
result.fold((failure){
  if (failure is UnauthorizedException) {
    logout();
showErrorMessage(navigatorKey.currentContext!,getTranslated("session_expired",
 navigatorKey.currentContext!));

    return;
  }
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
userRepository!.setUserPhoto(success.user.photoUrl!);
if (userData!=null) {
  userData(success.user);

}
notifyListeners();



});

    } catch (e) {

log(e.toString());
  // log("FAILURE$e");

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

statsModel= success.statsModel;
notifyListeners();



});

    } catch (e) {

  log("FAILURE STATS$e");
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

   Future<void> getUserPosts()async{
isLoading = true;
errorData = null;
notifyListeners();
    try {
      var result = await postRepository!.getUserPosts(
        getUserId().toString()
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

posts= [];
posts.addAll(success.posts);
notifyListeners();



});

    } catch (e) {

  log("FAILURE POSTS$e");
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

   Future<void> refreshUserPosts()async{
// isLoading = true;
errorData = null;
notifyListeners();
    try {
      var result = await postRepository!.getUserPosts(
        getUserId().toString()
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

posts= [];
posts.addAll(success.posts);
notifyListeners();



});

    } catch (e) {

  log("FAILURE POSTS$e");
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

 Future<void> updateProfile(  { File? photo,
 int? typeId,int? genderId,
  String? name, String? userName, 
           String? email, String? countryCode, String? phone})async{
isLoading = true;
errorData = null;
notifyListeners();
    try {
      var result = await userRepository!.updateUser(
type_id: typeId, 
gender_id: genderId,
        phone:countryData!.$2+ phone! ,
         countryCode: countryData!.$3, 
        email: email , 
        name: name , 
        userName: userName, 
        photo: photo

      );
result.fold((failure){


if (failure is UnauthorizedException) {
    logout();
showErrorMessage(navigatorKey.currentContext!,getTranslated("session_expired",
 navigatorKey.currentContext!));
    return;
  }
if(failure is ValidationException){
//handle validation errors


  final errors = Map<String, dynamic>.
  from(json.decode(failure.message));
  for (var error in errors.keys) {
    
    if (error == 'username') {
       userNameError ='';
  for (var userNameValidationError in  errors[error]) {
    log(userNameValidationError);
   
     userNameError =  userNameValidationError +"\n";
  }
 
    }

  if (error == 'photo') {
       phoneError ='';
  for (var photoValidationError in  errors[error]) {
    log(photoValidationError);
   
     photoError =  photoValidationError +"\n";
  }
 
    }
  if (error == 'name') {
       nameError ='';
  for (var nameValidationError in  errors[error]) {
    log(nameValidationError);
   
     nameError =  nameValidationError +"\n";
  }
 
    }
if (error == 'phone') {
       phoneError ='';
  for (var phoneValidationError in  errors[error]) {
   
     phoneError =  phoneValidationError +"\n";
  }
 
    }
if (error == 'email') {
       emailError ='';
  for (var emailValidationError in  errors[error]) {
   
     emailError =  emailValidationError +"\n";
  }
 
    }
  }
 
 
  final errorMessages = errors.entries.map((entry) {
    return '${entry.key}: ${entry.value.join(', ')}';
  }).join('\n');

    notifyListeners();
return;
}
 
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

 Future<void> updateUserGender(  { 
 int? typeId,int? genderId,
  String? name, String? userName, 
           String? email,  String? phone ,String? phoneCountry})async{
isLoading = true;
errorData = null;
notifyListeners();
    try {
      var result = await userRepository!.updateUser(
type_id: typeId, 
gender_id: genderId,
        phone:"${phoneCountry!}$phone",
         countryCode:phoneCountry, 
        email: email , 
        name: name , 
        userName: userName, 
        // photo: photo

      );
result.fold((failure){

if (failure is UnauthorizedException) {
    logout();
showErrorMessage(navigatorKey.currentContext!,getTranslated("session_expired",
 navigatorKey.currentContext!));
    return;
  }
if(failure is ValidationException){
//handle validation errors


  final errors = Map<String, dynamic>.
  from(json.decode(failure.message));
  for (var error in errors.keys) {
    
    if (error == 'username') {
       userNameError ='';
  for (var userNameValidationError in  errors[error]) {
    log(userNameValidationError);
   
     userNameError =  userNameValidationError +"\n";
  }
 
    }

  if (error == 'photo') {
       phoneError ='';
  for (var photoValidationError in  errors[error]) {
    log(photoValidationError);
   
     photoError =  photoValidationError +"\n";
  }
 
    }
  if (error == 'name') {
       nameError ='';
  for (var nameValidationError in  errors[error]) {
    log(nameValidationError);
   
     nameError =  nameValidationError +"\n";
  }
 
    }
if (error == 'phone') {
       phoneError ='';
  for (var phoneValidationError in  errors[error]) {
   
     phoneError =  phoneValidationError +"\n";
  }
 
    }
if (error == 'email') {
       emailError ='';
  for (var emailValidationError in  errors[error]) {
   
     emailError =  emailValidationError +"\n";
  }
 
    }
  }
 
 
  final errorMessages = errors.entries.map((entry) {
    return '${entry.key}: ${entry.value.join(', ')}';
  }).join('\n');

    notifyListeners();
return;
}
 
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


 
Future<void> delete(BuildContext context , 
String? userId,
Function()? onDeleted
 )async{
  isDeleteLoading =true;
  errorData = null;
   

  notifyListeners();
try {

  var result = await  userRepository!.deleteAccount(userId.toString(),
 
   );

  result.fold((failure){


    if (failure is UnauthorizedException ) {
      
  logout();
  showErrorMessage(context, getTranslated('session_expired', context));
      return;
    }
    if(failure is ValidationException){
//handle validation errors


  final errors = Map<String, dynamic>.
  from(json.decode(failure.message));
  for (var error in errors.keys) {
    
    if (error == 'title') {
      //  titleError ='';
  for (var titleValidationError in  errors[error]) {
    log(titleValidationError);
   
    //  titleError =  titleValidationError +"\n";
  }
 
    }


  if (error == 'message') {
      //  messageError ='';
  for (var messageValidationError in  errors[error]) {
   
   
    //  messageError =  messageValidationError +"\n";
  }
 
    }
        notifyListeners();

return;

  }
 
 
  final errorMessages = errors.entries.map((entry) {
    return '${entry.key}: ${entry.value.join(', ')}';
  }).join('\n');




return;



}

if (failure is UnauthorizedException) {
  logout();
}
showErrorMessage(context, failure.message.toString());

  }, (success){
//     selectedCat=null;
// selectedCity=null;
// selectedCountry=null;
// files=[];
notifyListeners();
showSuccessMessage(context, getTranslated("account_deleted", context));
// Navigator.pop(context); 
onDeleted!();


  });
  logout();
} catch (e) {
  

    isDeleteLoading =false;
  notifyListeners();

  showErrorMessage(context, e.toString());
}

  isDeleteLoading =false;
  notifyListeners();
}

}
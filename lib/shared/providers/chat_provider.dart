import 'dart:convert';
import 'dart:developer';

import 'package:deals_and_business/core/error/dio_exceptions.dart';
import 'package:deals_and_business/domain/repositories/post_repository.dart';
import 'package:deals_and_business/domain/repositories/user_repository.dart';
import 'package:deals_and_business/features/splash/view/splash_screen.dart';
import 'package:deals_and_business/main.dart';
import 'package:deals_and_business/shared/widgets/toasts.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class ChatProvider extends ChangeNotifier {
  final PostRepository? postRepository;
  final UserRepository? userRepository;

  ChatProvider({required this.postRepository ,
  required this.userRepository 
  
  });

  bool isLoading = false;

  String? fNameError;
  String? lNameError;
  String? emailError;
  String? messageError;


clearErrors(){
  fNameError=null;
  lNameError=null;
  emailError=null;
  messageError=null;
  notifyListeners();
}
void setFNameError(String? error){
fNameError=error;
notifyListeners();

}
void setLNameError(String? error){
lNameError=error;
notifyListeners();

}void setEmailrror(String? error){
emailError=error;
notifyListeners();

}
void setMessageError(String? error){
messageError=error;
notifyListeners();

}

 
Future<void> sendAdminMessage(BuildContext context ,

{
  String? fName,  
  String? lName , 
  String? email , 
  String? message
}
 )async{
  isLoading= true;
  clearErrors();
try {
  var result = await postRepository!.sendMessageToManagement(
    firstName: fName! , 
    lastName: lName! , 
    email: email!, 
    msg: message! , 
    countryCode: userRepository!.getCountryData().$2 , 
    countryName: userRepository!.getCountryData().$4
  );


  result.fold((failure){
 if(failure is ValidationException){
//handle validation errors


  final errors = Map<String, dynamic>.
  from(json.decode(failure.message));
  for (var error in errors.keys) {
    
    if (error == 'first_name') {
       fNameError ='';
  for (var firstNameValidationError in  errors[error]) {
    log(firstNameValidationError);
   
     fNameError =  firstNameValidationError +"\n";
  }
 
    }
 if (error == 'last_name') {
       lNameError ='';
  for (var lastNameValidationError in  errors[error]) {
    log(lastNameValidationError);
   
     lNameError =  lastNameValidationError +"\n";
  }
 
    }
 if (error == 'email') {
       emailError ='';
  for (var emailValidationError in  errors[error]) {
    log(emailValidationError);
   
     emailError =  emailValidationError +"\n";
  }
 
    }


  if (error == 'message') {
       messageError ='';
  for (var messageValidationError in  errors[error]) {
   
   
     messageError =  messageValidationError +"\n";
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




  }, (success){
    isLoading=false;
notifyListeners();
showSuccessMessage(context, 'Message Sent!');
Navigator.pop(context);

  });
} catch (e) {
  

    isLoading =false;
  notifyListeners();

  showErrorMessage(context, e.toString());
}

  isLoading =false;
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
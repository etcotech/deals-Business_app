import 'dart:convert';
import 'dart:developer';

import 'package:deals_and_business/core/error/dio_exceptions.dart';
import 'package:deals_and_business/core/error/error_handler.dart';
import 'package:deals_and_business/core/error/validation_errors.dart';
import 'package:deals_and_business/domain/repositories/user_repository.dart';
import 'package:deals_and_business/features/auth/views/login_screen.dart';
import 'package:deals_and_business/features/dashboard/view/dashboard.dart';
import 'package:deals_and_business/features/splash/view/splash_screen.dart';
import 'package:deals_and_business/shared/widgets/toasts.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:page_transition/page_transition.dart';

class AuthProvider extends ChangeNotifier {
  final UserRepository? userRepository;

  AuthProvider({required this.userRepository});
  
bool isLoading = false;



String? emailError;
String? passwordError;

resetValidations(){
emailError =null; 
passwordError = null;
notifyListeners();
}

void setEmailError(String? error){
  emailError =error;
  notifyListeners();
}

void setPasswordError(String? error){
  passwordError =error;
  notifyListeners();
}

  login(BuildContext  context , String email , String password)async{
     try {
       isLoading= true;
       emailError=null;
       passwordError=null;
       notifyListeners();
   var loginresult = await userRepository!.signIn(email, password);

 isLoading= false;
       notifyListeners();
  loginresult.fold((failure){
    log("FAILURe${failure.runtimeType}");

showErrorMessage(context, failure.message.toString());
if (failure is ValidationException) {
  
 final errors = Map<String, dynamic>.from(json.decode(failure.message)['errors']);
 
  
  final errorMessages = errors.entries.map((entry) {
    log('${entry.key}: ${entry.value.join(', ')}');
    return '${entry.key}: ${entry.value.join(', ')}';
  }).join('\n');
 
}




  }, (success){


showSuccessMessage(context, 'Login success');

 Navigator.push(context, PageTransition(type: PageTransitionType.fade ,child:  
    Dashboard()));
 
  });


     } catch (e) {
        isLoading= false;
       notifyListeners();

       showErrorMessage(context, e.toString());

     }



  }


  signup(BuildContext  context ,
  String name,
  
   String email , String password)async{
     try {
       isLoading= true;
       emailError=null; 
       passwordError= null;
       notifyListeners();
   var signUpResult = await userRepository!.
   signUp(
    name,
    email, password);

 isLoading= false;
       notifyListeners();
  signUpResult.fold((failure){
log(failure.message.toString());
showErrorMessage(context, 
getErrorMessage(failure.message.toString()));

if (failure is ValidationException) {

  final errors = Map<String, dynamic>.
  from(json.decode(failure.message));
  for (var error in errors.keys) {
    
    if (error == 'email') {
       emailError ='';
  for (var emailValitionError in  errors[error]) {
    log(emailValitionError);
   
     emailError =  emailValitionError +"\n";
  }
 
    }


  if (error == 'password') {
       passwordError ='';
  for (var passwordViationError in  errors[error]) {
    log(passwordViationError);
   
     passwordError =  passwordViationError +"\n";
  }
 
    }


  }
  final errorMessages = errors.entries.map((entry) {
    return '${entry.key}: ${entry.value.join(', ')}';
  }).join('\n');

    notifyListeners();

}


  }, (success){


showSuccessMessage(context, 'success');

 Navigator.pushReplacement(context, PageTransition(type: PageTransitionType.fade ,child:  
    LoginScreen()));
 
  });


     } catch (e) {
      log(e.toString()); 
        isLoading= false;
       notifyListeners();

       showErrorMessage(context,  getErrorMessage(e.toString()));

     }



  }


Future<void> signOut(BuildContext context)async{
  isLoading= true;
  notifyListeners();

  try {
    await userRepository!.signOut();
showSuccessMessage(context, 'you signed out');
  Navigator.push(context,
                  PageTransition(type: PageTransitionType.fade ,child:  
    SplashScreen()));
  } catch (e) {
    showErrorMessage(context, e.toString());
  }
    isLoading= false;
  notifyListeners();

}

}
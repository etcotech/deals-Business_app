import 'package:deals_and_business/core/error/error_handler.dart';
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





  login(BuildContext  context , String email , String password)async{
     try {
       isLoading= true;
       notifyListeners();
   var loginresult = await userRepository!.signIn(email, password);

 isLoading= false;
       notifyListeners();
  loginresult.fold((failure){
Fluttertoast.showToast(
        msg: failure.message.toString(),
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );
showErrorMessage(context, failure.message.toString());
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
       notifyListeners();
   var loginresult = await userRepository!.
   signUp(
    name,
    email, password);

 isLoading= false;
       notifyListeners();
  loginresult.fold((failure){
Fluttertoast.showToast(
        msg:  getErrorMessage(failure.message.toString()),
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );
showErrorMessage(context, 
getErrorMessage(failure.message.toString()));
  }, (success){


showSuccessMessage(context, 'success');

 Navigator.pushReplacement(context, PageTransition(type: PageTransitionType.fade ,child:  
    LoginScreen()));
 
  });


     } catch (e) {
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
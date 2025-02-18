import 'package:deals_and_business/domain/repositories/user_repository.dart';
import 'package:deals_and_business/features/dashboard/view/dashboard.dart';
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
}
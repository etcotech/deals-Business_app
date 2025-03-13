// Password Validator
  import 'package:deals_and_business/core/constants/translate.dart';
import 'package:deals_and_business/main.dart';

String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 
      getTranslated("password_required", navigatorKey.currentContext!);
      
      'Password cannot be empty';
    }
    //  else if (value.length < 6) {
    //   return 'Password must be at least 6 characters long';
    // }
    return null;
  }
  String? confirmPasswordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 
            getTranslated("password_required", navigatorKey.currentContext!);

      'Password cannot be empty';
    }
    //  else if (value.length < 6) {
    //   return 'Password must be at least 6 characters long';
    // }
    return null;
  }
String? phoneFieldValidator(String? value) {
    if (value == null || value.isEmpty) {
      return null;
    } else if (value.length > 9) {
      return
  getTranslated("phone_should_be_9_digits", navigatorKey.currentContext!);
      
      
       'Phone must be  9 digits long';
    }
    return null;
  }

  String? titleValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 
        getTranslated("title_required", navigatorKey.currentContext!);

      'Title cannot be empty';
    } 
    return null;
  }

  String? descValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 
              getTranslated("desc_required", navigatorKey.currentContext!);

      'Description cannot be empty';
    } 
   
    return null;
  }

  String? priceValidator(String? value) {
    if (value == null || value.isEmpty) {
      return
                    getTranslated("price_required", navigatorKey.currentContext!);

       'Price cannot be empty';
    } 
    
    return null;
  }



  // Email Validator
  String? emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return
                                getTranslated("email_required", navigatorKey.currentContext!);

      
       'Email cannot be empty';
    } else if (!RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
        .hasMatch(value)) {
      return 
                          getTranslated("invalid_email", navigatorKey.currentContext!);

      'Enter a valid email';
    }
    return null;
  }
  // Name Validator
  String? nameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return
                                            getTranslated("message_required", navigatorKey.currentContext!);

       'Email cannot be empty';
    } 
    return null;
  }
 String? reportMessageValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 
      
      
                                      getTranslated("message_required", navigatorKey.currentContext!);

      'Message cannot be empty';
    } 
    
    return null;
  }

   String? messageValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 
      
     getTranslated("message_required", navigatorKey.currentContext!);

      'Description cannot be empty';
    } 
    
    return null;
  }
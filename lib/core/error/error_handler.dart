  import 'package:deals_and_business/core/constants/images.dart';
import 'package:deals_and_business/core/constants/strings.dart';

Map<String, List<String>> _errors = {};
  
  
  extension CheckErrorType on String{
    bool isTokenExpired(){
      return toString().contains("token");
      
    }
    bool isInternetError(){
      return toString().contains("internet");
      
    }

  }
  String getErrorIcon(String error){
   if (error.contains('internet')
   ||error.contains('network')) {
     return Images.signal;
   }
   else if(error.contains('token')){
return Images.pedlock;
   }
   else if(error.contains('server')){
return Images.server;
   }
   else{
return Images.server;

   }
  }

    String getErrorMessage(String error){
   if (error.contains('internet')
   ||error.contains('network')
   
   ) {
     return Strings.networkFailureKey;
   }
   else if(error.contains('token')){
     return Strings.tokenExpireKey;
   }
   else if(error.contains("email"))  {
     return Strings.emailAlreadyExists;
   }
   else if(error.contains('server')){
     return Strings.serverFailureKey;
   }
   else{
     return Strings.serverFailureKey;

   }
  }
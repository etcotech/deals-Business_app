import 'package:deals_and_business/core/constants/strings.dart';
import 'package:deals_and_business/core/constants/translate.dart';
import 'package:deals_and_business/core/error/error_handler.dart';
import 'package:deals_and_business/data/models/error_data.dart';
import 'package:deals_and_business/shared/widgets/mini_button.dart';
import 'package:flutter/material.dart';

class ErrorContainer extends StatelessWidget {
  final ErrorData? errorData;
  final Function()? onRetry;
  final Function? onLogin;
  const ErrorContainer({super.key, this.errorData, this.onRetry, this.onLogin});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return SizedBox(

      width: size.width,
      height: size.height/2,

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
Image.asset(errorData!.icon!, 
width: 80,height: 80,
color: const Color.fromARGB(255, 3, 34, 59),
), 
SizedBox(height: 32,), 

SizedBox(
        width: size.width*.80,
child: Text(getTranslated(errorData!.message!, context)!,
style: TextStyle(
  color: Colors.grey ,fontWeight: FontWeight.bold
),
),
), 
SizedBox(height: 32,), 
MiniButton(
  color: Theme.of(context).primaryColor,
  onTap: (){
    if (errorData!.message!.isTokenExpired()) {
      onLogin!();
    }else{
onRetry!();
    }
  },
  title: errorData!.message!.isTokenExpired()?

getTranslated('login_now', context):getTranslated(Strings.retry, context)
  ,
)


        ],
      ),
    );
  }
}
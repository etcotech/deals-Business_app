import 'package:deals_and_business/core/constants/images.dart';
import 'package:deals_and_business/core/constants/strings.dart';
import 'package:deals_and_business/core/constants/translate.dart';
import 'package:deals_and_business/features/auth/views/login_screen.dart';
import 'package:deals_and_business/shared/widgets/mini_button.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class NotAuthenticatedAlertDialog extends StatefulWidget {
  const NotAuthenticatedAlertDialog({super.key});

  @override
  State<NotAuthenticatedAlertDialog> createState() => _NotAuthenticatedAlertDialogState();
}

class _NotAuthenticatedAlertDialogState extends State<NotAuthenticatedAlertDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20), // Rounded corners
        ),
        child: SizedBox(
          height: MediaQuery.sizeOf(context).height*.30,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              // mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(Images.pedlock, 
                color:const Color.fromARGB(255, 13, 39, 61) ,
                width: 100,
                height: 100,
                ),
                SizedBox(height: 10),
                Text(getTranslated(Strings.youHaveToLogin, context)!),
                SizedBox(height: 20),

                MiniButton(
  color: Theme.of(context).primaryColor,
  onTap: (){
   
    Navigator.pushAndRemoveUntil(context, 
    PageTransition(type: PageTransitionType.fade  , 
    
    child: LoginScreen()
    )
    
    , (_)=>false);
  },
  title: 
 getTranslated('login_now', context)
  ,
)
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                //   children: [
                //     TextButton(
                //       onPressed: () {
                //         Navigator.pop(context); // Close the dialog
                //       },
                //       child: Text('Cancel'),
                //     ),
                //     ElevatedButton(
                //       onPressed: () {
                //         // Perform the action
                //         Navigator.pop(context);
                //         ScaffoldMessenger.of(context).showSnackBar(
                //           SnackBar(content: Text('Action performed!')),
                //         );
                //       },
                //       child: Text('Confirm'),
                //     ),
                //   ],
                // ),
             
             
              ],
            ),
          ),
        ),
      );
  }
}
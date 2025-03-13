import 'package:deals_and_business/core/constants/strings.dart';
import 'package:deals_and_business/core/constants/translate.dart';
import 'package:deals_and_business/shared/widgets/back_button.dart';
import 'package:deals_and_business/shared/widgets/main_button.dart';
import 'package:deals_and_business/shared/widgets/password_field.dart';
import 'package:flutter/material.dart';

class ChangeUserPasswordScreen extends StatefulWidget {
  const ChangeUserPasswordScreen({super.key,});

  @override
  State<ChangeUserPasswordScreen> createState() => _ChangeUserPasswordScreenState();
}

class _ChangeUserPasswordScreenState extends State<ChangeUserPasswordScreen> {
  
final TextEditingController _passwordController = TextEditingController();
final TextEditingController _confirmPasswordController = TextEditingController();

  
  
  @override
  Widget build(BuildContext context) {
    return       Scaffold(
backgroundColor: Colors.white,
appBar: AppBar(
backgroundColor: Colors.white,
centerTitle: true,
leading: MyBackButton(
  onTap: (){
    Navigator.pop(context);
  },
),
title: Text(getTranslated(Strings.changeUserType,
 context)!, 
 
 style: TextStyle(
    fontWeight: FontWeight.bold
  ),
 
 )
 
 ),

body: SizedBox.expand(
  child: Column(
    spacing: 16,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [




  Padding(
  padding: const EdgeInsets.symmetric(horizontal: 20),
    child: PasswordField(
                    showVisiblityIcon: false,

      controller:_passwordController ,
             hintText:        
                  getTranslated('password', context)!
    , 
            iconData: Icons.lock_outline,
          //   errorText: provider.passwordError,
          //  validator: (str){
          //            var error=   passwordValidator(str);
          //           //  var 
          //            provider.setPasswordError(error);
          //           //  return null;
          //             return provider.passwordError;
          //             },
            
            ),
  ), 
          Padding(
       padding: const EdgeInsets.symmetric(horizontal: 20),

            child: PasswordField(
              showVisiblityIcon: false,
              controller:_confirmPasswordController , hintText:
                        getTranslated('password_confirm', context)!
            , 
            iconData: Icons.lock_outline,
                  //     errorText: provider.passwordError,
                  //     validator: (value){
            
            
                  //  if (value!= passwordController.text.trim()) {
                  //    return 'passwords not mathches';
                  //  }
            
               
                  //              var error=   passwordValidator(value);
                  //             //  var 
                  //              provider.setPasswordError(error);
                  //             //  return null;
                  //               return provider.passwordError;
                      
                  //       passwordValidator(value);
                  //       return null;
                  //     },
            
            ),
          ), 
         
         
Padding(
  padding: const EdgeInsets.symmetric(horizontal: 20),
  child: MainButton(
    color: Theme.of(context).primaryColor,
    title: getTranslated("save_changes", context),
    onTap: (){
      
    },
  ),
)

    ],
  ),
),

    );
  }
}
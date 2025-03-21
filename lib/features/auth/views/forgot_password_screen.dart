import 'package:deals_and_business/core/constants/strings.dart';
import 'package:deals_and_business/core/constants/translate.dart';
import 'package:deals_and_business/core/constants/validators.dart';
import 'package:deals_and_business/features/auth/providers/auth_provider.dart';
import 'package:deals_and_business/shared/widgets/input_field.dart';
import 'package:deals_and_business/shared/widgets/main_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  var emailController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, provider, child) {
        return Scaffold(
            backgroundColor: Colors.white,
          appBar: AppBar(
            elevation: 0, 
            backgroundColor: Colors.white,
            title:  Text(getTranslated('reset_password', context)!, 
            
            style: TextStyle(
              fontWeight: FontWeight.bold
            ),
            ),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          body: SizedBox.expand(
        
            child: Center(
              child: Form(
                key: formKey,
                
                child: 
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                   Padding(
                    padding: const EdgeInsets.all(20.0),
        child: Text(getTranslated(Strings.enterEmail, context)!, 
        textAlign: TextAlign.start,
        style: TextStyle(
        
          color: Colors.grey ,  
          fontSize: 16
          
        ),
        ),
        
                   ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child:
                    InputField(controller: emailController,
                     hintText: getTranslated(Strings.email, context)! , 
                     errorText: provider.emailError,
                     iconData: Icons.person_outline,
                        validator: (str){
                   var error=   emailValidator(str);
                  //  var 
                   provider.setEmailError(error);
                  //  return null;
                    return provider.emailError;
                    },
        
                     
                     )
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: 
        
                    MainButton(
        isLoading: provider.isLoading,
        onTap: ()async{
          provider.resetValidations();
          if(formKey.currentState!.validate()){
        await    provider.forgotPassowed(context,emailController.text);
          }
        },
                      title: getTranslated(Strings.send, context),
                      color: Theme.of(context).primaryColor,
                    )
                  ),
                ],
              )
              ),
            ),
          )
        );
      }
    );
  }
}
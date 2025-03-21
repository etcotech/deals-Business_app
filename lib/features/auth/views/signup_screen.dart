import 'package:deals_and_business/core/constants/images.dart';
import 'package:deals_and_business/core/constants/translate.dart';
import 'package:deals_and_business/core/constants/validators.dart';
import 'package:deals_and_business/features/auth/providers/auth_provider.dart';
import 'package:deals_and_business/features/language/view/language_screen.dart';
import 'package:deals_and_business/features/settings/views/terms_and_conditions_screen.dart';
import 'package:deals_and_business/shared/widgets/input_field.dart';
import 'package:deals_and_business/shared/widgets/main_button.dart';
import 'package:deals_and_business/shared/widgets/password_field.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {

  var emailController = TextEditingController();
    var passwordController = TextEditingController();
  var nameController = TextEditingController();
  var confirmPasswordController = TextEditingController();
 var formKey = GlobalKey<FormState>();

bool acceptedTerms =false;
bool showAcceptError = false;

  @override
  Widget build(BuildContext context) {

    var provider = Provider.of<AuthProvider>(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0, 
        leading: SizedBox(),
        actions: [
          IconButton(onPressed: (){
  Navigator.push(context, PageTransition(type: PageTransitionType.leftToRight ,child:  
    LanguageScreen()));

          }, icon: Icon(
            Icons.language_outlined
          ))
        ],
      ),

      body: 

      CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: 
      Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 25
        ),
        child: Form(
          key: formKey,
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               SizedBox(height: 50,),      
          Center(
            child: Image.asset(Images.logo2, 
            width: 200,
            ),
          )
          , 
           SizedBox(height: 50,),
           InputField(controller:nameController ,
            hintText:            getTranslated('name', context)!
,
          iconData: Icons.person_outline,
          validator: nameValidator,
          
          ), 
          SizedBox(height: 16,),
          InputField(controller:emailController , 
          errorText: provider.emailError,
          hintText:        
              getTranslated('email', context)!
          , 
          iconData: Icons.email_outlined,
          
                    validator: (str){
                   var error=   emailValidator(str);
                  //  var 
                   provider.setEmailError(error);
                  //  return null;
                    return provider.emailError;
                    },

          ), 
          SizedBox(height: 16,),
          PasswordField(controller:passwordController ,
           hintText:        
                getTranslated('password', context)!
, 
          iconData: Icons.lock_outline,
          errorText: provider.passwordError,
         validator: (str){
                   var error=   passwordValidator(str);
                  //  var 
                   provider.setPasswordError(error);
                  //  return null;
                    return provider.passwordError;
                    },
          
          ), 
           SizedBox(height: 16,),
          PasswordField(controller:confirmPasswordController , hintText:
                      getTranslated('password_confirm', context)!
, 
          iconData: Icons.lock_outline,
          errorText: provider.passwordError,
          validator: (value){


       if (value!= passwordController.text.trim()) {
         return 'passwords not mathches';
       }

   
                   var error=   passwordValidator(value);
                  //  var 
                   provider.setPasswordError(error);
                  //  return null;
                    return provider.passwordError;
                    
            passwordValidator(value);
            return null;
          },
          
          ), 
         
         
         
           SizedBox(height: 24,),
          
               
           Row(
            mainAxisSize: MainAxisSize.min,
            children: [
          Checkbox(
            activeColor: Theme.of(context).primaryColor,
            focusColor:Theme.of(context).primaryColor ,
            value: acceptedTerms, onChanged: (value){
          

          acceptedTerms = value!;
          setState(() {
            
          });
          }) 
          ,



          SizedBox(width: 2,) ,
              
             Text.rich(
              
              
              TextSpan( 
          text:getTranslated('i_read', context)! ,
           style: TextStyle(
            
              fontWeight: FontWeight.bold ,fontSize: 16
             ),
              children: [
          TextSpan(
            recognizer: TapGestureRecognizer()..onTap = (){
                                Navigator.push(context, 
                                
                                PageTransition(type: PageTransitionType.leftToRight, child: TermsAndConditionsScreen())
                                );
                                
                              },
            text: ' ${getTranslated('terms_and_conditions', context)!}', 
            
            style: TextStyle(
            
              color: Theme.of(context).primaryColor ,
              fontWeight: FontWeight.bold ,fontSize: 16
             ),
          )
              ]
            )
            , 
                            overflow: TextOverflow.ellipsis, // Handle overflow
            
            ),
                 
          
          
          
            ],
           ),
showAcceptError?
           Text(
            getTranslated('terms_must_accept', context)!
            
            , 
           
           style: TextStyle(
            color: Colors.red ,
            fontSize: 12
           ),
           ):SizedBox.shrink(),
                     SizedBox(height: 24,),
          
          MainButton(
          isLoading: provider.isLoading,
            onTap: (){
             provider.resetValidations();
              // if (!acceptedTerms) {
                   showAcceptError= !acceptedTerms;
              setState(() {
                
              });
              if (!acceptedTerms) {
                return;
              }
                
              if (formKey.currentState!.validate()) {
                provider.signup(context,
                 nameController.text.trim(), emailController.text.trim(),
                  passwordController.text.trim());
              
              }
            },
            color: Theme.of(context).primaryColor,
            title: 
                        getTranslated('register', context)!

          )
          , 
                
                 
           SizedBox(height: 24,),
          
          
          Center(
            child: Text.rich(TextSpan( 
          text:            getTranslated('have_no_account', context)!
 ,
          
           style: TextStyle(
            
              fontWeight: FontWeight.bold ,fontSize: 16
             ),
              children: [
          TextSpan(
            text: ' ${            getTranslated('login_now', context)!
}', 
            recognizer: TapGestureRecognizer()
          
          ..onTap =(){
              Navigator.pop(context);
          
          },
            style: TextStyle(
              color: Theme.of(context).primaryColor ,
              fontWeight: FontWeight.bold ,fontSize: 16
             ),
          )
              ]
            )),
          ), 
          //  SizedBox(height: 24,),
          // MainButton(
          //   color: Colors.grey[400],
          //   title: AppLocalizations.of(context)!.continue_as_guest,
          // )
          
          
            ],
          ),
        ),
      ),
   
        )
      ],
      )
      
      
      
   
   
    );
  }
}
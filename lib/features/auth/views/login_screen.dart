import 'package:deals_and_business/configs/typography.dart';
import 'package:deals_and_business/core/constants/images.dart';
import 'package:deals_and_business/core/constants/translate.dart';
import 'package:deals_and_business/core/constants/validators.dart';
import 'package:deals_and_business/features/auth/providers/auth_provider.dart';
import 'package:deals_and_business/features/auth/views/signup_screen.dart';
import 'package:deals_and_business/features/dashboard/view/dashboard.dart';
import 'package:deals_and_business/features/language/view/language_screen.dart';
import 'package:deals_and_business/shared/widgets/input_field.dart';
import 'package:deals_and_business/shared/widgets/main_button.dart';
import 'package:deals_and_business/shared/widgets/password_field.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  var emailController = TextEditingController();
    var passwordController = TextEditingController();
var formKey =  GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var authProvider =  Provider.of<AuthProvider>(context);
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
          InputField(controller:emailController ,
           hintText:getTranslated('name_or_email', context)!, 
          iconData: Icons.email_outlined,
          
          validator: emailValidator,
          ), 
          SizedBox(height: 16,),
          PasswordField(controller:passwordController , 
          hintText: getTranslated('password', context)!, 
          iconData: Icons.lock_outline,
         validator:  passwordValidator
          
          ), 
          
           SizedBox(height: 32,),
          MainButton(  
            
            isLoading: authProvider.isLoading,
             onTap: (){
               if (formKey.currentState!.validate()) {
            authProvider.login(context, emailController.text.trim(), 
            
            passwordController.text.trim()
            );
          }
            },
            color: Theme.of(context).primaryColor,
            title: getTranslated('login', context)!,
          )
          , 
           SizedBox(height: 16,),
          
          TextButton(onPressed: (){
         
          }, child: Text(
            getTranslated('forgot_password', context)!, 
             style: TextStyle(
              color: Theme.of(context).primaryColor ,
              fontWeight: FontWeight.bold ,fontSize: 16
             ),
          )),
           SizedBox(height: 24,),
          Center(
            child:
            
             Text.rich(TextSpan( 
          text:getTranslated('have_no_account', context)!,
           style:
          
            TextStyle(
            
              fontWeight: FontWeight.bold ,fontSize: 16
             )
             
             ,
              children: [
          TextSpan(
            text: ' ${getTranslated('register_now', context)!}', 
          recognizer: TapGestureRecognizer()
          
          ..onTap =(){
              Navigator.push(context, PageTransition(type: PageTransitionType.leftToRight ,
              child:    SignupScreen()));
          
          },
            style: TextStyle(
              color: Theme.of(context).primaryColor ,
              fontWeight: FontWeight.bold ,fontSize: 16
             ),
            
          )
          
              ]
            )),
                 
                 
          ), 
           SizedBox(height: 24,),
          MainButton(
         onTap: (){
            Navigator.push(context, PageTransition(type: PageTransitionType.leftToRight ,
              child:    Dashboard(
                asGuest: true,
              )));
         },
            color: Colors.grey[400],
            title:getTranslated('continue_as_guest', context)!,
          )
          
          
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
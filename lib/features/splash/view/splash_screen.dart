import 'package:deals_and_business/core/constants/images.dart';
import 'package:deals_and_business/features/auth/views/login_screen.dart';
import 'package:deals_and_business/features/dashboard/view/dashboard.dart';
import 'package:deals_and_business/features/language/view/language_screen.dart';
import 'package:deals_and_business/features/splash/providers/splash_provider.dart';
import 'package:deals_and_business/packages/ripple_effect/src/ripple_effect.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
    final pageKey = RipplePage.createGlobalKey();
  final effectKey = RippleEffect.createGlobalKey();

 @override
 void initState() { 
   super.initState();
   

  WidgetsBinding.instance.addPostFrameCallback((_){
Future.delayed(Duration(seconds: 5), (){
init();
});
  });
 }
init(){
  var provider = Provider.of<SplashProvider>(context ,listen: false);
if (provider.isFirstTime()) {
   RippleEffect.start(effectKey, (){

  Navigator.push(context, PageTransition(type: PageTransitionType.fade ,child:  
    LanguageScreen(fromSplash: true,)));
 });


  return;
}
if (provider.isLoggedIn()) {
   RippleEffect.start(effectKey, (){

  Navigator.push(context, PageTransition(type: PageTransitionType.fade ,child:  
    Dashboard()));
 });


  return;
}


  
   RippleEffect.start(effectKey, (){

  Navigator.push(context, PageTransition(type: PageTransitionType.fade ,child:    LoginScreen()));
 });
}


  @override
  Widget build(BuildContext context) {
    return RipplePage( pageKey: pageKey,
      child: Scaffold(
               backgroundColor:Theme.of(context).primaryColor,
        body: Center(
child: Image.asset(Images.logo2, 
width: 200,
)

        ),
        floatingActionButton: RippleEffect(
          animationDuration: Duration(milliseconds: 800),
          delay: Duration.zero,
          pageKey: pageKey,
          effectKey: effectKey,
        
          color:Colors.white,
          child: SizedBox(),
        )
      ),
    );
  }
}
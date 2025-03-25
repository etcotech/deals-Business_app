import 'dart:developer';
import 'dart:io';

import 'package:deals_and_business/core/constants/images.dart';
import 'package:deals_and_business/core/constants/strings.dart';
import 'package:deals_and_business/core/services/remote_config_services.dart';
import 'package:deals_and_business/features/auth/views/login_screen.dart';
import 'package:deals_and_business/features/dashboard/view/dashboard.dart';
import 'package:deals_and_business/features/language/view/language_screen.dart';
import 'package:deals_and_business/features/splash/providers/splash_provider.dart';
import 'package:deals_and_business/features/version/views/new_version_screen.dart';
import 'package:deals_and_business/packages/ripple_effect/src/ripple_effect.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
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

Future<bool>  
checkVersion()async{
// Firebase.initializeApp();
   //firebase get app version and build number
  PackageInfo packageInfo = await PackageInfo.fromPlatform();
final remoteConfig = RemoteConfigServices();

var appleRevarmoteBuild =remoteConfig.getValue(Strings.appleCurrentBuild);
var googleRemoteBuild=remoteConfig.getValue(Strings.googleCurrentBuild);
var googleRemoteVersion=remoteConfig.getValue(Strings.googleCurrentVersion);
var appleRemoteVersion= remoteConfig.getValue(Strings.appleCurrentVersion);
log("APPL VERSON $appleRemoteVersion");
log("APPL BUILD $appleRevarmoteBuild");
log("GOOGLE VERSON $googleRemoteVersion");
log("GOOGLE BUILD $googleRemoteBuild");





String appName = packageInfo.appName;
String packageName = packageInfo.packageName;
String version = packageInfo.version;
String buildNumber = packageInfo.buildNumber;
var localBuild = packageInfo.buildNumber;
var localVersion = packageInfo.version;
bool isOldVersion= Platform.isIOS?
"$appleRemoteVersion+$appleRevarmoteBuild" !=  "$localVersion+$localBuild"
: 
"$googleRemoteVersion+$googleRemoteBuild" !=  "$localVersion+$localBuild"
;


 
  return    isOldVersion;

}

init()async{

 var isOldVersion =await checkVersion();
 
 

  if (isOldVersion) {
    log("OLD VERSION");
   RippleEffect.start(effectKey, (){

  Navigator.push(context, PageTransition(type: PageTransitionType.fade ,child:  
    NewVersionScreen()));
 });
 
 
     
      return;
  }
//  return;


 else{
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


  // return;
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
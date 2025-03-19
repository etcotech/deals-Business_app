import 'package:deals_and_business/core/constants/strings.dart';
import 'package:deals_and_business/core/constants/translate.dart';
import 'package:deals_and_business/features/settings/views/account_settings.dart';
import 'package:deals_and_business/features/settings/views/faq_screen.dart';
import 'package:deals_and_business/features/settings/views/privacy_policty_screen.dart';
import 'package:deals_and_business/features/settings/views/spam_policy_screen.dart';
import 'package:deals_and_business/features/settings/views/terms_and_conditions_screen.dart';
import 'package:deals_and_business/shared/widgets/back_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:page_transition/page_transition.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
backgroundColor: Colors.white,
appBar: AppBar(
backgroundColor: Colors.white,
centerTitle: true,
leading: MyBackButton(
  onTap: (){
    Navigator.pop(context);
  },
),
title: Text(getTranslated(Strings.settings,
 context)!, 
 
 style: TextStyle(
    fontWeight: FontWeight.bold
  ),
 
 )
 
 ),

 body: SizedBox.expand(


  child: Column(
    spacing: 8,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [

    SizedBox(height: 24,),


_title(context, Strings.accountSettings, Icons.person, (){

  Navigator.of(context).push(

    PageTransition(type: PageTransitionType.leftToRight, 
    
    child: AccountSettings()
    )
  );
}),
_title(context, Strings.faq, Icons.question_mark, (){

    Navigator.push(context,
  
  
   PageTransition(type: PageTransitionType.leftToRight , 
   
   child: FaqScreen()
   ));
}),
_title(context, Strings.privacy, Icons.fingerprint, (){

  Navigator.push(context,
  
  
   PageTransition(type: PageTransitionType.leftToRight , 
   
   child: PrivacyPolictyScreen()
   ));
}),
_title(context, Strings.terms, Icons.policy, (){
  Navigator.push(context,
  
  
   PageTransition(type: PageTransitionType.leftToRight , 
   
   child: TermsAndConditionsScreen()
   ));
}),

_title(context, Strings.scam_ploicy, FontAwesomeIcons.shield, (){

  Navigator.of(context).push(

    PageTransition(type: PageTransitionType.leftToRight, 
    
    child: SpamPolicyScreen()
    )
  );
}),



  ],),
 ),
    );
  }

  Widget _title(BuildContext context,String key , IconData iconData , Function? onTap){
    return GestureDetector(
      onTap: (){
        onTap!();
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8,  vertical: 10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(iconData, size: 20, color: Theme.of(context).primaryColor,),
        SizedBox(width: 8,)
        , 
        Text(getTranslated(key, context)!,
        style: TextStyle(
          fontWeight: FontWeight.bold ,
          fontSize: 14
        ),
        )
          ],
        ),
      ),
    );
  }



}
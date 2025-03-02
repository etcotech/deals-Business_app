import 'package:deals_and_business/core/constants/translate.dart';
import 'package:deals_and_business/features/auth/views/login_screen.dart';
import 'package:deals_and_business/features/language/providers/language_provider.dart';
import 'package:deals_and_business/features/splash/providers/splash_provider.dart';
import 'package:deals_and_business/shared/widgets/back_button.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class LanguageScreen extends StatefulWidget {
  final bool? fromSplash;
  const LanguageScreen({super.key, this.fromSplash=false});

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
appBar: AppBar(
  leading:
  widget.fromSplash!?
  SizedBox():
  MyBackButton(
    onTap:(){
      Navigator.pop(context);
    },
  ),
  
  //  SizedBox(),
  title: Text( 
    widget.fromSplash!?
    getTranslated('language', context)!:
    getTranslated('change_language', context)!, 
    
    style: TextStyle(fontWeight: FontWeight.bold),
    ),
centerTitle: true,
elevation: 0.0,
        backgroundColor: Colors.white,

),

body: SizedBox.expand(
  child: Consumer<LanguageProvider>(
    builder: (context, locale , child) {
      return ListView(
        children:  locale.getLanguages().map((lang){

return   Container(
  height: 50,
  width: MediaQuery.sizeOf(context).width,
  padding: const EdgeInsets.symmetric(

    vertical: 12,
    
      horizontal: 25
  ),
  child:InkWell(
    onTap: (){
      locale.setCurrentLocale(lang['key']);
  
      setState(() {
        
      });
        var provider = Provider.of<SplashProvider>(context ,listen: false);
  
  
        
  provider.setISFistTime(false);
  
  // if (!widget.fromSplash!) {
  //   Navigator.pop(context);
  //   return;
  // }
    // Navigator.push(context, PageTransition(type: PageTransitionType.fade ,child:    LoginScreen()));
  
  
    },
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      children: [
    Text(
    
      lang['key']=="ar"?
       getTranslated('arabic', context)!
      :
            getTranslated('english', context)!
    
    
    , style: TextStyle(
    fontWeight: FontWeight.bold
    ),
      // lang['translate']
    ), 
    
    
    
    Visibility(
      visible: lang['key']==locale.loadCurrentLocal(context),
      child: 
    Icon(Icons.check ,color: Colors.green,)
    )
      ],
    ),
  ),
)
;
        }).toList()
      
      
      );
    }
  )
),


    );
  }
}
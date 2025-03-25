import 'dart:io';

import 'package:deals_and_business/core/constants/images.dart';
import 'package:deals_and_business/core/constants/translate.dart';
import 'package:deals_and_business/shared/widgets/main_button_with_icon.dart';
import 'package:flutter/material.dart';

class NewVersionScreen extends StatefulWidget {
  const NewVersionScreen({super.key});

  @override
  State<NewVersionScreen> createState() => _NewVersionScreenState();
}

class _NewVersionScreenState extends State<NewVersionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Theme.of(context).primaryColor,
      body: SizedBox.expand(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
children: [
  Spacer(),
Image.asset(Images.logo2, height: 200,), 
SizedBox(height: 16,), 
Text(getTranslated("new_update_available", context)!, 

style: TextStyle(
  fontSize: 12,  color: Colors.grey[800]
),
),
SizedBox(height: 16,), 
Padding(
  padding:  EdgeInsets.symmetric(horizontal: 20 ,),
  child: Column(
    children: [
      Text(getTranslated("please_update_app", context)!, 
  
  style: TextStyle(
    fontSize: 18,  fontWeight: FontWeight.bold
  ),
  ),
  SizedBox(height: 16,), 
  Text(
    
  Platform.isAndroid
  ?
  
    getTranslated("update_from_store_google", context)!:
  
    getTranslated("update_from_store_apple", context)!
  ,  textAlign: TextAlign.center,
  style: TextStyle(
    fontSize: 14,  fontWeight: FontWeight.w400
  ),
  ),
  
    ],
  ),
),

Spacer(), 

Padding(
  padding:  EdgeInsets.symmetric(horizontal: 20 ,),
  child: MainButtonWithIcon(
    color:Colors.black, 
    icon: Icons.update,
    title: getTranslated('update_now', context),
  onTap: (){
if(Platform.isAndroid){

}else{
  
}

  },
  ),
),


SizedBox(height: 100,)
],

        ),
      ),
    );
  }
}
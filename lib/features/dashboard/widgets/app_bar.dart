import 'package:deals_and_business/shared/widgets/back_button.dart';
import 'package:deals_and_business/shared/widgets/menu_button.dart';
import 'package:flutter/material.dart';

PreferredSizeWidget MyAppBar(BuildContext context,
   {String? title,Function? onTapDrawer, Function? onCountryTap, bool isGuest=false ,
   
   final String? currentCountry
   })

 {
    return 
      
      AppBar(
  leading:
  !isGuest?
  MenuButton(
    onTap: (){
      onTapDrawer!();
    },
  ):
  MyBackButton(
    onTap:(){
      Navigator.pop(context);
    },
  ),
  
  //  SizedBox(),
  title: Text(title!,
  style: TextStyle(
    fontWeight: FontWeight.bold
  ),
  
  ),
centerTitle: true,
elevation: 0.0,
        backgroundColor: Colors.white,


actions: [

  currentCountry!=null?
  Center(child: Padding(
    padding: const EdgeInsets.all(5.0),
    child: GestureDetector(
      onTap: (){
        onCountryTap!();
      },
      child: Image.asset(currentCountry , 
      
      height: 30 ,
      
      
      ),
    ),
  )):SizedBox.fromSize()
],
);

  }

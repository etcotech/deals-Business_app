import 'package:deals_and_business/shared/widgets/back_button.dart';
import 'package:deals_and_business/shared/widgets/menu_button.dart';
import 'package:flutter/material.dart';

PreferredSizeWidget MyAppBar(BuildContext context,
   {String? title,Function? onTapDrawer, Function? onCountryTap, bool isGuest=false})

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
  title: Text(title!,),
centerTitle: true,
elevation: 0.0,
        backgroundColor: Colors.white,



);

  }

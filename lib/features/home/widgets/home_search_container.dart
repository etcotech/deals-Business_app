import 'package:deals_and_business/core/constants/translate.dart';
import 'package:flutter/material.dart';

class HomeSearchContainer extends StatelessWidget {
  const HomeSearchContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(

      width: MediaQuery.sizeOf(context).width,
      height: MediaQuery.sizeOf(context).height/5,
      padding: EdgeInsets.symmetric(
        horizontal: 8,vertical: 16
      ),
      decoration: BoxDecoration(
        color:Colors.black54,

        
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
Text(getTranslated('promote_text1', context)!,  style: TextStyle(
  color: Theme.of(context).primaryColor
),)
, 
SizedBox(height: 8,), 
Text(getTranslated('promote_text1', context)!,  style: TextStyle(
  color: Theme.of(context).primaryColor
),)
        ],
      ),
    );
  }
}
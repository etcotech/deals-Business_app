import 'package:deals_and_business/core/constants/translate.dart';
import 'package:flutter/material.dart';

class HomeSearchContainer extends StatelessWidget {
  const HomeSearchContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(

      width: MediaQuery.sizeOf(context).width,
      height: MediaQuery.sizeOf(context).height/4.5,
      padding: EdgeInsets.symmetric(
        horizontal: 8,vertical: 16
      ),
      decoration: BoxDecoration(
        color:Colors.black87,

        
      ),

      child: Column(
        spacing: 5,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
Text(getTranslated('promote_text1', context)!,

textAlign: TextAlign.center,

  style: TextStyle(
  color: Theme.of(context).primaryColor
),)
, 
SizedBox(height: 8,), 
Text(getTranslated('promote_text2', context)!,  style: TextStyle(
  color: Colors.white54
),), 
Container(
  padding: EdgeInsets.all(8),
  width: MediaQuery.sizeOf(context).width,
  height: 50,
  decoration: BoxDecoration(
    color: Colors.white, 
    borderRadius: BorderRadius.circular(10)
  ),

  child: Row(
  crossAxisAlignment: CrossAxisAlignment.center,

    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [

      Text(getTranslated('search_now', context)!,style: TextStyle(
        color: Colors.grey,

        fontSize: 15
      ),), 
Icon(Icons.search ,  color: Colors.grey, )
    ],
  ),
)
        ],
      ),
    );
  }
}
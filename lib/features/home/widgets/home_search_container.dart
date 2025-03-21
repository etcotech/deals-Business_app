import 'package:deals_and_business/core/constants/translate.dart';
import 'package:deals_and_business/features/search/views/advance_search_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class HomeSearchContainer extends StatelessWidget {
  const HomeSearchContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.of(context).push(

          PageTransition(type: PageTransitionType.leftToRight , 
          child: AdvanceSearchScreen(
            fromDashboard: false,
          )
          )
        );


      },
      child: Container(
      
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height/4.2,
        padding: EdgeInsets.symmetric(
          horizontal: 8,vertical: 16
        ),
        decoration: BoxDecoration(
          color:Colors.black87,
      
          
        ),
      
        child: Column(
          spacing: 16,
          
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
      Text(getTranslated('promote_text1', context)!,
      
      textAlign: TextAlign.center,
      
        style: TextStyle(
        color: Theme.of(context).primaryColor
      ),)
      , 
      // SizedBox(height: 8,), 
      Text(getTranslated('promote_text2', context)!,  style: TextStyle(
        color: Colors.white54
      ),), 

            // SizedBox(height: 16,), 

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
         ,
        SizedBox(height: 8,), 

          ],
        ),
      ),
    );
  }
}
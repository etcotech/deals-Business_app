import 'package:deals_and_business/core/constants/images.dart';
import 'package:deals_and_business/core/constants/strings.dart';
import 'package:deals_and_business/core/constants/translate.dart';
import 'package:flutter/material.dart';

class ContactWithUsButton extends StatelessWidget {
  final String? price;
final Function? onTap;
  const ContactWithUsButton({super.key, this.onTap, this.price});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: 
      
      
      TextDirection.ltr,
      child: Container(
      
        width: MediaQuery.sizeOf(context).width*.25,
        height: 50,
        decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15), 
      color: Theme.of(context).primaryColor
        ),
        child: Center(child:
        price== null 
        
        || double.tryParse(price.toString())==0.0
        
        ? Text(
          getTranslated(Strings.free, context)!
          , 
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold
          ),
        ):
        
         Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Image.asset(Images.currency,
             width: 20,
             height: 20,
             color: Colors.white,
             ),
      SizedBox(width: 5,),
            Text(
             
              price.toString()
              // getTranslated(Strings.contactUs, context)!
              , 
            
              style: TextStyle(
                color: Colors.white ,
                fontWeight: FontWeight.bold
              ),
            ),
          ],
        ),),
      ),
    );
  }
}
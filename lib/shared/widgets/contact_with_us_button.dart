import 'package:deals_and_business/core/constants/strings.dart';
import 'package:deals_and_business/core/constants/translate.dart';
import 'package:flutter/material.dart';

class ContactWithUsButton extends StatelessWidget {
final Function? onTap;
  const ContactWithUsButton({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(

      width: MediaQuery.sizeOf(context).width*.15,
      height: 50,
      decoration: BoxDecoration(
borderRadius: BorderRadius.circular(15), 
color: Theme.of(context).primaryColor
      ),
      child: Center(child: Text(
        getTranslated(Strings.contactUs, context)!, 

        style: TextStyle(
          color: Colors.white ,
          fontWeight: FontWeight.bold
        ),
      ),),
    );
  }
}
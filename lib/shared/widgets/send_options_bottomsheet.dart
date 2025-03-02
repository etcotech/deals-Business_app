import 'package:deals_and_business/core/constants/strings.dart';
import 'package:deals_and_business/core/constants/translate.dart';
import 'package:deals_and_business/features/contact/views/contact_with_admins_screen.dart';
import 'package:deals_and_business/features/contact/views/contact_with_seller_screen.dart';
import 'package:deals_and_business/features/messages/views/messages_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:url_launcher/url_launcher.dart';

class SendOptionsBottomSheet extends StatefulWidget {
  final String? postId;
  final String? postEmail;
  const SendOptionsBottomSheet({super.key, this.postId, this.postEmail});

  @override
  State<SendOptionsBottomSheet> createState() => _SendOptionsBottomSheetState();
}

class _SendOptionsBottomSheetState extends State<SendOptionsBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
           width:MediaQuery.sizeOf(context).width ,
            height: MediaQuery.sizeOf(context).height*.20,
            padding: EdgeInsets.only(
          
              top: 8, left: 15,right: 15,
                                      // bottom: MediaQuery.of(context).viewInsets.bottom
          
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(20),
            ),
            ), 
            child:
            
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                SizedBox(height: 8,),
Center(
  child: Text(getTranslated(Strings.contactWithSeller, context)!,
  style:TextStyle(
    color: Colors.grey , fontWeight: FontWeight.w700
  ),
  
  ),
),
                SizedBox(height: 16,),


GestureDetector(
  onTap: (){
_openGmailWithPrefilledEmail();
  },
  child: SizedBox(
    height: 50,
    child: Row(
      spacing: 16,
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
    Icon(Icons.mail,  color: Theme.of(context).primaryColor,), 
    Text(getTranslated(Strings.sendEmail, context)!, 
    
    style: TextStyle(
      fontWeight: FontWeight.bold
    ),
    )
      ],
    ),
  ),
)



,
GestureDetector(
  onTap: (){
    Navigator.of(context).push(

      PageTransition(type: PageTransitionType.leftToRight, 
      
      child: ContactWithSellerScreen(
        postId: widget.postId,
      )
      )
    );
  },
  child: SizedBox(
    height: 50,
    child: Row(
      spacing: 16,
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
    Icon(Icons.message,  color: Theme.of(context).primaryColor,), 
    Text(getTranslated(Strings.send_message, context)!, 
    
    style: TextStyle(
      fontWeight: FontWeight.bold
    ),
    )
      ],
    ),
  ),
)





              ],
            )
            ,
    );
  }
Future<void> _launchUrl() async {
  if (!await launchUrl(Uri.parse("mailto:${widget.postEmail}"))) {
    throw Exception('Could not launch "mailto:${widget.postEmail}"');
  }
}

  Future<void> _openGmailWithPrefilledEmail() async {
  // Define the email details
  var email = widget.postEmail;
  
  // Create the mailto URL
  final Uri emailUri = Uri(
    scheme: 'mailto',
    path: email,
    
  );

  // Check if the URL can be launched
  if (await canLaunch(emailUri.toString())) {
    await launch(emailUri.toString());
  } else {
    throw 'Could not launch $emailUri';
  }

  
}
}
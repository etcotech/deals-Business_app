import 'package:deals_and_business/core/constants/images.dart';
import 'package:deals_and_business/data/models/post/message_model.dart';
import 'package:deals_and_business/features/messages/views/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class MessagePreviewWidget extends StatelessWidget {

  final MessageModel? messageModel;
  const MessagePreviewWidget({super.key, this.messageModel});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){

          Navigator.of(context).push(

          PageTransition(type: PageTransitionType.fade , 
          
          
          child: ChatScreen(
            messageModel: messageModel,
          )), 
      
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, 
        vertical: 15
        
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          spacing: 16,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
        CircleAvatar(
          radius: 40,
          backgroundImage:   
          messageModel!.pCreator!.photoUrl!=null?
        NetworkImage(messageModel!.pCreator!.photoUrl!)
        :AssetImage(Images.user)
          
          ,
        )
        ,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
      
      
            Text(messageModel!.subject.toString(), 
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 16 , fontWeight: FontWeight.bold
            ),
            ), 
       SizedBox(
              width: 250,
        child: Text(messageModel!.latestMessage!.body.toString(), 
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 14 , fontWeight: FontWeight.w500, 
                color: Colors.grey
              ),
              ),
      ), 
      
      
          ],
        )
        
        
        
          ],
        ),
      ),
    );
  }
}
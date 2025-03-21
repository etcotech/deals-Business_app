import 'package:cached_network_image/cached_network_image.dart';
import 'package:deals_and_business/core/constants/images.dart';
import 'package:deals_and_business/data/models/post/thread_message_model.dart';
import 'package:deals_and_business/features/profile/providers/profile_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatMessageContainer extends StatefulWidget {
  final bool? isMe;
  final ThreadMessageModel? threadMessageModel;
  const ChatMessageContainer({super.key, this.isMe, this.threadMessageModel});

  @override
  State<ChatMessageContainer> createState() => _ChatMessageContainerState();
}

class _ChatMessageContainerState extends State<ChatMessageContainer> {
  @override
  Widget build(BuildContext context) {
        var profileProvider = Provider.of<ProfileProvider>(context);

    return 
    
    Align(
      alignment:
      widget.isMe!?
       Alignment.centerRight: Alignment.centerLeft, 
 child: Column(

  mainAxisSize: MainAxisSize.min,
spacing: 8,
  children: [

//Row
Row(
  mainAxisSize: MainAxisSize.min,
  crossAxisAlignment: CrossAxisAlignment.center,
  mainAxisAlignment: MainAxisAlignment.center,
  spacing: 5,
  children: [
    Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.white, 
        shape: BoxShape.circle
      ),
      child: CircleAvatar(
        radius: 20,
        backgroundImage: 

        widget.isMe!?
        profileProvider.getUserPhoto()!.isEmpty?
       CachedNetworkImageProvider(Images.user): 

       CachedNetworkImageProvider(profileProvider.getUserPhoto()!)
:        AssetImage(Images.user)



        
        ,
      ),
    )
  
  , 

  Column( crossAxisAlignment: CrossAxisAlignment.start,
    children: [
Text(widget.threadMessageModel!.user!.name!, 
style: TextStyle(
  fontWeight: FontWeight.bold
),

), 
Text(widget.threadMessageModel!.pRecipient!.createdAtFormatted!, 
style: TextStyle(
  fontWeight: FontWeight.w500, color: Colors.grey
),

), 

    ],
  )
  
  ],
)
,
Align(
 alignment:  widget.isMe!?
       Alignment.centerLeft: Alignment.centerRight, 
child: Container(
  padding: EdgeInsets.all(8),
constraints: BoxConstraints(
  maxWidth: MediaQuery.sizeOf(context).width*.60, 
  minWidth: MediaQuery.sizeOf(context).width*.15
),
  decoration: BoxDecoration(
    color: Colors.amber[100], 
    borderRadius:
    widget.isMe!?
    
     BorderRadius.only(
bottomRight:Radius.circular(50),
topRight:Radius.zero ,
bottomLeft: Radius.circular(50), 
topLeft: Radius.circular(50), 

    ):
     BorderRadius.only(
bottomRight:Radius.circular(50),
topRight:Radius.circular(50) ,
bottomLeft: Radius.circular(50), 
topLeft: Radius.zero, 

    )
  ), 

  child: Text(
    widget.threadMessageModel!.body.toString(), 

    style: TextStyle(
      fontWeight: FontWeight.bold
    ),
  ),
),
)

  ],
 ),

    );
  }
}
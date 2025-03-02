import 'package:deals_and_business/core/constants/validators.dart';
import 'package:deals_and_business/data/models/post/message_model.dart';
import 'package:deals_and_business/features/auth/views/login_screen.dart';
import 'package:deals_and_business/features/messages/widgets/chat_message_container.dart';
import 'package:deals_and_business/features/profile/providers/profile_provider.dart';
import 'package:deals_and_business/shared/providers/post_provider.dart';
import 'package:deals_and_business/shared/widgets/back_button.dart';
import 'package:deals_and_business/shared/widgets/delete_chat_button.dart';
import 'package:deals_and_business/shared/widgets/error_container.dart';
import 'package:deals_and_business/shared/widgets/input_field_no_icon.dart';
import 'package:deals_and_business/shared/widgets/phone_field.dart';
import 'package:deals_and_business/shared/widgets/send_button.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class ChatScreen extends StatefulWidget {
  final MessageModel? messageModel;
  const ChatScreen({super.key, this.messageModel});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _textController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_){

context.read<PostProvider>().getThreadMessages(context, widget.messageModel!.latestMessage!.threadId.toString());



    });
  }
  @override
  Widget build(BuildContext context) {
    var profileProvider = Provider.of<ProfileProvider>(context);
    return Consumer<PostProvider>(

      builder: (context , provider,child) {

        if (provider.isLoading) {
          return Scaffold(
            body: SizedBox.expand(
              child: Center(child: CircularProgressIndicator(
                color: Theme.of(context).primaryColor,
              ),),
            ),
          );
        }

      if (provider.errorData!=null) {
    return Scaffold(
      body: Center(
        child: ErrorContainer(
          errorData: provider.errorData,
          onRetry: (){
                  context.read<PostProvider>().getMessages(context);
      
          },
          onLogin: (){
          
      
          Navigator.of(context).pushAndRemoveUntil(
      
            PageTransition(type: PageTransitionType.fade , 
            
            
            child: LoginScreen()), 
            (_)=> false
          );
          },
        ),
      ),
    );
  }


        return Scaffold(
          appBar:   AppBar(
            actions: [
              DeleteChatButton(
                onTap: (){

                },
              )
            ],
            leading: MyBackButton(
        
              onTap: (){
                Navigator.pop(context);
              },
            ),
            title: Text(
              
              widget.messageModel!.pCreator!.name!, 
              style: TextStyle(
                fontWeight: FontWeight.bold
              ),
            ),
          ),
          body: Column(
            children: [
        Expanded(child: ListView.builder(
        reverse: true,
          itemCount: provider.threadMessages.length,
          itemBuilder: (BuildContext context, int index) {
            var message= provider.threadMessages[index];
            return 
            ChatMessageContainer(
              isMe: 
              message.userId.toString()==profileProvider.getUserId()
              
              ,threadMessageModel: message,
            );
            
          },
        ),), 
        
        // Divider(), 
        Form(
          key: formKey,
          child: Container(
              margin: EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                children: [
                  Flexible(
                    child:
                    
                     InputFieldNoIcon(
                      
                      validator: messageValidator,
                      controller: _textController, 
                     hintText: 'send a message')
                  ),
                 
                 SizedBox(width: 8,), 
                 SendButton(
                  onTap: (){
                   if (formKey.currentState!.validate()) {
                      provider.sendChatMessage(context,
                     widget.messageModel!.latestMessage!.threadId!.toString(),
                     
                      profileProvider.getUserName(),
                       _textController.text, profileProvider.getUserEmail());
          
                 _textController.clear();
                   }
                  },
                 )
                ],
              ),
          ),
        ),
        SizedBox(height: MediaQuery.of(context).viewPadding.bottom,)
            ],
          ),
        );
      }
    );
  }
}
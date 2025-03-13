import 'package:deals_and_business/core/constants/strings.dart';
import 'package:deals_and_business/core/constants/translate.dart';
import 'package:deals_and_business/core/constants/validators.dart';
import 'package:deals_and_business/features/dashboard/widgets/app_bar.dart';
import 'package:deals_and_business/shared/providers/post_provider.dart';
import 'package:deals_and_business/shared/widgets/back_button.dart';
import 'package:deals_and_business/shared/widgets/input_area_with_icon.dart';
import 'package:deals_and_business/shared/widgets/input_field.dart';
import 'package:deals_and_business/shared/widgets/input_field_no_icon.dart';
import 'package:deals_and_business/shared/widgets/main_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ContactWithSellerScreen extends StatefulWidget {
  final String? postId;
  const ContactWithSellerScreen({super.key, this.postId});

  @override
  State<ContactWithSellerScreen> createState() => _ContactWithSellerScreenState();
}

class _ContactWithSellerScreenState extends State<ContactWithSellerScreen> {

  //fields
  var namecontroller = TextEditingController();
  var messageController = TextEditingController();
    var emailController = TextEditingController();

 var formKey = GlobalKey<FormState>();




  @override
  Widget build(BuildContext context) {
    return Consumer<PostProvider>(
      builder: (context,provider,child) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.white,
          appBar:AppBar(
        
            leading: MyBackButton(
              onTap: (){
                Navigator.pop(context);
              },
            ),
          
          title: Text(
            getTranslated("contact_with_seller", context)! ,
        
            style: TextStyle(
              fontWeight: FontWeight.bold
            ),
          ), 
          ),
        body: Builder(builder: (context){
        if (false) {
          return  SizedBox.expand(child: CircularProgressIndicator(
        color: Theme.of(context).primaryColor
          ),);
        }
        else {
          return SingleChildScrollView(
        padding:  EdgeInsets.only(
          left: 16, right: 16,      bottom: MediaQuery.of(context).viewInsets.bottom
          
          ),
        child: Form(
          key: formKey,
          child: Column(
            children: [
          SizedBox(height: MediaQuery.sizeOf(context).height*.15,),
          
          
          
          Column(
          
          spacing: 16,
          children: [
          InputFieldNoIcon(controller: namecontroller,
           hintText: getTranslated(Strings.name, context)!, 
           
           errorText:provider.nameError ,
        validator: (str){
                   var error=   nameValidator(str);
                  //  var 
                   provider.setNameError(error);
                  //  return null;
                    return provider.nameError;
                    },
           ),
          
          InputField(controller: emailController,
           hintText: getTranslated(Strings.email, context)!, 
           iconData: Icons.alternate_email,
           
           validator: emailValidator,
           ), 
          
          InputAreaWithIcon(controller: messageController,
           hintText: getTranslated(Strings.messageToUs, context)!,
           
           iconData: Icons.mail,
          errorText:provider.bodyError ,
        validator: (str){
                   var error=   reportMessageValidator(str);
                  //  var 
                   provider.setBodyError(error);
                  //  return null;
                    return provider.bodyError;
                    },
           )
          
          ],),
          SizedBox(height: MediaQuery.sizeOf(context).height*.20,),
          
          MainButton(
            
          title: getTranslated(Strings.send, context),
          color: Theme.of(context).primaryColor,
          onTap: (){
          if (formKey.currentState!.validate()) {
            provider.sendMessage(context, widget.postId,
             namecontroller.text,
             messageController.text
             , emailController.text.trim());
          }
          },
          isLoading: provider.isLoading,
          ),
          SizedBox(height: MediaQuery.sizeOf(context).height*.05,),
          
          
          
            ],
          ),
        ),
          );
        }
        
        }),
        );
      }
    );
  }
}
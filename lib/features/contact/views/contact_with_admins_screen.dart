import 'package:deals_and_business/core/constants/strings.dart';
import 'package:deals_and_business/core/constants/translate.dart';
import 'package:deals_and_business/core/constants/validators.dart';
import 'package:deals_and_business/features/dashboard/widgets/app_bar.dart';
import 'package:deals_and_business/shared/providers/chat_provider.dart';
import 'package:deals_and_business/shared/widgets/back_button.dart';
import 'package:deals_and_business/shared/widgets/input_area_with_icon.dart';
import 'package:deals_and_business/shared/widgets/input_field.dart';
import 'package:deals_and_business/shared/widgets/input_field_no_icon.dart';
import 'package:deals_and_business/shared/widgets/main_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ContactWithAdminsScreen extends StatefulWidget {
  final String? postId;
  const ContactWithAdminsScreen({super.key, this.postId});

  @override
  State<ContactWithAdminsScreen> createState() => _ContactWithAdminsScreenState();
}

class _ContactWithAdminsScreenState extends State<ContactWithAdminsScreen> {

  //fields
  var firstNameController = TextEditingController();
    var lastNameController = TextEditingController();
  var messageController = TextEditingController();
    var emailController = TextEditingController();

 var formKey = GlobalKey<FormState>();




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar:AppBar(
     leading: MyBackButton(
      onTap: (){
        Navigator.pop(context);
      },
     ), 
      
      title: Text(getTranslated("contact_with_admins", context)!, 
      style: TextStyle(
        fontWeight: FontWeight.bold
      ),
      
      )
      ),
body: Consumer<ChatProvider>(builder: (context, provider,child){
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
      
      spacing: 8,
      children: [
      InputFieldNoIcon(controller: firstNameController,
       hintText: getTranslated(Strings.firstName, context)!,
       
        errorText:provider.fNameError ,
        validator: (str){
                   var error=   nameValidator(str);
                  //  var 
                   provider.setFNameError(error);
                  //  return null;
                    return provider.fNameError;
                    },
       
       ),
      InputFieldNoIcon(controller: lastNameController, hintText: 
      getTranslated(Strings.lastName, context)!, 
       errorText:provider.lNameError ,
        validator: (str){
                   var error=   nameValidator(str);
                  //  var 
                   provider.setLNameError(error);
                  //  return null;
                    return provider.lNameError;
                    },
      
      
      ),
      
      InputField(controller: emailController,
       hintText: getTranslated(Strings.email, context)!, 
       iconData: Icons.alternate_email,
       errorText:provider.emailError ,
          validator: (str){
                     var error=   emailValidator(str);
                    //  var 
                     provider.setEmailrror(error);
                    //  return null;
                      return provider.emailError;
                      },
       
       ), 
      
      InputAreaWithIcon(controller: messageController,
       hintText: getTranslated(Strings.messageToUs, context)!,
       
       iconData: Icons.mail,
        errorText:provider.messageError ,
        validator: (str){
                   var error=   messageValidator(str);
                  //  var 
                   provider.setMessageError(error);
                  //  return null;
                    return provider.messageError;
                    },
       )
      
      ],),
      SizedBox(height: MediaQuery.sizeOf(context).height*.15,),
      
      MainButton(
      title: getTranslated(Strings.send, context),
      color: Theme.of(context).primaryColor,
      onTap: (){
      if (formKey.currentState!.validate()) {
        provider.sendAdminMessage(context, 
        lName: lastNameController.text , 
        fName: firstNameController.text , 
        email: emailController.text.trim() , 
        message: messageController.text
        
        );
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
}
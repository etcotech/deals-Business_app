import 'package:deals_and_business/core/constants/strings.dart';
import 'package:deals_and_business/core/constants/translate.dart';
import 'package:deals_and_business/features/dashboard/widgets/app_bar.dart';
import 'package:deals_and_business/shared/widgets/back_button.dart';
import 'package:deals_and_business/shared/widgets/input_area_with_icon.dart';
import 'package:deals_and_business/shared/widgets/input_field.dart';
import 'package:deals_and_business/shared/widgets/input_field_no_icon.dart';
import 'package:deals_and_business/shared/widgets/main_button.dart';
import 'package:flutter/material.dart';

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
    child: Column(
      children: [
    SizedBox(height: MediaQuery.sizeOf(context).height*.15,),
    
    
    
    Column(
    
    spacing: 8,
    children: [
    InputFieldNoIcon(controller: firstNameController, hintText: getTranslated(Strings.firstName, context)!),
    InputFieldNoIcon(controller: lastNameController, hintText: getTranslated(Strings.lastName, context)!),
    
    InputField(controller: emailController,
     hintText: getTranslated(Strings.email, context)!, 
     iconData: Icons.alternate_email,
     
     
     ), 
    
    InputAreaWithIcon(controller: messageController,
     hintText: getTranslated(Strings.messageToUs, context)!,
     
     iconData: Icons.mail,
     )
    
    ],),
    SizedBox(height: MediaQuery.sizeOf(context).height*.15,),
    
    MainButton(
    title: getTranslated(Strings.send, context),
    color: Theme.of(context).primaryColor,
    onTap: (){
    
    },
    isLoading: false,
    ),
    SizedBox(height: MediaQuery.sizeOf(context).height*.05,),
    
    
    
      ],
    ),
  );
}

}),
    );
  }
}
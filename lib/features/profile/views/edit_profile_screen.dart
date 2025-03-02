import 'dart:io';

import 'package:deals_and_business/core/constants/images.dart';
import 'package:deals_and_business/core/constants/strings.dart';
import 'package:deals_and_business/core/constants/translate.dart';
import 'package:deals_and_business/core/constants/validators.dart';
import 'package:deals_and_business/data/models/user/profile_model.dart';
import 'package:deals_and_business/features/dashboard/widgets/app_bar.dart';
import 'package:deals_and_business/features/profile/providers/profile_provider.dart';
import 'package:deals_and_business/shared/widgets/back_button.dart';
import 'package:deals_and_business/shared/widgets/input_field.dart';
import 'package:deals_and_business/shared/widgets/main_button.dart';
import 'package:deals_and_business/shared/widgets/phone_field.dart';
import 'package:deals_and_business/shared/widgets/select_country_code_bottomsheet.dart';
import 'package:deals_and_business/shared/widgets/toasts.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
typedef TextCtrl= TextEditingController;
class EditProfileScreen extends StatefulWidget {
  final ProfileModel? profileModel;
  const EditProfileScreen({super.key, this.profileModel});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
var formKey = GlobalKey<FormState>();

var nameController = TextCtrl();
var userNameController = TextCtrl();
var  emailconteoller  = TextCtrl();
var phoneController = TextCtrl();
XFile? image;
final ImagePicker picker = ImagePicker();
 openStudio()async{
  var img = await picker.pickImage(source: ImageSource.gallery);
image = img;
setState(() {
  
});

 }
@override
void initState() {
  super.initState();
  
  if (widget.profileModel!=null) {
    emailconteoller.text = widget.profileModel!.name!;
        nameController.text = widget.profileModel!.name!;
        // phoneController = widget.profileModel.

  }
}
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.sizeOf(context).height;
        var screenWidth = MediaQuery.sizeOf(context).width;
    var profileProvider = Provider.of<ProfileProvider>(context);

    return Scaffold(
      appBar: AppBar(
leading:MyBackButton(
  onTap: (){
    Navigator.pop(context);
  },
),
title: Text(getTranslated(Strings.profile, context)!),
backgroundColor: Colors.transparent,
),
body: SizedBox.expand(
  child: SingleChildScrollView(

    padding: EdgeInsets.symmetric(
      vertical: 10,horizontal: 25
    ),
    child: Column(
      children: [

SizedBox(height: screenHeight*.05,)
,
       Container(
            
             padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                // borderRadius: BorderRadius.circular(8), 
                color: Colors.white, 
                boxShadow: [
                //  BoxShadow(
                //     offset: Offset(0, 1),
                //     color: Colors.grey[300]!,
                //     blurRadius: 4,
                //     spreadRadius: 1
                //   )
      
                ]
              ),
              child: CircleAvatar(
                radius: 50,
            backgroundColor: Colors.grey[300],    
backgroundImage: image!=null?

FileImage(File(image!.path))
: profileProvider.getUserPhoto()!.isEmpty?
AssetImage(Images.user): NetworkImage( profileProvider.getUserPhoto()!)
,
// child: Image.file(File(image!.path),)
              ),
         ),
   SizedBox(height: 8,), 

   image!=null?

   Row(mainAxisAlignment: MainAxisAlignment.center,
   children: [
   TextButton.icon(
    iconAlignment: IconAlignment.start,
    icon: Icon(Icons.image ,color: Theme.of(context).primaryColor,size: 15,),
    onPressed: (){
openStudio();

   }, label: Text(getTranslated('upload_profile', context)!)),

      TextButton.icon(
    iconAlignment: IconAlignment.start,
    icon: Icon(Icons.delete ,color: Colors.red,size: 15,),
    onPressed: (){
image=null;
setState(() {
  
});

   }, label: Text(getTranslated('delete_profile', context)!))
   
   ],
   ):
   TextButton.icon(
    iconAlignment: IconAlignment.start,
    icon: Icon(Icons.image ,color: Theme.of(context).primaryColor,size: 15,),
    onPressed: (){
openStudio();

   }, label: Text(getTranslated('upload_profile', context)!))
   ,
SizedBox(height: 32,)
,
Form(
  
  key: formKey,
  
  child: 
Column(
  spacing: 16,
  children: [
InputField(
  validator: nameValidator,
  iconData: Icons.person_outline,
  controller: nameController, hintText: 
getTranslated('user_name', context)!), 
InputField(  validator: emailValidator,

  iconData: Icons.mail_outline,
  controller: emailconteoller, hintText: 
getTranslated('email', context)!), 

InputField(
  validator:  nameValidator,
  iconData: Icons.alternate_email,
  controller: userNameController, hintText: 
getTranslated('user_name', context)!), 
PhoneField(
keyboardType: TextInputType.phone,
  validator: phoneFieldValidator,
  iconData: Icons.smartphone,
  controller: phoneController, 
  
  
  hintText: 
getTranslated('phone_number', context)!, 

code: profileProvider.countryData?.$2,
// flag:profileProvider.countryData?.$1 ,
onSelectCountryCode: (){
showModalBottomSheet(
              context: context,
              isDismissible: true, // Prevent dismissal
              enableDrag: false, // Prevent dragging to dismiss
              backgroundColor: Colors.transparent, // Make background transparent
              builder: (context) {
                return SelectCountryCodeBottomsheet(
                  onSelectCountry: (country){
                    profileProvider.setcountryData(country.flagUrl!,
                     country.phone!);

                  },
                );
              },
            );
},
), 


  ],
)

)
, 
SizedBox(height: 32,), 
MainButton(
  onTap: (){
    if (profileProvider.countryData==null) {
      
profileProvider.setcountryData('flag', '+966');

      // return;
    }
    if (formKey.currentState!.validate()) {
      profileProvider.updateProfile(
photo: image!=null?
File(image!.path):null
, 
email: emailconteoller.text, 
name: nameController.text , 
userName: userNameController.text, 
phone: phoneController.text


      );
    }
  },
  isLoading: profileProvider.isLoading,
  color: Theme.of(context).primaryColor,
  title: getTranslated('save_changes', context),
)
      ],
    ),
  ),
),
    );
  }
}
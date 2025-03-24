import 'package:deals_and_business/core/constants/strings.dart';
import 'package:deals_and_business/core/constants/translate.dart';
import 'package:deals_and_business/features/profile/providers/profile_provider.dart';
import 'package:deals_and_business/features/profile/views/edit_profile_screen.dart';
import 'package:deals_and_business/features/settings/views/change_user_gender_screen.dart';
import 'package:deals_and_business/features/settings/views/change_user_password_screen.dart';
import 'package:deals_and_business/features/settings/views/change_user_type_screen.dart';
import 'package:deals_and_business/shared/widgets/back_button.dart';
import 'package:deals_and_business/shared/widgets/delete_account_alert.dart';
import 'package:deals_and_business/shared/widgets/error_container.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class AccountSettings extends StatefulWidget {
  const AccountSettings({super.key});

  @override
  State<AccountSettings> createState() => _AccountSettingsState();
}

class _AccountSettingsState extends State<AccountSettings> {


@override
  void initState() {
    // TODO: implement initState
    super.initState();

  WidgetsBinding.instance.addPostFrameCallback((_){

context.read<ProfileProvider>().getUserProfile(

  userData: (user){
      //  emailconteoller.text =user!.email!;
      //   nameController.text =user.name!;
      //   userNameController.text = user.username!;
      //   var extractPhoneNumber =  extractPhone(user.phoneNational);
      //   if (extractPhoneNumber!=null) {
      //             phoneController.text =extractPhoneNumber;

      //   }

  }
);

  });

  }



  @override
  Widget build(BuildContext context) {
    return   Consumer<ProfileProvider>(
      builder: (context, provider,child) {

        if (provider.isLoading) {
     return     Scaffold(
      appBar: AppBar(
leading:MyBackButton(
  onTap: (){
    Navigator.pop(context);
  },
),
title: Text(getTranslated(Strings.profile, context)!),
backgroundColor: Colors.transparent,
),
body:SizedBox.expand(
  child: Center(child: CircularProgressIndicator(
    color: Theme.of(context).primaryColor,
  ),),
)

          );
        }
else 
if (provider.errorData!=null) {
return Scaffold(
    body: SizedBox.expand(
      child: Center(

child: ErrorContainer(
  onRetry: (){
context.read<ProfileProvider>().getUserProfile();
context.read<ProfileProvider>().getUserStats();
  },
  onLogin: (){


  },
  errorData: 
  provider.errorData!),

      ),
    ),
  );

}
else 

        return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: MyBackButton(
          onTap: (){
        Navigator.pop(context);
          },
        ),
        title: Text(getTranslated(Strings.accountSettings,
         context)!, 
         
         style: TextStyle(
        fontWeight: FontWeight.bold
          ),
         
         )
         
         ),
        
         body: SizedBox.expand(
        
        
          child: Column(
        spacing: 8,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        _title(context, Strings.editMyProfile, Icons.person_outline, (){
        
        
          Navigator.of(context).push(
        
        PageTransition(type: PageTransitionType.leftToRight, 
        
        child: EditProfileScreen()
        )
          );
        }),
        _title(context, Strings.changeUserGender, 
        
        data:  
        
         getGender(provider.profileModel!.genderId??0)!=null?
         getTranslated( getGender(provider.profileModel!.genderId??0), context):
      null,
        Icons.male, (){
        
          Navigator.of(context).push(
        
        PageTransition(type: PageTransitionType.leftToRight, 
        
        child: ChangeUserGenderScreen(
          profileModel: provider.profileModel,
          initialValue: provider.profileModel?.genderId.toString(),
        )
        )
          ).then((value){

            context.read<ProfileProvider>().getUserProfile(

  userData: (user){
      //  emailconteoller.text =user!.email!;
      //   nameController.text =user.name!;
      //   userNameController.text = user.username!;
      //   var extractPhoneNumber =  extractPhone(user.phoneNational);
      //   if (extractPhoneNumber!=null) {
      //             phoneController.text =extractPhoneNumber;

      //   }

  }
);
          });
        }),
        _title(context, Strings.changeUserType,
        
        data: 
        getType(provider.profileModel!.userTypeId??0)!=null?
        getTranslated(getType(provider.profileModel!.userTypeId??0), context):
        
        getType(provider.profileModel!.userTypeId??0)
        ,
         Icons.public, (){
           Navigator.of(context).push(
        
        
        PageTransition(type: PageTransitionType.leftToRight, 
        
        child: ChangeUserTypeScreen(
profileModel: provider.profileModel,
initialValue: provider.profileModel?.userTypeId.toString(),
        )
        )
          )
          .then((value){

            context.read<ProfileProvider>().getUserProfile(

  userData: (user){
      //  emailconteoller.text =user!.email!;
      //   nameController.text =user.name!;
      //   userNameController.text = user.username!;
      //   var extractPhoneNumber =  extractPhone(user.phoneNational);
      //   if (extractPhoneNumber!=null) {
      //             phoneController.text =extractPhoneNumber;

      //   }

  }
);
          });
        }),
        _title(context, Strings.changePassword, Icons.password, (){
        
           Navigator.of(context).push(
        
        
        PageTransition(type: PageTransitionType.leftToRight, 
        
        child: ChangeUserPasswordScreen()
        )
          );
        },  isDelete: false, data: "******"),
        _title(context, Strings.deleteAccount, Icons.delete_outline, (){
        
        showDialog(context: context, builder: (context){
          return DeleteAccountAlert(
            onConfirm: (){
              provider.delete(context, provider.getUserId(),
               (){});
            },
          );
        });
        
        
        },  isDelete: true),
        
        
        ] 
        
          )
        
         )
         
        );
      }
    );
  }



  Widget _title(BuildContext context,String key ,
   IconData iconData , Function? onTap
   , {

    String? data,
    bool isDelete=false
   }
   
   
   ){
    return GestureDetector(
      onTap: (){
        onTap!();
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8,  vertical: 10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(iconData, size: 20, 
            
            
            
            color
            
            
            
            : 
            isDelete? Colors.red:
            
            Theme.of(context).primaryColor,),
        SizedBox(width: 8,)
        , 

        data!=null? 
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          
          children: [
Text(getTranslated(key, context)!,
        style: TextStyle(
          fontWeight: FontWeight.bold ,
          fontSize: 14
        ),
        ), 

        Text(data,
        style: TextStyle(
          color: Colors.grey,
          fontSize: 10
        ),
        )



          ],):
        Text(getTranslated(key, context)!,
        style: TextStyle(
          fontWeight: FontWeight.bold ,
          fontSize: 14
        ),
        )
          ],
        ),
      ),
    );
  }
String? getGender(int gender){
  if (gender.toString()=="1") {
    return Strings.male;
  }
  if (gender.toString()=="2") {
        return Strings.female;

  }
  return null;
}
String? getType(int type){
  if (type.toString()=="1") {
    return Strings.professionalUser;
  }
  if (type.toString()=="2") {
        return Strings.individualUser;

  }
  return null;
}
}
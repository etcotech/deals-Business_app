import 'package:deals_and_business/core/constants/strings.dart';
import 'package:deals_and_business/core/constants/translate.dart';
import 'package:deals_and_business/data/models/user/profile_model.dart';
import 'package:deals_and_business/features/profile/providers/profile_provider.dart';
import 'package:deals_and_business/shared/providers/post_provider.dart';
import 'package:deals_and_business/shared/widgets/back_button.dart';
import 'package:deals_and_business/shared/widgets/main_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChangeUserGenderScreen extends StatefulWidget {
  final String? initialValue;
  final ProfileModel? profileModel;
  const ChangeUserGenderScreen({super.key, this.initialValue, this.profileModel});

  @override
  State<ChangeUserGenderScreen> createState() => _ChangeUserGenderScreenState();
}

class _ChangeUserGenderScreenState extends State<ChangeUserGenderScreen> {
  
  String? selectedGender;
List<String> genders =[
 Strings.male ,Strings.female
];
String? extractPhone(String? phone){
  if(phone==null || phone.isEmpty) return null;
  var phoneWithouthFirstLetter=phone.substring(1);
  var phoneWithoutSpaces = phoneWithouthFirstLetter.replaceAll(' ', ''); // Remove all spaces
return phoneWithoutSpaces ;
}
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.initialValue!=null) {
      if (widget.initialValue.toString()=="1") {
        selectedGender  = Strings.male;
      }
      if (widget.initialValue.toString()=="2") {
        selectedGender  = Strings.female;
      }
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return      Consumer<ProfileProvider>(
      builder: (context, provider,child) {
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
        title: Text(getTranslated(Strings.changeUserGender,
         context)!, 
         
         style: TextStyle(
        fontWeight: FontWeight.bold
          ),
         
         )
         
         ),
        
        body: SizedBox.expand(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        
         DropdownButton(
          padding: EdgeInsets.all(8),
          underline: SizedBox(),
                    isExpanded: true, // Make the dropdown fill the width
                  // Initial Value
                  value: selectedGender,
                  hint: Text(
        getTranslated('please_choose_value', context)! ,
        style: TextStyle(
           color: Colors.grey , fontSize: 18 , 
                        fontWeight: FontWeight.bold
        ),
        
                  ),
                  
                  // Down Arrow Icon
                  icon: const Icon(Icons.arrow_drop_down),    
                  
                  // Array list of items
                  items: genders.map((String items) {
                    return DropdownMenuItem(
                      
                      value: items,
                      child: Text(getTranslated(items, context)!, 
                      
                      style: TextStyle(
                        color: Theme.of(context).primaryColor , fontSize: 18 , 
                        fontWeight: FontWeight.bold
                      ),
                      ),
                    );
                  }).toList(),
                  // After selecting the desired option,it will
                  // change button value to selected value
                  onChanged: (String? newValue) { 
                    setState(() {
                      selectedGender=null;
                      selectedGender = newValue!;
                    });
                                    // widget.selectedSort!(selectedOption);
        
                  },
                ),
        SizedBox(height: 32,) , 
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: MainButton(
        isLoading: provider.isLoading ,
        color: Theme.of(context).primaryColor,
        title: getTranslated("save_changes", context),
        onTap: ()async{
          String? phone;
           var extractPhoneNumber =  extractPhone(widget.profileModel?.phoneNational);
        if (extractPhoneNumber!=null) {
                  phone =extractPhoneNumber;

        }
        await  provider.updateUserGender(
        name: widget.profileModel!.name, 
        email:widget.profileModel!.email, 
        userName: widget.profileModel!.username,
         genderId: selectedGender==Strings.male?1:2, 
         phone: phone,
         phoneCountry: widget.profileModel!.phoneCountry,
          );
        
          // Navigator.pop(context);
        },
          ),
        )
        
        ],
          ),
        ),
        
        );
      }
    );
  }
}
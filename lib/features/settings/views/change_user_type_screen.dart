import 'package:deals_and_business/core/constants/strings.dart';
import 'package:deals_and_business/core/constants/translate.dart';
import 'package:deals_and_business/data/models/user/profile_model.dart';
import 'package:deals_and_business/features/profile/providers/profile_provider.dart';
import 'package:deals_and_business/shared/widgets/back_button.dart';
import 'package:deals_and_business/shared/widgets/main_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChangeUserTypeScreen extends StatefulWidget {
  final String? initialValue;
  final ProfileModel? profileModel;
  const ChangeUserTypeScreen({super.key, this.initialValue, this.profileModel});

  @override
  State<ChangeUserTypeScreen> createState() => _ChangeUserTypeScreenState();
}

class _ChangeUserTypeScreenState extends State<ChangeUserTypeScreen> {
  
  String? selectedType;
List<String> types =[
 Strings.professionalUser ,Strings.individualUser
];
@override
  void initState() {
    // TODO: implement initState
    super.initState();
     if (widget.initialValue!=null) {
      if (widget.initialValue.toString()=="1") {
        selectedType  = Strings.professionalUser;
      }
      if (widget.initialValue.toString()=="2") {
        selectedType  = Strings.individualUser;
      }
    }
  }
  
  
  @override
  Widget build(BuildContext context) {
    return        Consumer<ProfileProvider>(
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
        title: Text(getTranslated(Strings.changeUserType,
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
                  value: selectedType,
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
                  items: types.map((String items) {
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
                      selectedType=null;
                      selectedType = newValue!;
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
        await  provider.updateUserGender(
        name: widget.profileModel!.name, 
        email:widget.profileModel!.email, 
        userName: widget.profileModel!.username,
         typeId: selectedType==Strings.professionalUser?1:2
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
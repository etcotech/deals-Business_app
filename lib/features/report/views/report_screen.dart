import 'package:deals_and_business/core/constants/strings.dart';
import 'package:deals_and_business/core/constants/translate.dart';
import 'package:deals_and_business/core/constants/validators.dart';
import 'package:deals_and_business/shared/providers/post_provider.dart';
import 'package:deals_and_business/shared/widgets/back_button.dart';
import 'package:deals_and_business/shared/widgets/input_area_with_icon.dart';
import 'package:deals_and_business/shared/widgets/main_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ReportScreen extends StatefulWidget {
  final String? postId;
  const ReportScreen({super.key, this.postId});

  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {


  String? selectedReason;
List<String> reasons =[
  Strings.fradReason ,Strings.duplicateReason ,Strings.spamReason ,Strings.wrongCategoryReason ,
  Strings.otherReason
];
var formKey = GlobalKey<FormState>();

var messageController = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(

        leading: MyBackButton(
          onTap: (){
            Navigator.pop(context);
          },
        ),
        title: 
        Text(getTranslated(Strings.reportApost, context)! , 
        
        
        style: TextStyle(
          fontWeight: FontWeight.bold
        ),
        )
        
        ,
      ),
      body: Consumer<PostProvider>(
        builder: (context,provider,child) {
          return SizedBox.expand(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(
                horizontal: 20
              ),
              child: Column(
                
              
                children: [
          SizedBox(height: MediaQuery.sizeOf(context).height*.20,),
          
          Form(
            key: formKey,
            child: Column(  crossAxisAlignment: CrossAxisAlignment.start,
          
          children: [
          
          
           Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            spacing: 16,
             children: [    Text(getTranslated(Strings.reportReason, context)! , 
            
            
            style: TextStyle(
             color: Colors.grey , fontWeight: FontWeight.bold
            ),
            ), 
               DropdownButton(
          padding: EdgeInsets.all(8),
          underline: SizedBox(),
                        isExpanded: true, // Make the dropdown fill the width
                      // Initial Value
                      value: selectedReason,
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
                      items: reasons .map((String items) {
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
                          selectedReason = newValue!;
                        });
               
                      },
                    ),
             ],
           ),
          
          SizedBox(height: 32,), 
          InputAreaWithIcon(controller: messageController, 
          hintText: getTranslated(Strings.messageToUs, context)!
          , iconData: Icons.mail,
          validator: reportMessageValidator,
          )
          
          
          ],
          
          
          ))
          , 
          // Spacer() , 
          SizedBox(height: MediaQuery.sizeOf(context).height*.20,),
          
          MainButton(

            isLoading: provider.isLoading,
            title: getTranslated(Strings.send, context),
          onTap: (){
            if (formKey.currentState!.validate()) {
              //send form 
          
            provider.reportPoast(context, widget.postId,
             reasons.indexOf(selectedReason!)+1, messageController.text,
              provider.getUserEmail()
              
              );
            }
          },
            color: Theme.of(context).primaryColor,
          )
          , 
          
          
          
          
              ],),
            ),
          );
        }
      ),
    );
  }
}
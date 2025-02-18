import 'package:deals_and_business/core/constants/translate.dart';
import 'package:deals_and_business/features/dashboard/widgets/app_bar.dart';
import 'package:deals_and_business/features/posts/widgets/add_images_container.dart';
import 'package:deals_and_business/shared/widgets/container_button.dart';
import 'package:deals_and_business/shared/widgets/input_area.dart';
import 'package:deals_and_business/shared/widgets/input_field.dart';
import 'package:deals_and_business/shared/widgets/input_field_no_icon.dart';
import 'package:deals_and_business/shared/widgets/main_button.dart';
import 'package:flutter/material.dart';

class AddPostScreen extends StatefulWidget {
  final bool? asGuest;
  const AddPostScreen({super.key, this.asGuest=false});

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  var adressController = TextEditingController();
    var descriptionController = TextEditingController();
    var priceController = TextEditingController();
bool acceptedTerms =false;
bool showAcceptError = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: MyAppBar(context, 
      isGuest:true,
      title: getTranslated('add_post', context), 
      onTapDrawer: (){

      },
      onCountryTap: (){

      }
      ),

      body: CustomScrollView(
      
        
        slivers: [
          SliverToBoxAdapter(
            
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                spacing: 10,
                children: [
                  SizedBox(height: 24,),
                  InputFieldNoIcon(controller: adressController,
                   hintText: 'address'),
              InputArea(controller: descriptionController, hintText: 'desc')
              , 
              InputField(controller: priceController,
              iconData: Icons.paid,
               hintText: 'price', 
               
               keyboardType: TextInputType.number,
               ), 
              
              
              ContainerButton(
                hint: 'category',
                icon: Icons.grid_4x4,
              ), 
              ContainerButton(
                hint: 'country',
                icon: Icons.location_on_outlined,
              ), 
              
              ContainerButton(
                hint: 'city',
                icon: Icons.location_on_outlined,
              ), 
              AddImagesContainer()
              
              , 
                         
                         Row(
              // mainAxisSize: MainAxisSize.min,
              children: [
                        Checkbox(
              activeColor: Theme.of(context).primaryColor,
              focusColor:Theme.of(context).primaryColor ,
              value: acceptedTerms, onChanged: (value){
                        
              
                        acceptedTerms = value!;
                        setState(() {
              
                        });
                        }) 
                        ,
              
              
              
                        SizedBox(width: 2,) ,
                
               Text.rich(
                
                
                TextSpan( 
                        text:getTranslated('i_read', context)! ,
                         style: TextStyle(
              
                fontWeight: FontWeight.bold ,fontSize: 15
               ),
                children: [
                        TextSpan(
                        
              text: ' ${getTranslated('terms_and_conditions', context)!}', 
              
              style: TextStyle(
              
                color: Theme.of(context).primaryColor ,
                fontWeight: FontWeight.bold ,fontSize: 15
               ),
                        )
                ]
              )
              , 
                              overflow: TextOverflow.ellipsis, // Handle overflow
              
              ),
                   
                        
                        
                        
              ],
                         ),
              showAcceptError?
                         Text(getTranslated('terms_must_accept', context)! , 
                         
                         style: TextStyle(
              color: Colors.red ,
              fontSize: 12
                         ),
                         ):SizedBox.shrink(),
                       SizedBox(height: 24,),
              
              
                ],
              ),
            ),
          )
        ],
      ),

      bottomNavigationBar: Container(

        padding: EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(color: Colors.white),
        child: MainButton(
          title: 'publish',
          color: Theme.of(context).primaryColor,
          onTap: (){

          },
        ),
      ),
    );
  }
}
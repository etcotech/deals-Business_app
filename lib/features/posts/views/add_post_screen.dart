import 'package:deals_and_business/core/constants/translate.dart';
import 'package:deals_and_business/core/constants/validators.dart';
import 'package:deals_and_business/features/dashboard/widgets/app_bar.dart';
import 'package:deals_and_business/features/posts/widgets/add_images_container.dart';
import 'package:deals_and_business/shared/providers/post_provider.dart';
import 'package:deals_and_business/shared/widgets/categories_bottomsheet.dart';
import 'package:deals_and_business/shared/widgets/cities_bottomsheet.dart';
import 'package:deals_and_business/shared/widgets/container_button.dart';
import 'package:deals_and_business/shared/widgets/countries_bottomsheet.dart';
import 'package:deals_and_business/shared/widgets/input_area.dart';
import 'package:deals_and_business/shared/widgets/input_field.dart';
import 'package:deals_and_business/shared/widgets/input_field_no_icon.dart';
import 'package:deals_and_business/shared/widgets/main_button.dart';
import 'package:deals_and_business/shared/widgets/toasts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
var formKey = GlobalKey<FormState>();

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

      body: Consumer<PostProvider>(
        builder: (context ,provider,child) {
          return CustomScrollView(
          
            
            slivers: [
              SliverToBoxAdapter(
                
                child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Form(
                    key: formKey,
                    child: Column(
                      spacing: 10,
                      children: [
                        SizedBox(height: 24,),
                        InputFieldNoIcon(controller: adressController,
                         hintText: 'title',
                         validator: titleValidator,
                         ),
                    InputArea(controller: descriptionController, hintText: 'desc' ,
                    validator: descValidator,
                    )
                    , 
                    InputField(controller: priceController,
                    iconData: Icons.paid,
                     hintText: 'price', 
                     validator: priceValidator,
                     keyboardType: TextInputType.number,
                    
                     ), 
                    
                    
                    GestureDetector(
                      onTap: (){
                          showModalBottomSheet(
                    context: context,
                    isDismissible: false, // Prevent dismissal
                    enableDrag: false, // Prevent dragging to dismiss
                    backgroundColor: Colors.transparent, // Make background transparent
                    builder: (context) {
                      return CategoriesBottomsheet(
                        onSelectCategory: (cat){
                        provider.setCategory(
                          cat
                        );
                        },
                      );
                    },
                                    );
                      },
                      child: ContainerButton(
                        title: provider.selectedCat?.name
                        ,
                        hint: 'category',
                        icon: Icons.grid_4x4,
                      ),
                    ), 
                                     GestureDetector(
                    onTap: (){
                          showModalBottomSheet(
                    context: context,
                    isDismissible: false, // Prevent dismissal
                    enableDrag: false, // Prevent dragging to dismiss
                    backgroundColor: Colors.transparent, // Make background transparent
                    builder: (context) {
                      return CountriesBottomsheet(
                        onSelectCountry: (country){
                        provider.setCountry(
                          country
                        );
                        },
                      );
                    },
                                    );
                      },
                      child: ContainerButton(
                    
                        title: provider.selectedCountry?.name
                        
                        ,
                        hint: 'country',
                        icon: Icons.location_on_outlined,
                      ),
                    ), 
                    
                    GestureDetector(
                      onTap: (){
                        if (provider.selectedCountry==null) {
                          showErrorMessage(context, 'Select Country first!');
                        }else{
                    
                     showModalBottomSheet(
                    context: context,
                    isDismissible: false, // Prevent dismissal
                    enableDrag: false, // Prevent dragging to dismiss
                    backgroundColor: Colors.transparent, // Make background transparent
                    builder: (context) {
                      return CitiesBottomsheet(
                        onSelectCity: (city){
                        provider.setCity(
                          city
                        );
                        },
                      );
                    },
                                    );
                    
                    
                        }
                      },
                      child: ContainerButton(
                        title: provider.selectedCity?.name
                        ,
                        hint: 'city',
                        icon: Icons.location_on_outlined,
                      ),
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
                ),
              )
            ],
          );
        }
      ),

      bottomNavigationBar: Container(

        padding: EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(color: Colors.white),
        child: Consumer<PostProvider>(
        builder: (context ,provider,child) {
            return
            provider.isLoading?
            Center(child: CircularProgressIndicator(color: Theme.of(context).primaryColor,),)
            :
            
            
             MainButton(
              title: 'publish',
              color: Theme.of(context).primaryColor,
              onTap: (){
                


              if (provider.selectedCat==null) {
              showErrorMessage(context, 'You should choose category');
              return;
            }
            if (provider.selectedCity==null) {
              showErrorMessage(context, 'You should choose City');
              return;
            }
            if (provider.selectedCountry==null) {
              showErrorMessage(context, 'You should choose Country');
              return;
            }
       if (provider.files.isEmpty) {
              showErrorMessage(context, 'You should choose images');
              return;
            }
      

      showAcceptError = !acceptedTerms;
                setState(() {
                  
                });
             if (showAcceptError) {
               return;
             }     
            if (formKey.currentState!.validate()) {
              
           provider.addPost(context , 
           adressController.text.trim() ,
           descriptionController.text.trim(),
           priceController.text.trim()
           
           );

            
            
            }
              },
            );
          }
        ),
      ),
    );
  }
}
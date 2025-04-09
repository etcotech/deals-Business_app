import 'package:deals_and_business/core/constants/images.dart';
import 'package:deals_and_business/core/constants/strings.dart';
import 'package:deals_and_business/core/constants/translate.dart';
import 'package:deals_and_business/core/constants/validators.dart';
import 'package:deals_and_business/features/dashboard/widgets/app_bar.dart';
import 'package:deals_and_business/features/posts/widgets/add_images_container.dart';
import 'package:deals_and_business/features/settings/views/terms_and_conditions_screen.dart';
import 'package:deals_and_business/shared/providers/post_provider.dart';
import 'package:deals_and_business/shared/widgets/categories_bottomsheet.dart';
import 'package:deals_and_business/shared/widgets/cities_bottomsheet.dart';
import 'package:deals_and_business/shared/widgets/container_button.dart';
import 'package:deals_and_business/shared/widgets/countries_bottomsheet.dart';
import 'package:deals_and_business/shared/widgets/input_area.dart';
import 'package:deals_and_business/shared/widgets/input_field.dart';
import 'package:deals_and_business/shared/widgets/input_field_no_icon.dart';
import 'package:deals_and_business/shared/widgets/main_button.dart';
import 'package:deals_and_business/shared/widgets/select_category_bottomsheet.dart';
import 'package:deals_and_business/shared/widgets/toasts.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
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
                        InputFieldNoIcon(
                        errorText: provider.titleError,
                          
                          controller: adressController,
                         hintText: getTranslated(Strings.title, context)!,
                         validator: (str){
                          var error = titleValidator(str);
                       provider.setTitleError(error);
                  //  return null;
                   
                      return provider.titleError;
                         },
                         ),
                    InputArea(
                      errorText: provider.bodyError,
                      controller: descriptionController, hintText:
                      
                      getTranslated('desc', context)!
                       ,
                    validator: (str){

                      var error = descValidator(str);
                       provider.setBodyError(error);
                  //  return null;
                   
                      return provider.bodyError;
                    },

                    )
                    , 
                    InputField(controller: priceController,
                    // iconData: Icons.paid,
                    iconAsset: Images.currency,
                     hintText:  getTranslated(Strings.price, context)!, 
                     validator: priceValidator,
                     keyboardType: TextInputType.number,
                    
                     ), 
                    
                    
                    GestureDetector(
                      onTap: (){
                          showModalBottomSheet(
                    context: context,
                    isDismissible: true, // Prevent dismissal
                    enableDrag: false, // Prevent dragging to dismiss
                    backgroundColor: Colors.transparent, // Make background transparent
                    builder: (context) {
                      return SelectCategoryBottomsheet(
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
                        title: provider.selectedCat2?.name
                        ,
                        hint: getTranslated(Strings.categoryField, context),
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
                        hint:getTranslated(Strings.country, context),
                        icon: Icons.location_on_outlined,
                      ),
                    ), 
                    
                    GestureDetector(
                      onTap: (){
                        if (provider.selectedCountry==null) {
                          showErrorMessage(context, 
                          getTranslated(Strings.selectCountryfirst, context));
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
                        hint: getTranslated(Strings.city, context),
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
                              recognizer: TapGestureRecognizer()..onTap = (){
                                Navigator.push(context, 
                                
                                PageTransition(type: PageTransitionType.leftToRight, child: TermsAndConditionsScreen())
                                );
                                
                              },
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

        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        decoration: BoxDecoration(color: Colors.white),
        child: Consumer<PostProvider>(
        builder: (context ,provider,child) {
            return
            provider.isLoading?
            Center(child: CircularProgressIndicator(color: Theme.of(context).primaryColor,),)
            :
            
            
             MainButton(
              title: getTranslated(Strings.publish, context),
              color: Theme.of(context).primaryColor,
              onTap: (){
                

provider.clearErrors();
              if (provider.selectedCat2==null) {
              showErrorMessage(context, getTranslated(Strings.selectCategory, context));
              return;
            }
            if (provider.selectedCity==null) {
              showErrorMessage(context,  getTranslated(Strings.selectCity, context));
              return;
            }
            if (provider.selectedCountry==null) {
              showErrorMessage(context,  getTranslated(Strings.selectCountryfirst, context));
              return;
            }
       if (provider.files.isEmpty) {
              showErrorMessage(context,  getTranslated(Strings.selectImages, context));
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
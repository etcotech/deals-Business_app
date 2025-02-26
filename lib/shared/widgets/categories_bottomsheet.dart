import 'package:deals_and_business/core/constants/strings.dart';
import 'package:deals_and_business/core/constants/translate.dart';
import 'package:deals_and_business/data/models/category/category_model.dart';
import 'package:deals_and_business/shared/widgets/mini_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../../features/home/providers/home_provider.dart';

class CategoriesBottomsheet extends StatefulWidget {
  final Function(CategoryModel)? onSelectCategory;
    final Function()? onDeleteCategory;

  const CategoriesBottomsheet({super.key, this.onSelectCategory, this.onDeleteCategory});

  @override
  State<CategoriesBottomsheet> createState() => _CategoriesBottomsheetState();
}

class _CategoriesBottomsheetState extends State<CategoriesBottomsheet> {
@override
  void initState() {
    // TODO: implement initState
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_){
context.read<HomeProvider>().getCategories(context);

    });
  }
   int? selectedCat;

      CategoryModel? categoryModel;


  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context,  provider, child) {

        return Container(
          height: MediaQuery.sizeOf(context).height/2,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(20),
          ),
          ),
          child: 
          
          Builder(
            builder: (context) {


        if (provider.isCategoryLoading) {
          return Center(child: CircularProgressIndicator(color: Theme.of(context).primaryColor,),);
          
        }
              return Column(
                children: [
                  // Drag handle
                  Container(
                    margin: EdgeInsets.only(top: 8),
                    width: 40,
                    height: 4,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                  SizedBox(height: 16),
                  
                  Builder(
                    builder: (context) {
                      return
                      provider.isCountryLoading?
                      Expanded(child: Center(child: CircularProgressIndicator(color: Theme.of(context).primaryColor,),))
              
                      : Expanded(
                        child: Column(
                          children: [
                            Text(
                        'Categories',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),              SizedBox(height: 8),
                      
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 14),
                              child: Expanded(
                                child: ListView.builder(
                                  itemCount: provider.categoris.length,
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) {
                                    var cateogory = provider.categoris[index];
                                    return ListTile(
                                      onTap: (){
              selectedCat = cateogory.id;
              categoryModel =cateogory;
              setState(() {
                
              });
 if (widget.onSelectCategory!=null && categoryModel!=null) {
                                    widget.onSelectCategory!(categoryModel!);
                                  }                                      },
                                      title: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Icon(
                                            getIcon(cateogory.iconClass, 
                                            
                                            
                                            ), 
              color: selectedCat!=null? selectedCat==cateogory.id?Theme.of(context).primaryColor 
               : Colors.grey:   Colors.grey,
              
                                          ), 
                                
                                          SizedBox(width: 3,),
                                          Text(cateogory.name!,
                                          style: TextStyle(
                                            color: selectedCat!=null?
                                             selectedCat==cateogory.id?Theme.of(context).primaryColor 
               : Colors.grey:   Colors.grey,
                                          ),
                                          )
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          
                          Spacer(), 
              
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                MiniButton(title:getTranslated(Strings.apply, context),
                                color: Theme.of(context).primaryColor, 
                                
                                onTap: (){
                                  if (widget.onSelectCategory!=null && categoryModel!=null) {
                                    widget.onSelectCategory!(categoryModel!);
                                  }
                                  Navigator.pop(context);
                                },
                                ),
              MiniButton(title:getTranslated(Strings.delte, context),
                                color: Colors.grey, 
                                
                                onTap: (){
                              if (widget.onDeleteCategory!=null) {
                                                              widget.onDeleteCategory!();

                              }
                                  Navigator.pop(context);
                                },
                                ),
              
              
              
                              ],
                            ),
                          ), 
                          SizedBox(height: 24,)
                          ],
              
                        ),
                      );
                    }
                  ),
                  
                ],
              );
            }
          ),
        );
      }
    );
  }

  getIcon(String? icon){
    switch (icon) {
      case  "fas fa-store":
         return  FontAwesomeIcons.store;
        case  "fas fa-cog":
         return  FontAwesomeIcons.gear;
         case  "fas fa-users":
         return  FontAwesomeIcons.users;


      default:
               return  Icons.category;

    }
  }
}